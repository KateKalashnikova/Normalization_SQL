-- Create master table from raw data flat file

-- Select values from master table into new tables

SELECT	StudentID, First_name, LastName
INTO	Students
FROM	MasterStudents

SELECT	StudentID, MidtermExam, FinalExam, Assignment1, Assignment2
INTO	Exams
FROM	MasterStudents

SELECT	StudentID, StudentAverage, Grade
INTO	FinalGrades
FROM	MasterStudents

-- Altering tables

ALTER TABLE	Exams
ADD ExamDate datetime2;

ALTER TABLE	FinalGrades
ADD RateID INT;

UPDATE FinalGrades
SET RateID = CASE WHEN StudentAverage >= 0.90 THEN 1
			      WHEN StudentAverage >=0.85 AND StudentAverage < 0.89  THEN 2
				  WHEN StudentAverage >=0.80 AND StudentAverage < 0.84 THEN 3
				  WHEN StudentAverage >=0.77 AND StudentAverage < 0.79 THEN 4
				  WHEN StudentAverage >=0.73 AND StudentAverage < 0.76 THEN 5
				  WHEN StudentAverage >=0.70 AND StudentAverage < 0.72 THEN 6
				  WHEN StudentAverage >=0.65 AND StudentAverage < 0.69 THEN 7
				  WHEN StudentAverage >=0.60 AND StudentAverage < 0.64 THEN 8
				  WHEN StudentAverage >=0.55 AND StudentAverage < 0.59 THEN 9
				  WHEN StudentAverage >=0.50 AND StudentAverage < 0.54 THEN 10
				  WHEN StudentAverage >=0 AND StudentAverage < 0.49 THEN 11
				  ELSE 0
				  END
WHERE StudentAverage IN (0.63, 0.71, 0.58, 0.6, 0.67, 0.66, 0.7, 0.49, 0.42, 0.54, 0.88, 0.93, 0.5, 0.57, 0.75, 0.76, 0.89, 
							0.82, 0.61, 0.77);

SELECT * FROM FinalGrades

SELECT * FROM Exams

SELECT * FROM Students

-- Check for duplicates in each table before defining PK and FK

SELECT	
	studentID,
	First_name,
	Lastname,
COUNT(*) 
	occurances
FROM	 
	Students
GROUP BY
	studentID,
	First_name,
	Lastname
HAVING COUNT(*) > 1;

--

SELECT	
	StudentID, 
	MidtermExam,
	Finalexam,
	Assignment1,
	Assignment2,
	ExamDate,
COUNT(*) 
	occurances
FROM	 
	Exams
GROUP BY
	StudentID, 
	MidtermExam,
	Finalexam,
	Assignment1,
	Assignment2,
	ExamDate
HAVING COUNT(*) > 1;

--

SELECT
	StudentID,
	StudentAverage,
	Grade,
	RateID,
COUNT (*)
	occurances
FROM 
	FinalGrades
GROUP BY
	StudentID,
	StudentAverage,
	Grade,
	RateID

HAVING COUNT(*) > 1;

-- No duplicates found

-- Defining PK and FK

ALTER TABLE	Students
ADD CONSTRAINT	PK_StudentID 
PRIMARY KEY	(StudentID);

ALTER TABLE Exams
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

ALTER TABLE FinalGrades
ADD FOREIGN KEY (StudentID) REFERENCES Students(StudentID);

-- Creating a table with StudentAverage and grades RateID


SELECT	Students.StudentID, Students.First_name, Students.LastName,
		Exams.MidtermExam, Exams.FinalExam, Exams.Assignment1, Exams.Assignment2, Exams.ExamDate,
		FinalGrades.StudentAverage, FinalGrades.Grade, FinalGrades.RateID
INTO	StudentGrades
FROM	Students
INNER JOIN Exams 
ON Exams.StudentID = Students.StudentID
INNER JOIN FinalGrades 
ON Exams.StudentID = FinalGrades.StudentID;

SELECT * FROM StudentGrades
	
-- Create a VIEW with all students with grade rates 1 to 5

CREATE VIEW StudentRates1_5 AS
SELECT		Students.StudentID, Students.First_name, Students.LastName,
			FinalGrades.StudentAverage, FinalGrades.Grade, FinalGrades.RateID
FROM		Students
INNER JOIN	FinalGrades
ON Students.StudentID = FinalGrades.StudentID
WHERE RateID >=1 and RateID <=5;

SELECT * FROM StudentRates1_5

-- Create a VIEW with all students that Fail

CREATE VIEW StudentsFail AS
SELECT		Students.StudentID, Students.First_name, Students.LastName,
			FinalGrades.StudentAverage, FinalGrades.Grade, FinalGrades.RateID
FROM		Students
INNER JOIN	FinalGrades
ON Students.StudentID = FinalGrades.StudentID
WHERE RateID =11;

SELECT * FROM StudentsFail	

