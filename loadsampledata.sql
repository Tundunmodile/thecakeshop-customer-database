USE [thecakeshop]
GO

INSERT INTO [dbo].[ProductDetails]       
     VALUES
           ('None'),
		   ('Vanilla' ),
		   ('Strawberry'),
		   ('Chocolate'),
		   ('Pistachio'),
		   ('Blueberry'),
		   ('Banana'),
		   ('Coffee'),
		   ('Glazed'),
		   ('Frosting'),
		   ('Coconut'),
		   ('Pineapple'),
		   ('Baileys'),
		   ('Caramel')

GO

INSERT INTO [dbo].[Size]       
     VALUES
		   ('8 inches' ),
		   ('10 inches'),
		   ('14 inches'),
		   ('16 inches'),
		   ('Half a dozen'),
		   ('1 dozen'),
		   ('Custom'),
		   ('None')
GO

INSERT INTO [dbo].[Product]
     VALUES
           ('Half sheet cake','half of a regular sized pan', 40, 8, 2),
		   ('Whole sheet cake','a full sized pan of cake', 80, 8,3),
		   ('Round cake', 'plain', 35, 1,2),
		   ('Custom cake', 'paw patrol cake', 250, 5,5),
		   ('Icing', 'none', 20, 8,8),
		   ('Filling', 'none', 20, 8,7),
		   ('Doughnut', 'none', 5, 8,10),
		   ('Macaroons', 'none', 10, 8,1),
		   ('Custom cupcakes', 'frozen themed', 4.50, 7,7),
		   ('Cupcakes', 'none', 2, 6, 6),
		   ('Custom cookies', 'safari themed cookies for 5 year old birthday', 80, 6, 1),
		   ('Cookie cake', 'july 4th themed cookie cake', 95, 2, 1),
		   ('Cookies','plain',60, 6,1)

GO

INSERT INTO [dbo].[OrderProducts]
           --[OrderID]
		   --,[ProductID])
		   --([Quantity]
     VALUES
           (1,1),
		   (1,2),
		   (2,3),
		   (1,4),
		   (24,7),
		   ('Filling', 'none', 20, 8,7),
		   ('Doughnut', 'none', 5, 8,10),
		   ('Macaroons', 'none', 10, 8,1),
		   ('Custom cupcakes', 'frozen themed', 4.50, 7,7),
		   ('Cupcakes', 'none', 2, 6, 6),
		   ('Custom cookies', 'safari themed cookies for 5 year old birthday', 80, 6, 1),
		   ('Cookie cake', 'july 4th themed cookie cake', 95, 2, 1),
		   ('Cookies','plain',60, 6,1)

GO

--INSERT INTO [dbo].[Orders]
--     VALUES
--           (),
--		   (),
--		   ()

--GO

--ALTER TABLE Product
--ADD CONSTRAINT ProductDetailID 
--	FOREIGN KEY (ProductDetailID)
--	REFERENCES ProductDetails(ProductDetailID)

--ALTER TABLE ProductDetails
--DROP CONSTRAINT ProductID;

--Truncate Table Product


