-- CREATING TABLES
--note go in order so there are no foreign key constraint
--part 1

CREATE TABLE Director (
    director_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE Actor (
    actor_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    dob DATE,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE Advisory (
    advisory_id SERIAL PRIMARY KEY,
    short_desc TEXT,
    full_desc TEXT
);

CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    parent_id INT REFERENCES Category(category_id)
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT CHECK (phone ~ '^\d{3}\.\d{3}\.\d{4}$'),
    address TEXT,
    postal_code TEXT CHECK (postal_code ~ '^[A-Z]\d[A-Z]\d[A-Z]\d$'),
    credit_card_number TEXT CHECK (credit_card_number ~ '^\d+$'),
    card_type TEXT CHECK (card_type IN ('AX', 'MC', 'VS'))
);

--PART 2
CREATE TABLE Movie (
    movie_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_minutes INT CHECK (duration_minutes > 0),
    rating TEXT CHECK(rating in ('g', 'pg', '14a' ,'18a' ,'r')) ,
    release_date DATE,
    is_new_release BOOLEAN DEFAULT FALSE,
    is_most_popular BOOLEAN DEFAULT FALSE,
    is_coming_soon BOOLEAN DEFAULT FALSE,
    price_sd NUMERIC(5,2),
    price_hd NUMERIC(5,2),
    director_id INT REFERENCES Director(director_id)
);
--part 3
CREATE TABLE Rental (
    rental_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    movie_id INT REFERENCES Movie(movie_id),
    rental_date TIMESTAMP,
    start_view_date TIMESTAMP CHECK (start_view_date > rental_date),
    expiry_date TIMESTAMP CHECK (expiry_date > start_view_date),
    price_paid NUMERIC(5,2),
    cc_number TEXT CHECK (cc_number ~ '^\d+$'),
    cc_type TEXT CHECK (cc_type IN ('AX', 'MC', 'VS')),
    customer_rating INT CHECK (customer_rating BETWEEN 1 AND 5)
);

CREATE TABLE Wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id),
    movie_id INT REFERENCES Movie(movie_id),
    added_date DATE
);

--PART 4
CREATE TABLE Movie_Category (
    movie_id INT REFERENCES Movie(movie_id),
    category_id INT REFERENCES Category(category_id),
    PRIMARY KEY (movie_id, category_id)
);

CREATE TABLE Movie_Advisory (
    movie_id INT REFERENCES Movie(movie_id),
    advisory_id INT REFERENCES Advisory(advisory_id),
    PRIMARY KEY (movie_id, advisory_id)
);

CREATE TABLE Movie_Actor (
    movie_id INT REFERENCES Movie(movie_id),
    actor_id INT REFERENCES Actor(actor_id),
    role_name TEXT,
    PRIMARY KEY (movie_id, actor_id)
);