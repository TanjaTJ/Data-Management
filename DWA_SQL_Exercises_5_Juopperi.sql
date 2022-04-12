--1
SELECT COUNT(DISTINCT CourseInstance.participants) AS 'Number of participans', CourseInstance.course_code 
FROM CourseInstance
GROUP BY course_code 
ORDER BY [Number of participans] DESC, course_code ASC

--2
SELECT Course.course_code, Course.course_name, CONCAT(Teacher.surname, ' ',Teacher.first_name) AS 'Person in charge' 
FROM Course
JOIN Teacher ON (Teacher.teacher_number = Course.person_in_charge)
ORDER BY course_code ASC

--3
SELECT AVG(CourseGrade.grade) AS 'Grade point average', Student.surname, Student.first_name, Student.student_number  
FROM Student
JOIN CourseGrade ON (CourseGrade.student_number = Student.student_number)
ORDER BY surname

--4.A
SELECT AcademicAdvisor.start_date, AcademicAdvisor.end_date, AcademicAdvisor.teacher_number, Teacher.surname, Teacher.first_name
FROM AcademicAdvisor 
JOIN Teacher ON (AcademicAdvisor.teacher_number = Teacher.teacher_number)
WHERE end_date IS NULL
ORDER BY surname ASC, first_name ASC, teacher_number ASC

--4.B
SELECT AcademicAdvisor.start_date, AcademicAdvisor.end_date, AcademicAdvisor.teacher_number, Teacher.surname, Teacher.first_name
FROM AcademicAdvisor 
JOIN Teacher ON (AcademicAdvisor.teacher_number = Teacher.teacher_number)
ORDER BY surname ASC, first_name ASC, teacher_number ASC

--5
SELECT *
FROM MisconductType
JOIN MisconductIncident ON (MisconductType.misconduct_code = MisconductIncident.misconduct_code)
ORDER BY description ASC

--6
SELECT Student.surname, Student.first_name, Student.student_number, Student.city 
FROM Student
JOIN CourseGrade ON (Student.student_number = CourseGrade.student_number)
WHERE EXISTS (SELECT CourseGrade.course_code, CourseGrade.grade FROM CourseGrade WHERE grade > 2) AND city = 'Helsinki'
ORDER BY surname, first_name, student_number, course_code

--7
SELECT Teacher.teacher_number, Teacher.surname, Teacher.first_name
FROM Teacher
JOIN Course ON (Teacher.teacher_number = Course.person_in_charge)
WHERE EXISTS (SELECT Course.course_code, Course.course_name FROM Course WHERE course_code = 'a730')
ORDER BY teacher_number ASC

--8
SELECT Student.surname, Student.first_name, Student.student_number, Student.gender,
		Course.course_name, Course.course_code,
		CourseGrade.grade
FROM Student
JOIN CourseGrade ON (Student.student_number = CourseGrade.student_number)
JOIN Course ON (CourseGrade.course_code = Course.course_code)
WHERE EXISTS (SELECT CourseGrade.grade FROM CourseGrade WHERE grade > 0 AND grade IS NOT NULL) AND Student.gender = 'F'

--9
SELECT CourseGrade.course_code, CourseGrade.grade, Course.course_name, Student.gender
FROM CourseGrade
JOIN Course ON (CourseGrade.course_code = Course.course_code)
JOIN Student ON (CourseGrade.student_number = Student.student_number)
WHERE gender = 'F' AND grade >= 5

--10
SELECT DISTINCT Student.surname, Student.first_name, Student.student_number
FROM Student
JOIN CourseGrade ON (Student.student_number = CourseGrade.student_number)
WHERE grade = 3
ORDER BY surname ASC, first_name ASC, student_number ASC

--11?
SELECT Teacher.teacher_number, Teacher.surname, Teacher.first_name, (SELECT MONTH(CourseGrade.grade_date) AS 'Grade month' FROM CourseGrade)
FROM Teacher
JOIN CourseGrade ON (Teacher.teacher_number = CourseGrade.examiner)
WHERE grade_date = 5
ORDER BY teacher_number ASC

--12?
SELECT AVG(CourseGrade.grade) AS 'Average grade', COUNT(CourseGrade.grade) AS 'Number of grades'
FROM CourseGrade
JOIN Student ON (CourseGrade.student_number = Student.student_number)
WHERE gender = 'F' 

--13
SELECT DISTINCT Campus.campus_name, AcademicAdvisor.teacher_number 
FROM Campus 
CROSS JOIN AcademicAdvisor
GROUP BY campus_name, teacher_number
ORDER BY campus_name, teacher_number

--14
SELECT MisconductIncident.course_code, MisconductIncident.instance_number, Course.course_name, Student.student_number, Student.surname, Student.first_name,  MisconductType.description
FROM Student
JOIN MisconductIncident ON (Student.student_number = MisconductIncident.student_number)
JOIN Course ON (MisconductIncident.course_code = Course.course_code)
JOIN MisconductType ON (MisconductIncident.misconduct_code = MisconductType.misconduct_code)

--15
SELECT Student.student_number, Student.surname, Student.first_name, MisconductIncident.sanction_code, SanctionType.description
FROM Student
JOIN MisconductIncident ON (Student.student_number = MisconductIncident.student_number)
JOIN SanctionType ON (MisconductIncident.sanction_code = SanctionType.sanction_code)
WHERE description LIKE '%Written%'

--16
                       