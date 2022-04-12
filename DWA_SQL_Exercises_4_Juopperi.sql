--1
SELECT COUNT(DISTINCT CourseInstance.participants) AS 'Number of participans', CourseInstance.course_code 
FROM CourseInstance
GROUP BY course_code 
ORDER BY [Number of participans] DESC, course_code ASC


 --2
 SELECT COUNT(CourseGrade.grade) AS 'Number of grades', CourseGrade.student_number
 FROM CourseGrade
 GROUP BY student_number
 ORDER BY [Number of grades] DESC, student_number ASC

 --3
 SELECT AVG(CourseGrade.grade) AS 'Average grade', CourseGrade.student_number
 FROM CourseGrade
 WHERE grade IS NOT NULL
 GROUP BY student_number
 ORDER BY student_number ASC

 --4
 SELECT CourseInstance.teacher_number, COUNT(CourseInstance.instance_number) AS 'Number of course instances'
 FROM CourseInstance
 GROUP BY teacher_number
 ORDER BY teacher_number

 --5
 SELECT DISTINCT COUNT(CourseInstance.course_code) AS 'Number of different courses', CourseInstance.teacher_number
 FROM CourseInstance
 GROUP BY teacher_number
 ORDER BY [Number of different courses] DESC, teacher_number ASC

--6
SELECT CourseInstance.teacher_number, COUNT(*) AS 'Number of course instances'
FROM CourseInstance
GROUP BY  teacher_number HAVING COUNT(*) > 1
ORDER BY teacher_number

--7
SELECT CourseGrade.student_number, AVG(CAST (CourseGrade.grade AS DECIMAL(4,2))) AS 'Average grade', MAX(CourseGrade.grade) AS 'Highest grade', MIN(CourseGrade.grade) AS 'Lowest grade'
FROM CourseGrade
GROUP BY student_number
ORDER BY [Average grade], student_number

--8
SELECT CourseGrade.student_number, AVG(CAST (CourseGrade.grade AS DECIMAL(4,2))) AS 'Average grade', MAX(CourseGrade.grade) AS 'Highest grade', MIN(CourseGrade.grade) AS 'Lowest grade'
FROM CourseGrade
GROUP BY student_number HAVING AVG(CourseGrade.grade) >= 3
ORDER BY [Average grade], student_number

--9
SELECT CourseInstance.participants, CourseInstance.course_code, CourseInstance.instance_number
FROM CourseInstance
WHERE CourseInstance.participants > (SELECT AVG(CourseInstance.participants) FROM CourseInstance) 
ORDER BY participants DESC, course_code ASC, instance_number ASC

--10
SELECT Student.surname, Student.first_name, Student.student_number, CourseGrade.grade
FROM Student
WHERE (SELECT CourseGrade.grade FROM CourseGrade)  
ORDER BY surname, first_name, student_number

--11
SELECT Teacher.surname, Teacher.first_name, Teacher.teacher_number, Teacher.salary
FROM Teacher
WHERE salary > (SELECT SUM(Teacher.salary) FROM Teacher WHERE campus_code = 'c222')
ORDER BY surname ASC, first_name ASC, teacher_number ASC

--12
SELECT CourseGrade.course_code, CourseGrade.grade, Course.course_name
FROM CourseGrade
JOIN Course ON CourseGrade.course_code = Course.course_code
WHERE grade > 0
ORDER BY course_code ASC

--13
SELECT CourseGrade.course_code, CourseGrade.grade, Course.course_name
FROM CourseGrade
JOIN Course ON CourseGrade.course_code = Course.course_code
WHERE grade = 0
ORDER BY course_code ASC

--14
SELECT Teacher.teacher_number, Teacher.surname, Teacher.first_name, Course.course_name
FROM Teacher
JOIN Course ON Teacher.teacher_number = Course.person_in_charge
WHERE course_name IS NULL


 