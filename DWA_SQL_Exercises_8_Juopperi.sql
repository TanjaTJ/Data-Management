--1
SELECT Teacher.surname
FROM Teacher
UNION
SELECT Student.surname
FROM Student

--2
SELECT city
FROM Campus AS S1
WHERE EXISTS(SELECT * 
FROM Student WHERE Student.city = S1.city)

--3
SELECT city
FROM Student AS S1
WHERE NOT EXISTS(SELECT * 
FROM Campus WHERE Campus.city = S1.city)

--4
SELECT DATENAME(YEAR, Teacher.birth_date) AS 'Year_birth'
FROM Teacher
WHERE EXISTS(SELECT Student.birth_date
FROM Student)
ORDER BY Year_birth

--5
SELECT DATENAME(YEAR, Teacher.birth_date)
FROM Teacher
WHERE NOT EXISTS DATENAME(YEAR,SELECT Student.birth_date)
FROM Student

--6
SELECT DATENAME(YEAR, Teacher.birth_date)
FROM Teacher
EXCEPT SELECT (DATENAME(YEAR, Student.birth_date))
FROM Student

--7
SELECT  DATENAME(YEAR, Student.birth_date) AS 'Year_of_birth'
FROM Student
EXCEPT SELECT (DATENAME(YEAR, Teacher.birth_date))
FROM Teacher
ORDER BY Year_of_birth
