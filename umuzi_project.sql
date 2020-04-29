CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`CustomerID`)
)
insert into customer values(1,'John','Hibert','Male','284 chaucer st',084789657,'john@gmail.com','Johannesburg','South Africa'),
(3,'Leon','Glen','Male','81 Everton Rd,Gillits',820832830,'Leon@gmail.com','Durban','South Africa'),
(4,'Charl','Muller','Male','290A Dorset Ecke',44856872553,'Charl.muller@yahoo.com','Berlin','Germany'),
(5,'Julia','Stein','Female','2 Wernerring',448672445058,'Js234@yahoo.com','Frankfurt','Germany');

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(50) NOT NULL,
  `Lastname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Jobtitle` varchar(20) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
)
insert into employees values(1,'Kani','Matthew','mat@gmail.com','Manager'),
(2,'Lesly','Cronje','LesC@gmail.com','Clerk'),
(3,'Gideon','Maduku','m@gmail.com','Accountant');

CREATE TABLE `orders` (
  `idOrders` int(11) NOT NULL AUTO_INCREMENT,
  `idProducts` int(11) NOT NULL,
  `idPayment` int(11) NOT NULL,
  `FulFilledByEmployeeID` int(11) NOT NULL,
  `DateRequired` date DEFAULT NULL,
  `DateShipped` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idOrders`),
  KEY `idProducts_idx` (`idProducts`),
  KEY `idPayments_idx` (`idPayment`),
  KEY `EmployeeID_idx` (`FulFilledByEmployeeID`),
  CONSTRAINT `EmployeeID` FOREIGN KEY (`FulFilledByEmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `idPayments` FOREIGN KEY (`idPayment`) REFERENCES `payments` (`idPayments`),
  CONSTRAINT `idProduct` FOREIGN KEY (`idProducts`) REFERENCES `products` (`ProductID`)
)
insert into orders values(1,1,1,2,'2018-09-05 00:00:00',NULL,'Not shipped'),
(2,1,2,2,'2018-09-04 00:00:00','2018-09-03 00:00:00','Shipped'),
(3,3,3,3,'2018-09-06 00:00:00',NULL,'Not shipped');

CREATE TABLE `payments` (
  `idPayments` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `PaymentDate` datetime DEFAULT NULL,
  `Amount` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`idPayments`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
)
insert into payments values(1,1,'2018-09-01 00:00:00',150.75),
(4,3,'2018-09-03 00:00:00',700.60),
(5,2,'2018-09-03 00:00:00',150.70); 

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `Description` varchar(300) NOT NULL,
  `BuyPrice` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
)
insert into products values(1,'Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
(2,'Classic Car','Turnable front wheels, steering function',550.75),
(3,'Sports car','Turnable front wheels, steering function',700.60); 

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
