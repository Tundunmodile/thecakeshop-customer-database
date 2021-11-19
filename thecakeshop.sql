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
EXECUTE CreateEmployee @FirstName = "Tundun", @LastName = "Modile", @Email = "tunmod@tcs.com", @Phone = "(567)345-123"
GO

/** Remove a customer and an order from the database **/
EXECUTE DeleteCustomer @CustomerID = 5
GO

/** Update the status of an order from Pending to fulfilled based on dates **/
EXECUTE UpdateOrder @NewStatus = "fulfilled"
GO



