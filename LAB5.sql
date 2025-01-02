
CREATE DATABASE Employee_070_;
USE Employee_070_;


CREATE TABLE dept(
    no INT PRIMARY KEY, 
    dname VARCHAR(20), 
    dloc VARCHAR(20)
);


CREATE TABLE employee(
    empno INT PRIMARY KEY,
    ename VARCHAR(20),
    mgr_no INT,
    hiredate VARCHAR(20), 
    sal FLOAT,
    no INT,
    FOREIGN KEY(no) REFERENCES dept(no)
);
CREATE TABLE incentives(
    empno INT, 
    date VARCHAR(20), 
    amt FLOAT,
    PRIMARY KEY(empno, date),
    FOREIGN KEY(empno) REFERENCES employee(empno)
);

CREATE TABLE project(
    pno INT PRIMARY KEY, 
    ploc VARCHAR(20),
    pname VARCHAR(20)
);

CREATE TABLE AssignedTo(
    empno INT, 
    pno INT,
    job_role TEXT, 
    PRIMARY KEY(empno, pno), 
    FOREIGN KEY(empno) REFERENCES employee(empno), 
    FOREIGN KEY(pno) REFERENCES project(pno)
);

INSERT INTO dept VALUES(1, "CSE", "Bengaluru");
INSERT INTO dept VALUES(2, "ECE", "Hyderabad");
INSERT INTO dept VALUES(4, "APPLE", "Delhi");
INSERT INTO dept VALUES(3, "Samsung", "Mumbai");

INSERT INTO employee VALUES(1, "Raju", 3, "23-05-2022", 36000, 3);
INSERT INTO employee VALUES(2, "Swati", 2, "01-04-2021", 40000, 5);
INSERT INTO employee VALUES(3, "Sneha", 1, "03-07-2021", 80000, 1);
INSERT INTO employee VALUES(4, "Raja", 3, "28-01-2021", 40000, 2);
INSERT INTO employee VALUES(5, "Gangu", 3, "28-08-2024", 10000, 3);

INSERT INTO incentives VALUES(1, "26-05-2021", 10000);
INSERT INTO incentives VALUES(2, "21-06-2021", 10000);
INSERT INTO incentives VALUES(3, "02-04-2024", 40000);
INSERT INTO incentives VALUES(4, "04-04-2024", 60000);
INSERT INTO incentives VALUES(5, "06-08-2024", 90000);


INSERT INTO project VALUES(1, "Bengaluru", "AB");
INSERT INTO project VALUES(2, "Mysore", "BC");
INSERT INTO project VALUES(3, "Mumbai", "DE");
INSERT INTO project VALUES(2, "Hyderabad", "EF");


INSERT INTO AssignedTo VALUES(1, 1, "Manager");
INSERT INTO AssignedTo VALUES(3, 2, "Employee");
INSERT INTO AssignedTo VALUES(3, 3, "Assistant Manager");
INSERT INTO AssignedTo VALUES(2, 3, "Software Designer");


SELECT e.ename 
FROM Employee e, dept d
WHERE e.no = d.no 
AND d.dloc IN ('Bangalore', 'Mysore', 'Hyderabad');


SELECT e.empno
FROM Employee e
WHERE e.empno NOT IN (SELECT DISTINCT empno FROM Incentives);


SELECT e.ename, d.dname, p.ploc, a.job_role 
FROM Employee e 
JOIN dept d ON e.no = d.no 
JOIN AssignedTo a ON e.empno = a.empno 
JOIN project p ON a.pno = p.pno; 
