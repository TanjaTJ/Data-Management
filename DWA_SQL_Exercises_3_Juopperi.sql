--1
SELECT COUNT(*)
FROM CourseGrade

--2
SELECT SUM(CourseGrade.grade)
FROM CourseGrade

--3
SELECT COUNT(Teacher.surname)
FROM Teacher
WHERE salary > 16000

--4
SELECT MAX(Teacher.salary) AS 'Maximum salary', MIN(Teacher.salary) AS 'Minimum salary', AVG(Teacher.salary) AS 'Average salary', SUM(Teacher.salary) AS 'Total salary'
FROM Teacher

--5
SELECT AVG(CourseGrade.grade) AS 'Average', CAST(AVG(CourseGrade.grade * 1.0) AS DECIMAL(2,0)) AS 'Average of x', CAST(AVG(CourseGrade.grade * 1.0) AS DECIMAL(2,0)) AS 'Average of x'
FROM CourseGrade

--6
SELECT COUNT(CourseGrade.grade)
FROM CourseGrade
WHERE grade = 3

--7
SELECT CAST(AVG(CourseGrade.grade * 1.0) AS DECIMAL(2,0))
FROM CourseGrade
WHERE student_number = 'o473'

--8
SELECT COUNT(Student.surname)
FROM Student
WHERE surname LIKE 'K%'

--9
SELECT DISTINCT COUNT(Teacher.surname)
FROM Teacher
WHERE surname LIKE 'T%'

--10
SELECT Student.email AS 'Default email'
FROM Student
WHERE email LIKE '%takkula.fi' 
ORDER BY email ASC

--11
SELECT DATENAME(MONTH, Student.birth_date), Student.surname, Student.first_name, Student.student_number
FROM Student
ORDER BY birth_date ASC, surname ASC, first_name ASC, student_number ASC

--12
SELECT COUNT(DATENAME(MONTH, Student.birth_date))
FROM Student

--13
SELECT DATENAME(QUARTER, CourseInstance.start_date) AS 'Quarter', CourseInstance.start_date, CourseInstance.course_code, CourseInstance.instance_number
FROM CourseInstance
ORDER BY Quarter ASC, start_date ASC, course_code ASC

--14
SELECT DATENAME(MONTH, Student.birth_date) AS 'Month', DATENAME(DAY, Student.birth_date) AS 'Day', Student.surname, Student.first_name, Student.student_number
FROM Student
ORDER BY Month, Day, surname, first_name, student_number

--15
SELECT COUNT(DATENAME(WEEKDAY, Student.birth_date)) 
FROM Student

--16
SELECT CONVERT(DATE, SYSDATETIME()) AS 'Current date', DATENAME(WEEKDAY, SYSDATETIME()) AS 'Weekday'

--17
SELECT DATEDIFF(DAY, CourseInstance.start_date, CourseInstance.end_date) AS 'Course length'
FROM CourseInstance
WHERE start_date IS NOT NULL AND end_date IS NOT NULL
ORDER BY [Course length], course_code, instance_number

--18
SELECT DATEDIFF(YEAR, Student.birth_date, GETDATE()) AS 'Age', Student. surname, Student.first_name, Student.student_number
FROM Student
ORDER BY Age DESC, surname ASC, first_name ASC, student_number ASC


