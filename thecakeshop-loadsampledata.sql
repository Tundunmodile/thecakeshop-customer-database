/* thecakeshop-loadsampledata.sql
Author: Tundun Modile
Date Created: 11/08/2021
Description: sample data for the cake shop
*/

INSERT INTO Customers
VALUES ('Amina', ‘Salau’, 4562348956, ‘amina@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234),
('Busayo’, ‘Aderibigbe', 4562348956, ‘busayo@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234),
('Bose’, ‘Sunday', 4562348956, ‘bose@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234),
('Nnamdi’, ‘Waziri', 4562348956, ‘nnamdi@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234),
('Asokoro’, ‘Ijanikin', 4562348956, ‘asokoro@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234),
('Tolu’, ‘Ogunbiyi', 4562348956, ‘tolu@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234),
('Dinah’, ‘Steele', 4562348956, ‘dinah@tcs.com’, ‘123 salad street’, ‘bentonville’, ‘NE’, 45234);
GO

INSERT INTO Orders
VALUES (1, 5, ‘pending’, 08/22/2021 00:00:000, 12/06/2021 00:00:000, 1),
(2, 5, 'fulfilled', 08/24/2021 00:00:000, 09/30/2021 00:00:000, 09/30/2021 00:00:000, 1),
(3, 3, 'pending', 10/05/2021 00:00:000, 11/27/2021 00:00:000, 2),
(4, 1, ‘fulfilled’, 10/05/2021 00:00:000, 10/10/2021 00:00:000, 10/10/2021 00:00:000, 1),
(4, 3, ‘fulfilled’, 10/05/2021 00:00:000, 10/31/2021 00:00:000, 10/30/2021 00:00:000, 2),
(5, 1, ‘pending’, 11/01/2021 00:00:000, 11/27/2021 00:00:000, 2);
GO

INSERT INTO Staff
VALUES ('Tundun', ‘Modile’, ‘tundun@tcs.com’, 2348646543, ‘active’),
('Bianca', ‘Smith’, ‘bianca@tcs.com’, 8542563478, ‘active’);
GO

INSERT INTO Order_Items
VALUES (1, ‘one tier’, $200),
(2, ‘two tiers’, $280),
(3, ‘three tiers’, $350),
(4, ‘four tiers’, $420),
(5, ‘five tiers’, $500);
GO
