USE [thecakeshop]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 11/18/2021 2:20:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[ProductDetails](
    [ProductDetailID] INT NOT NULL IDENTITY PRIMARY KEY, 
	[ProductDetailName] NVARCHAR(255) NULL,   

);
GO

CREATE TABLE [dbo].[Size](
    [SizeID] INT NOT NULL IDENTITY PRIMARY KEY, 
	[Sizes] NVARCHAR(255) NOT NULL   
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


--DROP TABLE [Orders]
--DROP TABLE [ProductDetails]
--DROP TABLE [Size]
--DROP TABLE [OrderProducts]
--DROP TABLE [Product]