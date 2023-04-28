--Create a trigger which will increase the id column value automatically in customers table.
CREATE OR REPLACE TRIGGER customer_trigger
BEFORE INSERT ON Customers
FOR EACH ROW
BEGIN
    SELECT customer_id.NEXTVAL
    INTO:new.Id
    FROM dual;
END;

--Create a trigger which will increase the id column value automatically in Stores table.
Create or Replace Trigger store_Trigger
BEFORE INSERT On Stores
FOR EACH ROW
Begin
    Select store_id.NEXTVAL
    INTO: new.Id
    FROM DUAL;
End;

--Create a trigger which will increase the id column value automatically in Products table.
Create or Replace Trigger products_trigger
BEFORE INSERT On Products
For Each Row
Begin
    Select products_id.NEXTVAL
    into: new.Id
    from Dual;
END;

--Create a trigger which will increase the id column value automatically in Orders table.
Create or Replace Trigger orders_tigger
BEFORE INSERT On Orders
For Each Row
Begin
    Select orders_id.NEXTVAL
    into: new.Id
    from dual;
End;

--Create a trigger which will increase the id column value automatically in Delivery table.
CREATE OR REPLACE TRIGGER delivery_trigger
BEFORE INSERT ON Delivery
FOR EACH ROW
BEGIN
    SELECT Delivery_Id.NEXTVAL
    INTO:new.Id
    FROM dual;
END;