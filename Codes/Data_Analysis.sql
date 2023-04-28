/*************Combine First Name and Last Name of Customer table into a single column***************/
Select Id,First_Name || ' ' || Last_Name AS Name from Customers;

/***********Correct the email Id which are incorrect*********/

--Fetch the records having incorrect email Id
Select * from Customers where EmailId not like '%.com%';

--Update incorrect email Id
Update Customers Set EmailId = Case when EmailId not like '%.com%' Then EmailId || '.com' Else EmailId End;
COMMIT;

/***********Correct the phone number which are incorrect************/

--Fetch the records having incorrect phone number
Select * from Customers where REGEXP_like(Phone_Number,'[^[:alnum:]]');

--Update the phone number to correct
Update Customers Set Phone_Number = Case
                                        When REGEXP_like(Phone_Number,'[^[:alnum:]]') Then REGEXP_REPLACE(Phone_Number,'[^[:alnum:]]','')
                                        When REGEXP_like(Phone_Number,'^[[:alpha:]+$]') Then REGEXP_REPLACE(Phone_Number,'^[[:alpha:]+$]','')
                                        Else Phone_Number
                                    End;
COMMIT;

/******************Correct the length of phone number***************/

--Fetch the records having phone number length not equal to 10
Select * from Customers where length(Phone_Number) <> 10;

--Correct the length of phone number to 10
Update Customers set Phone_Number = Case
                                        When length(Phone_Number) > 10 Then Substr(Phone_Number,1,10)
                                        When length(Phone_Number) < 10 Then '0000000000'
                                        Else Phone_Number
                                    End;
COMMIT;

/***************List all the product details along with their stores****************/

--Using sub query
Select Id,P_NAME,S_ID from Products where S_ID in(Select ID from Stores);

--USing Join
Select P.Id,P.P_name,S.Id,S.Store_Name from Products P
Inner Join Stores S On P.S_Id = S.Id;

/***************************List out the Product Details for Store Bengaluru where Actual Price greater than or equal to 3000 for Product 'Headphone'**********/

Select P.Id,P.P_Name,S.Id,S.Store_Name from Products P
Inner Join Stores S On P.S_Id=S.Id where S.Store_Name ='Bengaluru' and P.Actual_Price >=3000 and P.P_Name='Headphone';

Select C.Id AS CustomerId,First_Name || " " || Last_Name AS FullName,
P.Id AS ProductId,P.P_Name from Customers C
Inner Join Orders O on C.Id = O.C_Id
Inner Join Products P on P.Id = O.P_Id
where P.P_Name in ('Speaker','LED','Watch');

/***********************List down the Customers who ordered the costliest product******************************************/

Select C.Id,First_Name || ' ' || Last_Name AS Name,C.emailId,C.Phone_Number from Customers C
inner join Orders O on C.Id = O.C_Id
inner join Products P on O.P_Id = P.Id 
where P.Actual_Price in(Select Max(Actual_Price) from Products)
Order by O.Order_On;

/*******************Find the maximum price of a product*********************/

Select MAX(Actual_Price) AS Maximum_Price from Products;

/********************Find the minimum cost product******************************/

Select Min(Actual_Price) from Products;

/***********************List down the Customers who ordered the cheapest product******************************************/

Select C.Id,First_Name || ' ' || Last_Name As Name,C.emailId,C.Phone_Number from Customers C
inner Join Orders O on C.Id=O.C_Id
inner join Products P on P.Id = O.P_Id
where P.Actual_Price in(Select Min(Actual_Price) from Products);