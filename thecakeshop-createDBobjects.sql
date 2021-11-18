/* thecakeshop-createDBobjects.sql
 * Author: Olatundun Modile
 * Date Created: 11/08/2021
 * Description: DDL thecakeshop
 *
 * Tables:
 *    Customers (CustomerID, FirstName, LastName, Phone, Email, City, State, Zip)
 *    Orders (OrderID, CustomerID, ItemID, Quantity, OrderStatus, OrderDate, RequiredDate, ShipDate, StaffID)
 *    Staff (StaffID, FirstName, LastName, Email, Phone, Status)
 *    OrderItems (ItemID, Size, Price)
 *    SpecialtyItems (SpecialtyItemID, Name)
 *
 * Indexes:
 *    IX_City
 *    IX_State
 *
 * Stored Procedures:
 *    ReadOrders 
 *    ReadPendingOrders
 *    ReadFulfilledOrders
 *    CreateOrder 
 *    DeleteOrder 
 *    UpdateOrder
 
*/



/******************************************************
    Tables
******************************************************/
USE cakeshop



IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;

IF OBJECT_ID('Customers', 'U') IS NOT NULL
    DROP TABLE Customers;

IF OBJECT_ID('Staff', 'U') IS NOT NULL
    DROP TABLE Staff;

IF OBJECT_ID('CakeDetails', 'U') IS NOT NULL
    DROP TABLE CakeDetails;

IF OBJECT_ID('Cakes', 'U') IS NOT NULL
    DROP TABLE Cakes;

IF OBJECT_ID('Details', 'U') IS NOT NULL
    DROP TABLE Details;




CREATE TABLE Customers
(
    [CustomerID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] NVARCHAR(255) NOT NULL,
    [LastName] NVARCHAR(255) NOT NULL,
    [Phone] CHAR (10) NOT NULL,
    [Email] NVARCHAR(255) NOT NULL,
	[Address 1] NVARCHAR(255) NOT NULL,
    [City] NVARCHAR(255) NOT NULL,
    [State] NVARCHAR(2) NOT NULL,
    [Zip] NVARCHAR(5) NOT NULL
);
GO




CREATE TABLE Staff
(
    [StaffID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] NVARCHAR(255),
    [LastName] NVARCHAR(255),
    [Email] NVARCHAR(255),
    [Phone] CHAR(10),
    [Status] BIT
);
GO


CREATE TABLE Cakes
(
    [ItemID] INT NOT NULL IDENTITY PRIMARY KEY,
    [Size] NVARCHAR(50) NOT NULL,
    [Price] MONEY
);
GO

CREATE TABLE Orders
(
    [OrderID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [CustomerID] INT NOT NULL,
    [ItemID] INT NOT NULL,
    [Quantity] INT NOT NULL,
    [OrderStatus] NVARCHAR(255),
    [OrderDate] SMALLDATETIME,
    [RequiredDate] SMALLDATETIME,
    [ShipDate] SMALLDATETIME,
    [StaffID] INT NOT NULL,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY(StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY(ItemID) REFERENCES Cakes(ItemID)
);
GO

CREATE TABLE Details
(
    [DetailID] INT NOT NULL IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(75) NOT NULL,
	[Description]  NVARCHAR(255) NOT NULL
);
GO

CREATE TABLE CakeDetails
(
    [CakeDetailID] INT NOT NULL IDENTITY PRIMARY KEY,
	[ItemID] INT NOT NULL,
	[DetailID] INT NOT NULL,
	FOREIGN KEY(ItemID) REFERENCES Cakes(ItemID),
	FOREIGN KEY(DetailID) REFERENCES Details(DetailID)
);
GO






/******************************************************
    Indexes
******************************************************/


CREATE NONCLUSTERED INDEX IX_City ON Customers (City DESC)
GO


CREATE NONCLUSTERED INDEX IX_State ON Customers ([State] DESC)
GO



/******************************************************
    Stored Procedures
******************************************************/


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'ReadOrders' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE ReadOrders
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'ReadPendingOrders' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE ReadPendingOrders
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'ReadFulfilledOrders' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE ReadFulfilledOrders
GO

IF EXISTS ( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'CreateOrder' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE CreateOrder
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'DeleteOrder' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE DeleteOrder
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'UpdateOrder' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE UpdateOrder
GO



/** 
    Stored Procedure: ReadOrders 
    Usage: Returns a result set of orders in the database optionally filtered by CustomerID, StaffID or RequiredDate
    Parameters:
        @CustomerID (optional) - filters results to only include all order from a specific customer
        @StaffID (optional) - filters rsults to only include all orders created by a specific Staff
		@RequiredDate(optional) - filters results to only include orders due on a certain date

**/
CREATE PROCEDURE ReadOrders @CustomerID INT = NULL, @staffID INT = NULL, @RequiredDate SMALLDATETIME = NULL AS
BEGIN
    SET NOCOUNT ON;
    IF @CustomerID IS NULL
    BEGIN
        