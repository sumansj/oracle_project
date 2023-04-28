--Create Tables
Create Table Customers(
Id int Primary Key,
First_Name varchar(20),
Last_Name varchar(20),
emailID varchar(40),
Joining_Date Date
);

Alter Table Customers ADD Phone_Number Varchar(15);

CREATE SEQUENCE customer_id
START WITH 1
INCREMENT BY 1;

Create Table Stores(
Id int,
Store_Name varchar(10) Unique,
Website varchar(30),
Address varchar(15),
Created_On Date
);

Create Sequence store_id
START WITH 100
INCREMENT BY 1;

Create Table Products(
Id int,
P_Name varchar(20),
Is_Available Number(1,0),
S_Id int,
Price int,
Is_Discount Number(1,0),
Discount_Price int,
Actual_Price int,
Last_Updated Date Not NULL,
P_Status Varchar(20) DEFAULT 'Not Submitted'
);

Create Sequence products_id
START WITH 1000
INCREMENT BY 1;

Create Table Orders(
Id int,
Order_On Date Not NULL,
C_Id int Not Null,
P_Id int Not Null,
S_Id int Not Null,
O_Status Number(1)
);

Alter Table Orders Modify O_Status Varchar(15);

Create Sequence orders_id
START WITH 10000
INCREMENT BY 1;

Create Table Delivery(
Id int,
O_Id int Not Null,
S_Id int Not Null,
C_Id int Not Null,
D_Start_On Date,
D_End_On Date,
D_Status varchar(20) Not Null,
Duration int
);

Alter Table Delivery Drop Column Duration;
Alter Table Delivery Add P_Id int Not Null;

Create Sequence Delivery_Id
START WITH 5000
INCREMENT BY 1;