CREATE TABLE Department                 
(
deptno INTEGER NOT NULL,
deptname VARCHAR(50) NOT NULL,
CONSTRAINT PK_Department PRIMARY KEY(deptno) 
)

CREATE TABLE Employee 
(     
empno INTEGER NOT NULL,
empname VARCHAR(50) NOT NULL,
deptno INTEGER NOT NULL,
CONSTRAINT PK_Employee PRIMARY KEY(empno),
CONSTRAINT FK_Employee_Department FOREIGN KEY(deptno) REFERENCES Department(deptno) 
)