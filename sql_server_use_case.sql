-- Employee Management System (SQL Server Use Case)

-- Step 1: Create Database
CREATE DATABASE EmployeeDB;
GO
USE EmployeeDB;
GO

-- Step 2: Create Tables
CREATE TABLE Departments (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary >= 10000),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Step 3: Insert Sample Data
INSERT INTO Departments (DepartmentName) VALUES ('HR'), ('IT'), ('Finance');
INSERT INTO Employees (FirstName, LastName, Email, Salary, DepartmentID) 
VALUES ('John', 'Doe', 'john.doe@example.com', 50000, 2),
       ('Jane', 'Smith', 'jane.smith@example.com', 60000, 1);

-- Step 4: Retrieve Employees by Department
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Email, e.Salary, d.DepartmentName 
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Step 5: Create a Stored Procedure to Update Salary
CREATE PROCEDURE UpdateSalary
    @EmpID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    UPDATE Employees
    SET Salary = @NewSalary
    WHERE EmployeeID = @EmpID;
END;
GO

-- Step 6: Create a Trigger for Salary Validation
CREATE TRIGGER trg_SalaryCheck
ON Employees
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE Salary < 10000
    )
    BEGIN
        RAISERROR ('Salary must be at least 10,000', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
