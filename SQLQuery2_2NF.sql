/* creating table in db to use as an example*/
CREATE TABLE vgsales (
		rankvg int primary key,
		namevg varchar(50),
		platformvg varchar(50),
		yearvg int,
		genre varchar(50),
		publisher varchar(50),
		NA_Sales numeric (5,2),
		EU_Sales numeric (5,2),
		JP_Sales numeric (5,2),
		Other_Sales numeric (5,2),
		Global_Sales numeric (5,2),
		);

INSERT INTO vgsales (
				rankvg, 
				namevg, 
				platformvg, 
				yearvg, 
				genre, 
				publisher, 
				NA_Sales, 
				EU_Sales,
				JP_Sales,
				Other_Sales,
				Global_Sales
				)
VALUES		('1','Wii Sports', 'Wii', '2006', 'Sports', 'Nintendo', '41.49', '29.02', '3.77', '8.46', '82.74'),
			('2', 'Super Mario Bros', 'NES', '1985', 'Platform', 'Nintendo', '29.08', '3.58', '6.81', '0.77', '40.24')
			;

SELECT * FROM vgsales	

/*selecting Sales attributes into new table to comply with 2NF*/

SELECT	namevg, platformvg, yearvg, genre, publisher
INTO	vgames
FROM	vgsales

SELECT * FROM vgames

ALTER TABLE vgsales
DROP COLUMN namevg, platformvg, yearvg, genre, publisher





			