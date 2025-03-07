# 🚀 SQL Server Use Case - Employee Management System  

## 📌 Overview  
This project showcases a **SQL Server Employee Management System** with **tables, stored procedures, and triggers**. It is designed to demonstrate database management skills and SQL coding expertise.  

## 🏗 Features  
- **Employee & Department Tables**  
- **Data Insertion & Retrieval Queries**  
- **Stored Procedure to Update Salary**  
- **Trigger for Salary Validation**  

## 📂 File Structure  
📁 SQL-Server-Use-Case
├── 📄 sql_server_use_case.sql # SQL script with tables, procedures, and triggers
├── 📄 README.md # # Project documentation


## 🚀 How to Use  
1. **Clone the Repository**  
   ```bash
   git clone https://github.com/YOUR_USERNAME/SQL-Server-Use-Case.git
   cd SQL-Server-Use-Case
2. **Run SQL Script**
   Open SQL Server Management Studio (SSMS).
   Open sql_server_use_case.sql and execute the script.
   Modify and test queries as needed.
**Example Query**
To get employee details with department names:

SELECT e.EmployeeID, e.FirstName, e.LastName, e.Email, e.Salary, d.DepartmentName 
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;
