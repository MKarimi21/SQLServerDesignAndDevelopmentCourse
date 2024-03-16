-- Transaction
-- ACID => Atomic, Consistent, Isolates, Durable
SET
    XACT_ABORT ON;

-- baes mishe harja be moshkel khordim jaryan ro stop va zakhireharo hazf mikone
BEGIN TRAN
INSERT
    dbo.Orders (Customer, OrderDate)
VALUES
    ('Mosi', GETDATE());

DECLARE @Local_Id INT = @SCOP_IDENTITY();

INSERT
    dbo.OrderDetals (Order_Id, Product, Quantity, Discount)
VALUES
    (@Local_Id, 'Bike', 1, 0.2),
    (@Local_Id, 'Tire', 1, 0.1) -- if it has wrong value then querry stop
    COMMIT;

