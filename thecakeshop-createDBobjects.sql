/* thecakeshop-createDBobjects.sql
 * Author: Olatundun Modile
 * Date Created: 11/08/2021
 * Description: DDL thecakeshop
 *
 * Tables:
 *    Customers (CustomerID, FirstName, LastName, Email, Phone)
 *	  Address(AddressID, Address, City, State, Zip, CustomerID)
 *    Orders (OrderID, CustomerID, OrderDate, RequiredDate, OrderStatus, EmployeeID)
 *    Employee (EmployeeID, FirstName, LastName, Email, Phone)
 *    Product (ProductID, ProductName, ProductDescription, Price, SizeID, ProductDetailID)
 *    ProductDetails (ProductDetailID, ProductDetailName)
 *    OrderProduct (OrderId, ProductID, Quantity)
 *	  Size (SizeID, Sizes)
 *
 * Indexes:
 *    IX_City
 *    IX_Zip
 *
 * Stored Procedures:
 *    ReadOrders 
 *    ReadOrderStatus
 *    CreateEmployee 
 *    DeleteAddress
 *    UpdateOrder
 
*/


/******************************************************
    Tables
******************************************************/
CREATE DATABASE thecakeshop;
GO

USE thecakeshop;
GO

--DROP DATABASE thecakeshop;

IF OBJECT_ID('Size', 'U') IS NOT NULL
    DROP TABLE Size;

IF OBJECT_ID('Employees', 'U') IS NOT NULL
    DROP TABLE Employees;

IF OBJECT_ID('Customer', 'U') IS NOT NULL
    DROP TABLE Customer;

IF OBJECT_ID('Address', 'U') IS NOT NULL
    DROP TABLE [Address];

IF OBJECT_ID('ProductDetails', 'U') IS NOT NULL
    DROP TABLE ProductDetails;

IF OBJECT_ID('Product', 'U') IS NOT NULL
    DROP TABLE Product;

IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;

IF OBJECT_ID('OrderProducts', 'U') IS NOT NULL
    DROP TABLE OrderProducts;




CREATE TABLE [dbo].[Size](
    [SizeID] INT NOT NULL IDENTITY PRIMARY KEY, 
	[Sizes] NVARCHAR(255) NOT NULL   
);
GO


CREATE TABLE Customer
(
    [CustomerID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
);
GO

CREATE TABLE [Address](
	[AddressID] [int] NOT NULL IDENTITY PRIMARY KEY,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NULL,
	[Zip] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
GO



CREATE TABLE Employee
(
    [EmployeeID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL
);
GO


CREATE TABLE [dbo].[ProductDetails](
    [ProductDetailID] INT NOT NULL IDENTITY PRIMARY KEY, 
	[ProductDetailName] NVARCHAR(255) NULL,   

);
GO

CREATE TABLE [dbo].[Product]
(
    [ProductID] INT NOT NULL IDENTITY PRIMARY KEY,
	[ProductName] NVARCHAR(255) NOT NULL,
	[ProductDescription] NVARCHAR(255) NOT NULL,
	[Price] MONEY NOT NULL,
	[SizeID] INT NOT NULL,
	[ProductDetailID] INT NOT NULL,
	FOREIGN KEY(ProductDetailID) REFERENCES ProductDetails(ProductDetailID),
	FOREIGN KEY(SizeID) REFERENCES Size(SizeID)
);
GO

CREATE TABLE [dbo].[Orders](
    [OrderID] INT NOT NULL IDENTITY PRIMARY KEY, 
    [CustomerID] INT NOT NULL,
	[OrderDate] [smalldatetime] NULL,
	[RequiredDate] [smalldatetime] NULL,
	[OrderStatus] [nvarchar](255) NULL,
	[EmployeeID] INT NOT NULL,    
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID)
);
GO

CREATE TABLE [dbo].[OrderProducts](
    [OrderID] INT NOT NULL,
	[ProductID] INT NOT NULL,
	[Quantity] INT NOT NULL,
	PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),	
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);
GO









/******************************************************
    Indexes
******************************************************/


CREATE NONCLUSTERED INDEX IX_City ON [Address] (City DESC)
GO


CREATE NONCLUSTERED INDEX IX_State ON [Address] ([Zip] DESC)
GO



/******************************************************
    Stored Procedures
******************************************************/


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'ReadOrders' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE ReadOrders
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'ReadOrderStatus' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE ReadOrderStatus
GO

IF EXISTS ( SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'CreateEmployee' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE CreateEmployee
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'DeleteAddress' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE DeleteAddress
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.ROUTINES WHERE SPECIFIC_NAME = N'UpdateOrder' AND ROUTINE_TYPE = N'PROCEDURE')
DROP PROCEDURE UpdateOrder
GO



/** 
    Stored Procedure: ReadOrders 
    Usage: Returns a result set of orders in the database optionally filtered by RequiredDate
    Parameters:
		@RequiredDate(optional) - filters results to only include orders due on a certain date

**/
CREATE PROCEDURE ReadOrders @RequiredDate SMALLDATETIME = NULL AS
BEGIN
    SET NOCOUNT ON;
    BEGIN
		SELECT
			ORD.OrderDate,
			ORD.RequiredDate,
			ORD.OrderStatus,
			ORDPROD.Quantity,
			PROD.ProductName,
			PROD.ProductDescription,
			PRODDET.ProductDetailName,
			SZ.Sizes
			FROM Orders ORD
			JOIN OrderProducts ORDPROD ON ORDPROD.OrderID = ORD.OrderID
			JOIN Product PROD ON PROD.ProductID = ORDPROD.ProductID
			JOIN ProductDetails PRODDET ON PRODDET.ProductDetailID = PROD.ProductDetailID
			JOIN Size SZ ON SZ.SizeID = PROD.SizeID
			WHERE ORD.RequiredDate = ISNULL(@RequiredDate, ORD.RequiredDate)
			; 
	END
END
GO

/** 
    Stored Procedure: ReadOrderStatus 
    Usage: Returns a result set of orders in the database filtered either by Pending or Fulfilled Order Status
    Parameters:
		@OrderStatus - filters results to only include orders based on their status

**/

CREATE PROCEDURE ReadOrderStatus @OrderStatus NVARCHAR(255) AS
BEGIN
    SET NOCOUNT ON;
    BEGIN
		SELECT
			ORD.OrderDate,
			ORD.RequiredDate,
			ORD.OrderStatus,
			ORDPROD.Quantity,
			PROD.ProductName,
			PROD.ProductDescription,
			PRODDET.ProductDetailName,
			SZ.Sizes
			FROM Orders ORD
			JOIN OrderProducts ORDPROD ON ORDPROD.OrderID = ORD.OrderID
			JOIN Product PROD ON PROD.ProductID = ORDPROD.ProductID
			JOIN ProductDetails PRODDET ON PRODDET.ProductDetailID = PROD.ProductDetailID
			JOIN Size SZ ON SZ.SizeID = PROD.SizeID
			WHERE ORD.OrderStatus = @OrderStatus
			; 
			
	END
END
GO

/** 
    Stored Procedure: CreateEmployee
    Usage: Creates a new employee entry in the database
    Parameters:
		@FirstName,@LastName,@Email,@Phone

**/

CREATE PROCEDURE CreateEmployee @FirstName NVARCHAR(50),@LastName NVARCHAR(50),@Email NVARCHAR(50),@Phone NVARCHAR(50)

AS 

BEGIN
	
    SET NOCOUNT ON;
    BEGIN
		INSERT INTO Employee
		(FirstName,LastName,Email,Phone)
		VALUES(@FirstName, @LastName, @Email, @Phone)
		;
	END
END
GO

/** 
    Stored Procedure: DeleteAddress
    Usage: Deletes an address for a customer from the database. 
    Parameters:
        @CustomerID (required) 
    Returns:
        None
    Error Checks:
        None
**/
CREATE PROCEDURE DeleteAddress @Zip INT AS
BEGIN
    SET NOCOUNT ON;
	DELETE FROM [Address] WHERE Zip = @Zip
END
GO


/** 
    Stored Procedure: UpdateOrder 
    Usage: Updates the status of an order from pending to fulfilled.
    Parameters:
        @NewStatus (required)
    Returns:
        Count of Pending orderstatus before and after update
    Error Checks:
        None
**/
CREATE PROCEDURE UpdateOrder @NewStatus NVARCHAR(255) AS
BEGIN
    SET NOCOUNT ON;
	SELECT COUNT(OrderStatus) AS PendingOrders FROM Orders WHERE OrderStatus = 'Pending'
    UPDATE Orders SET OrderStatus = @NewStatus WHERE RequiredDate > GETDATE()
	SELECT COUNT(OrderStatus) AS PendingOrders FROM Orders WHERE OrderStatus = 'Pending'
END
GO


