# thecakeshop-customer-database

## Project Description

**The Cake Shop**
This is a sample customer database for a small cake business.
It is used to collect, store and retrieve customer and order information.
Based on the queries and stored procedures provided, the database can:
- provide a list of pending orders, filled orders and all orders.
- add orders and customer.

## Features
- Maintain customer and order information
- Track pending/fulfilled orders

## Technical Instructions
- Execute the thecakeshop-createDBobjects.sql file to create the database objects
- Execute the thecakeshop-loadsampledata.sql file to load the sample data
- Execute the thecakeshop-unittests.sql file to show functionality
- The thecakeshop.sql file shows how to run the stored procedures

## Project Requirements

**Group 1: Reading Data from a Database**
- Write a SELECT query that uses a WHERE clause
- Write a SELECT query that uses an OR and an AND operator
- Write a SELECT query that filers NULL rows using IS NOT NULL
- Write a SELECT query that utilizes a JOIN
- Write a SELECT query that utilizes a JOIN with 3 or more tables
- Write a SELECT query that utilizes a LEFT JOIN
- Write a SELECT query that utilizes a variable in the WHERE clause

**Group 2: Updating/Deleting Data from a Database**
- Write a DML statement that UPDATES a set of rows with a WHERE clause. The values used in the WHERE clause should be a variable
- Write a DML statement that DELETES a set of rows with a WHERE clause. The values used in the WHERE clause should be a variable

**Group 3: Optimizing a Database**
- Design a NONCLUSTERED INDEX with ONE KEY COLUMN that improves the performance of one of the above queries
