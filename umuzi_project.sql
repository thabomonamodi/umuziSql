select * from customer;
select Firstname from customer;
select Firstname from customer where CustomerID=1;
update customer set Firstname='Lerato', Lastname='Mabitso' where CustomerID=1;
delete from customer where CustomerID=2;
select count(distinct Status)from orders;
select concat('R',max(Amount))as 'maximum payment' from payments;
select * from customer order by Country;
select * from products where BuyPrice between 100 and 600;
select * from customer where Country='Germany' and City='Berlin';
select * from customer where City='Cape Town' or City='Durban';
select * from products where BuyPrice>500;
select sum(Amount) from payments;
select count(Status) from orders where Status='Shipped';
select avg(BuyPrice)as 'Price in Rands',avg(BuyPrice)*12 as 'Price in dollars' from products;
select Amount from payments
inner join
umuzi.customer
on idPayments = customer.CustomerID; 
SELECT * FROM Products WHERE Description LIKE '%Turnable front wheels%';
