/* thecakeshop-loadsampledata.sql
Author: Olatundun Modile
Date Created: 11/08/2021
Description: sample data for the cake shop
*/


USE cakeshop

INSERT INTO Customers
VALUES ('Amina','Salau', 4562348956, 'amina@tcs.com', '123 salad street', 'bentonville', 'NE', 45234),
('Busayo', 'Aderibigbe', 4562348956, 'busayo@tcs.com', '123 salad street', 'bentonville', 'NE', 45234),
('Bose', 'Sunday', 4562348956, 'bose@tcs.com', '123 salad street', 'bentonville', 'NE', 45234),
('Nnamdi', 'Waziri', 4562348956, 'nnamdi@tcs.com', '123 salad street', 'bentonville', 'NE', 45234),
('Asokoro', 'Ijanikin', 4562348956, 'asokoro@tcs.com', '123 salad street', 'bentonville', 'NE',  45234),
('Tolu', 'Ogunbiyi', 4562348956, 'tolu@tcs.com', '123 salad street', 'bentonville', 'NE', 45234),
('Dinah', 'Steele', 4562348956, 'dinah@tcs.com', '123 salad street', 'bentonville', 'NE', 45234);
GO

INSERT INTO Staff
VALUES ('Tundun', 'Modile', 'tundun@tcs.com', 2348646543, '1'),
('Bianca', 'Smith', 'bianca@tcs.com', 8542563478, '1');
GO

INSERT INTO Cakes
VALUES ('8 inches', 200),
('10 inches', 280),
('12 inches', 350),
('14 inches', 420),
('16 inches', 500);
GO

INSERT INTO Orders
VALUES 
(1, 5, 1, 'pending', '20210822 10:05:45 AM', '20211206 06:00:00 PM' , NULL, 1),
(2, 5, 3, 'fulfilled', '20210824 10:05:45 AM', '20210930 06:00:00 PM', '20210930 06:00:00 PM', 1),
(3, 3, 1, 'pending', '20211005 10:05:45 AM', '20211127 06:00:00 PM', NULL, 2),
(4, 1, 5, 'fulfilled', '20211005 10:05:45 AM', '20211010 06:00:00 PM', '20211010 06:00:00 PM', 1),
(4, 3, 2, 'fulfilled', '20211005 10:05:45 AM', '20211031 06:00:00 PM', '20211031 06:00:00 PM', 2),
(5, 1, 1, 'pending', '20211101 10:05:45 AM', '20211127 06:00:00 PM', NULL, 2);
GO

INSERT INTO Details
VALUES ('White', 'Icing'),
('Chocolate', 'flavor'),
('Chocolate', 'filling'),
('Carrot', 'flavor'),
('Carrot', 'filling'),
('Lemon','flavor' ),
('Fudge', 'filling'),
('Strawberry','flavor'),
('Raspberry','icing');
GO


INSERT INTO CakeDetails
VALUES (2,5),
(5,5),
(3,2),
(2,9),
(2,3);
GO

