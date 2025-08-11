--report 4
-- Group functions
-- finds avg price of movies for both sd_price and hd_price and rounds to two 


SELECT
  ROUND(AVG(price_sd), 2) AS avg_sd_price,
  ROUND(AVG(price_hd), 2) AS avg_hd_price
FROM movie;