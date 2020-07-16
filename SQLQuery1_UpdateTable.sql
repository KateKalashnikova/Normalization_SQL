/* Alter/Update excisting table */

ALTER TABLE Students
ADD DateOfBirth date

EXEC sp_rename 'Students.DateOfBirth', 'Date_Of_Birth', 'COLUMN'

UPDATE Students
SET Date_Of_Birth='1988-05-06'
WHERE Student_ID=1002457

UPDATE Students
SET Date_Of_Birth='1987-03-15'
WHERE Student_ID=1002568

UPDATE Students
SET Date_Of_Birth='1986-12-13'
WHERE Student_ID=1005523

UPDATE Students
SET Date_Of_Birth='1981-11-02'
WHERE Student_ID=1005786

UPDATE Students
SET Date_Of_Birth='1990-10-25'
WHERE Student_ID=1006589

/*Select to view the results*/

SELECT Student_ID
FROM Students
