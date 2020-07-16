SELECT * FROM cars

-- rename 'state' column

EXEC sp_rename 'cars.state', 'condition', 'COLUMN'

-- check for dupllicate rows

SELECT 
    manufacturer_name, 
    model_name,
	transmission,
	color,
	odometer_value,
	year_produced,
	engine_fuel,
	engine_has_gas,
	engine_has_gas,
	engine_capacity,
	body_type,
	has_warranty,
	condition,
	price_usd,
	is_exchangeable,
	number_of_photos,
	number_of_photos,
	duration_listed,
	COUNT(*) occurrences
FROM cars
GROUP BY
    manufacturer_name, 
    model_name,
	transmission,
	color,
	odometer_value,
	year_produced,
	engine_fuel,
	engine_has_gas,
	engine_has_gas,
	engine_capacity,
	body_type,
	has_warranty,
	condition,
	price_usd,
	is_exchangeable,
	number_of_photos,
	number_of_photos,
	duration_listed
HAVING 
    COUNT(*) > 1;

-- create ID column/ PK to calculate the max id of each data row use the SQL MAX function

ALTER TABLE cars
ADD ID INT IDENTITY

ALTER TABLE cars
ADD CONSTRAINT PK_ID 
PRIMARY KEY (ID);

--  use the SQL MAX function to calculate the max id of each data row and delete the duplicates

DELETE FROM cars 
WHERE ID NOT IN 
(
			SELECT MAX(ID) AS MAXREcordID
			FROM cars 
            GROUP BY manufacturer_name, 
					 model_name,
					 transmission,
					 color,
					 odometer_value,
					 year_produced,
					 engine_fuel,
					 engine_has_gas,
					 engine_has_gas,
					 engine_capacity,
					 body_type,
					 has_warranty,
					 condition,
					 price_usd,
					 is_exchangeable,
					 number_of_photos,
					 number_of_photos,
					 duration_listed
					);










