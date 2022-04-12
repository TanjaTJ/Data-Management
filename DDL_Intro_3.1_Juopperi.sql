SELECT deptno, deptname FROM Department

SELECT deptname FROM Department WHERE deptno = 10

SELECT deptname FROM Department ORDER BY deptname

SELECT empname, deptname
 FROM Employee JOIN Department ON (Department.deptno = Employee.deptno) 
ORDER BY empname