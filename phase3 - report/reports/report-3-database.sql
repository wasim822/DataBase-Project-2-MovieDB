--report 3
--Filtering and sorting (WHERE, ORDER BY)
-- finds all customer that use VS cards 

SELECT first_name || ' ' || last_name AS full_name, credit_card_number, card_type
FROM customer
where card_type = 'VS'
ORDER BY full_name;