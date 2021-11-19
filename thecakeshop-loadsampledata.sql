/* thecakeshop-loadsampledata.sql
Author: Olatundun Modile
Date Created: 11/08/2021
Description: sample data for the cake shop
*/


USE [thecakeshop]
GO

INSERT INTO [dbo].[Customer]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Phone])
     VALUES
			('Amy','McDonald','amy.mcdonald@tcs.com','(594) 870-8817'),
			('Christian','Rees','christian.rees@tcs.com','(621) 611-0366'),
			('Ian','Forsyth','ian.forsyth@tcs.com','(902) 416-5373'),
			('Victoria','Greene','victoria.greene@tcs.com','(583) 444-0307'),
			('Austin','Black','austin.black@tcs.com','(480) 354-4053'),
			('Dylan','Ince','dylan.ince@tcs.com','(986) 347-9830'),
			('Heather','Bower','heather.bower@tcs.com','(247) 864-6004'),
			('Alexandra','Alsop','alexandra.alsop@tcs.com','(210) 975-0350'),
			('Stephen','Powell','stephen.powell@tcs.com','(970) 294-3918'),
			('James','Sanderson','james.sanderson@tcs.com','(475) 229-3627')
;
GO




INSERT INTO [dbo].[Address]
           ([Address]
           ,[City]
           ,[State]
           ,[Zip]
           ,[CustomerID])
     VALUES
			('9936 E 54th St','CHICAGO','IL',60615,10),			('201 E GRAND AVE','CHICAGO','IL',60611,2),			('570-572 W ROOSEVELT RD','CHICAGO','IL',60607,3),			('5710 N WESTERN AVE','CHICAGO','IL',60659,4),			('2800 W FOSTER AVE','CHICAGO','IL',60625,5),			('4054 W PETERSON AVE','CHICAGO','IL',60646,6),			('2011 N DAMEN AVE','CHICAGO','IL',60647,7),			('140 E WALTON PL','CHICAGO','IL',60611,8),			('1901 S Racine AVE','CHICAGO','IL',60608,9),			('7073 N WESTERN AVE','CHICAGO','IL',60645,10)
;
		   
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
		   ('Cookie cake', 'July 4th themed cookie cake', 95, 2, 1),
		   ('Cookies','plain',60, 6,1)

GO

INSERT INTO [dbo].[Employee]
           ([FirstName]
           ,[LastName]
           ,[Email]
           ,[Phone])
     VALUES
			('Zoe','Ball','zoe.ball@tcs.com','(762) 969-2858'),
			('Richard','Reid','richard.reid@tcs.com','(988) 741-8313'),
			('Wanda','Metcalfe','wanda.metcalfe@tcs.com','(458) 310-3489'),
			('Christian','Grant','christian.grant@tcs.com','(967) 842-9239'),
			('Alexandra','Ogden','alexandra.ogden@tcs.com','(628) 705-7789'),
			('Luke','Tucker','luke.tucker@tcs.com','(703) 464-6478'),
			('Matt','Morgan','matt.morgan@tcs.com','(969) 866-8107')
;
GO


INSERT INTO [dbo].[Orders]
           ([CustomerID]
           ,[OrderDate]
           ,[RequiredDate]
           ,[OrderStatus]
           ,[EmployeeID])
     VALUES
           (1,'2021-11-11 5:22', '2021-11-11 00:00','Fulfilled',1),
		   (2,'2021-11-12 5:22', '2021-12-13 00:00','Pending',2),
		   (3,'2021-11-13 5:22', '2021-11-13 00:00','Fulfilled',2),
		   (4,'2021-11-14 5:22', '2021-11-19 00:00','Fulfilled',3),
		   (5,'2021-11-10 5:22', '2021-12-26 00:00','Pending',4),
		   (6,'2021-11-10 5:22', '2021-12-26 00:00','Pending',5),
		   (7,'2021-11-10 5:22', '2021-12-26 00:00','Pending',6),
		   (8,'2021-11-10 5:22', '2021-12-26 00:00','Pending',7),
		   (9,'2021-11-10 5:22', '2021-11-12 00:00','Fulfilled',1),
		   (10,'2021-11-10 5:22', '2021-11-12 00:00','Fulfilled',4)
;
GO



INSERT INTO [dbo].[OrderProducts]
           ([OrderID]
           ,[ProductID]
           ,[Quantity])
     VALUES
			(1,2,3),
			(2,10,1),
			(3,3,4),
			(4,12,1),
			(5,7,2),
			(6,9,3),
			(7,3,2),
			(8,11,2),
			(9,3,2),
			(10,8,3)
;
GO


