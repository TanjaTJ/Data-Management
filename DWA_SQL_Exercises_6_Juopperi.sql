--1
SELECT Teacher.surname, Teacher.first_name, Course.course_name
FROM Teacher 
JOIN Course ON (Teacher.teacher_number = Course.person_in_charge)
WHERE teacher_number = 'h303'
ORDER BY course_name ASC

--2?
SELECT Teacher.surname, Teacher.first_name, Teacher.teacher_number, Course.course_name
FROM Teacher
JOIN Course ON (Teacher.teacher_number = Course.person_in_charge)

--3
SELECT CourseInstance.course_code, CourseInstance.instance_number, CourseInstance.start_date, CONCAT(Teacher.surname, '', Teacher.first_name) AS 'Teacher', Teacher.teacher_number
FROM CourseInstance
JOIN Teacher ON (CourseInstance.teacher_number = Teacher.teacher_number)
WHERE YEAR(CourseInstance.start_date) = 2008

--4?
SELECT Campus.campus_name, Teacher.surname, Teacher.first_name, Teacher.teacher_number, Course.course_name
FROM Teacher
JOIN Campus ON (Teacher.campus_code = Campus.campus_code)
JOIN Course ON (Teacher.teacher_number = Course.person_in_charge)

--5
SELECT Teacher.teacher_number, Campus.campus_name, COUNT(Teacher.teacher_number) AS 'Number of teachers'
FROM Teacher 
JOIN Campus ON (Teacher.campus_code = Campus.campus_code)
GROUP BY Teacher.teacher_number, Campus.campus_name
ORDER BY [Number of teachers]

--6
SELECT Teacher.surname, Teacher.first_name, Teacher.teacher_number, AcademicAdvisor.start_date, AcademicAdvisor.end_date
FROM Teacher
JOIN AcademicAdvisor ON (Teacher.teacher_number = AcademicAdvisor.teacher_number)
WHERE DATENAME(YEAR, start_date) = 2010 OR DATENAME(YEAR, end_date) = 2010
ORDER BY surname ASC, first_name ASC, teacher_number ASC
