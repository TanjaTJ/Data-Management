--1.1
SELECT Student.student_number, Student.surname, Student.first_name, Student.gender 
FROM Student
ORDER BY student_number ASC

--1.2
SELECT Student.first_name, Student.surname, Student.student_number, Student.gender, Student.city 
FROM Student
WHERE city = 'Espoo' OR city = 'Esbo' AND gender = 'F'
ORDER BY surname ASC, first_name ASC, student_number ASC

--1.3
SELECT CONCAT(Student.surname, ', ' ,Student.first_name) AS 'Name', Student.city
FROM Student
WHERE city = 'Helsinki'
ORDER BY Name ASC

--1.4
SELECT Student.surname, Student.first_name, Student.city
FROM Student
WHERE city != 'Helsinki'
ORDER BY surname ASC,first_name ASC

--1.5
SELECT Student.postcode, Student.student_number
FROM Student
ORDER BY postcode ASC, student_number ASC

--1.6
SELECT DISTINCT Student.postcode 
FROM Student 
ORDER BY postcode ASC

--1.7
SELECT Student.city, Student.postcode, Student.surname, Student.first_name
FROM Student
WHERE postcode BETWEEN 00400 AND 00600 OR city = 'Espoo'
ORDER BY city, postcode, surname, first_name

--1.8
SELECT Student.postcode, Student.city, Student.surname, Student.first_name
FROM Student
WHERE postcode NOT BETWEEN 00600 AND 03000
ORDER BY postcode ASC, city ASC, surname ASC, first_name ASC

--1.9
SELECT MisconductType.description
FROM MisconductType
WHERE description LIKE 'A%' OR description LIKE 'C%' OR description LIKE 'F%' OR description LIKE 'R%'
ORDER BY description ASC

--1.10
SELECT MisconductType.description
FROM MisconductType
WHERE description NOT LIKE '%data%' OR description NOT LIKE '%reseach%' OR description NOT LIKE '%test%'
ORDER BY description ASC

--1.11
SELECT Teacher.surname
FROM Teacher
WHERE surname LIKE '%_ka' OR surname LIKE '%_ko'
ORDER BY surname ASC

--1.12
SELECT CourseInstance.course_code, CourseInstance.instance_number, CourseInstance.start_date, CourseInstance.end_date
FROM CourseInstance
WHERE CourseInstance.end_date IS NULL
ORDER BY course_code ASC, instance_number ASC

--1.13
SELECT CourseGrade.course_code, CourseGrade.instance_number, CourseGrade.student_number, CourseGrade.grade
FROM CourseGrade
WHERE grade IS NULL
ORDER BY course_code ASC, instance_number ASC, student_number ASC

--1.14
SELECT CourseGrade.course_code, CourseGrade.instance_number, CourseGrade.student_number, CourseGrade.grade
FROM CourseGrade
WHERE course_code = 'a290'
ORDER BY course_code ASC, grade ASC, student_number ASC

--1.15
SELECT Teacher.surname, Teacher.first_name, (salary / 100 * 15 + salary + 500) AS "New salary", Teacher.salary AS "Old salary"   
FROM Teacher
WHERE salary / 100 * 15 + salary + 500 > 18000
ORDER BY salary DESC, surname DESC, first_name DESC

--1.16
SELECT Student.surname, Student.first_name, Student.student_number, Student.gender,
CASE 
WHEN Student.gender = 'F' THEN 'Female'
WHEN Student.gender = 'M' THEN 'Male'
END
FROM Student
ORDER BY surname, first_name, student_number

--1.17
SELECT CourseInstance.start_date, CourseInstance.end_date, CourseInstance.course_code, CourseInstance.instance_number
FROM CourseInstance
WHERE start_date  BETWEEN '01.12.2007' AND '15.02.2008' OR end_date BETWEEN '01.12.2007' AND '15.02.2008'