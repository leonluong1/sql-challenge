-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/f3AAHO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Titles;


CREATE TABLE Departments (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(63)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE Titles (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(63)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE Employees (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(63)   NOT NULL,
    "last_name" VARCHAR(63)   NOT NULL,
    "sex" VARCHAR(4)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE Dept_Emp (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT pk_Dept_Emp PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE Dept_Manager (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE Salaries (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY("emp_title_id")
REFERENCES Titles ("title_id");

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_emp_no FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Emp ADD CONSTRAINT fk_Dept_Emp_dept_no FOREIGN KEY("dept_no")
REFERENCES Departments ("dept_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY("dept_no")
REFERENCES Departments ("dept_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

