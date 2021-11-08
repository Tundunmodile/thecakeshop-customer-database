/* thecakeshop-createDBobjects.sql
 * Author: Tundun Modile
 * Date Created: 11/08/2021
 * Description: DDL thecakeshop
 *
 * Tables:
 *    Customers (CustomerID, FirstName, LastName, Phone, Email, City, State, Zip)
 *    Orders (OrderID, CustomerID, ItemID, Quantity, OrderStatus, OrderDate, RequiredDate, ShipDate, StaffID)
 *    Staff (StaffID, FirstName, LastName, Email, Phone, Status)
 *    OrderItems (ItemID, Size, Price)
 *
 * Indexes:
 *
 * Stored Procedures
 *
*/



/******************************************************
    Tables
******************************************************/


IF OBJECT_ID('Customers', 'U') IS NOT NULL
    DROP TABLE Customers;

IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;

IF OBJECT_ID('Staff', 'U') IS NOT NULL
    DROP TABLE Staff;

IF OBJECT_ID('OrderItems', 'U') IS NOT NULL
    DROP TABLE OrderItems;


CREATE TABLE Customers
(
    [CustomerID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] NVARCHAR(255) NOT NULL,
    [LastName] NVARCHAR(255) NOT NULL,
    [Phone] INT (10) NOT NULL,
    [Email] NVARCHAR(255) NOT NULL,
    [City] NVARCHAR(255) NOT NULL,
    [State] NVARCHAR(2) NOT NULL,
    [Zip] NVARCHAR(5) NOT NULL
);
GO


CREATE TABLE Orders
(
    [OrderID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [CustomerID] INT NOT NULL,
    [ItemID] INT NOT NULL,
    [Quantity] INT NOT NULL,
    [OrderStatus] NVARCHAR(255),
    [OrderDate] DATETIME(16),
    [RequiredDate] DATETIME(16),
    [ShipDate] DATETIME(16),
    [StaffID] INT NOT NULL,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY(ItemID) REFERENCES OrderItem(ItemID)
);
GO


CREATE TABLE Staff
(
    [StaffID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] NVARCHAR(255),
    [LastName] NVARCHAR(255),
    [Email] NVARCHAR(255),
    [Phone] INT(10),
    [Status] NVARCHAR(255)
);
GO


CREATE TABLE OrderItems
(
    [ItemID] INT NOT NULL IDENTITY PRIMARY KEY,
    [Size] NVARCHAR(255) NOT NULL,
    [Price]
);
GO


