-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/DTHcdJ
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "department_number" varchar(50)   NOT NULL,
    "department_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "department_employees" (
    "employee_number" int   NOT NULL,
    "department_number" varchar(50)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "department_managers" (
    "department_number" varchar(50)   NOT NULL,
    "employee_number" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "employees" (
    "employee_number" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(200)   NOT NULL,
    "last_name" varchar(200)   NOT NULL,
    "gender" varchar(2)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "salaries" (
    "employee_number" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "title" (
    "employee_number" int   NOT NULL,
    "title" varchar(500)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_department_number" FOREIGN KEY("department_number")
REFERENCES "department_managers" ("department_number");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "department_employees" ADD CONSTRAINT "fk_department_employees_department_number" FOREIGN KEY("department_number")
REFERENCES "departments" ("department_number");

ALTER TABLE "department_managers" ADD CONSTRAINT "fk_department_managers_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employee_number" FOREIGN KEY("employee_number")
REFERENCES "title" ("employee_number");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_employee_number" FOREIGN KEY("employee_number")
REFERENCES "employees" ("employee_number");

