CREATE TABLE housing_price_sf (
	date TIMESTAMP,
	title VARCHAR,
	link VARCHAR,
	price INT,
	brs INT,		
	sqft INT,
	hood VARCHAR,
	bath VARCHAR,
	amenities VARCHAR
);

SELECT hood, ROUND(AVG(price), 2) as "total"
FROM housing_price_sf
GROUP BY hood
ORDER BY total
LIMIT 5;

SELECT hood, ROUND(AVG(price), 2) as "total"
FROM housing_price_sf
GROUP BY hood
ORDER BY total DESC
LIMIT 5;

--
CREATE TABLE clean_sf (
	price INT,		
	beds INT,
	bath DECIMAL,
	laundry VARCHAR,
	pets VARCHAR,
	housing_type VARCHAR,
	parking	VARCHAR,
	hood_district INT
);

SELECT hood_district, ROUND(AVG(price), 2) as "total"
FROM clean_sf
GROUP BY hood_district
ORDER BY total
LIMIT 5;

SELECT hood, ROUND(AVG(price), 2) as "total"
FROM clean_sf
GROUP BY hood_district
ORDER BY total DESC
LIMIT 5;
