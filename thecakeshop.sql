/*
    thecakeshop Sample Commands
*/

/** Get a list of all Orders **/
EXECUTE ReadOrders
GO


/** Get a list of orders by OrderStatus i.e "pending" OR "fulfilled" **/
EXECUTE ReadOrderStatus @OrderStatus = "Pending"
GO


/** Add an employee to the database **/
DECLARE @EmployeeID INT;
EXECUTE CreateEmployee @EmployeeID = 14, @FirstName = "Tundun", @LastName = "Modile", @Email = "tunmod@tcs.com", @Phone = "(567)345-123";
GO

/** Remove an  address for a customer from the database **/
EXECUTE DeleteAddress @CustomerID = 5
GO

/** Update the status of an order from Pending to fulfilled based on dates **/
EXECUTE UpdateOrder @NewStatus = "Fulfilled"
GO



