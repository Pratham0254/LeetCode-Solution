#184. Department Highest Salary
CREATE DATABASE Leetcode;
USE Leetcode;

CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

INSERT INTO Department (id, name)
VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee (id, name, salary, departmentId)
VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

SELECT D.name as Department,
       E.name as Employee,
       E.salary as Salary
FROM Employee E
JOIN Department D
ON E.departmentId = D.id
WHERE E.salary = (
    SELECT MAX(salary)
    FROM Employee E2
    WHERE E.departmentId =E2.departmentId
);

