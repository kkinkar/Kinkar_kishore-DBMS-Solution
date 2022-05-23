create database E_commerce_website;
drop database if exists E_commerce_website;
drop table if exists supplier;
use E_commerce_website;
create table Supplier(Supp_id int primary key,
					  Supp_name varchar(50) not null,
                      Supp_city varchar(30) not null,
                      Supp_phone varchar(15)
                      );
create table Customer(Cus_id int primary key,
					  Cus_name varchar(20),
                      Cus_phone varchar(10),
                      Cus_city varchar(30),
                      Cus_gender char
                      );
create table Category(Cat_id int primary key,
					   Cat_name varchar(20) not null
                       );

create table Products(Pro_id int primary key,
					  Pro_name varchar(20) not null,
                      Pro_desc varchar(60),
                      Cat_id int,
                      foreign key(Cat_id) references Category (Cat_id) 
                      );

create table Supplier_pricing(Pricing_id int primary key,
							  Pro_id int,
                              Supp_id int,
                              Supp_price int default 0,
                              foreign key(Pro_id) references Products(Pro_id),
							  foreign key(Supp_id) references Supplier(supp_id)
                              );
                              
create table Orders (Order_id int primary key,
					Order_amount int not null,
                    Order_date date not null,
                    Cus_id int,
                    Pricing_id int,
                    foreign key(Cus_id) references Customer(Cus_id),
                    foreign key(Pricing_id) references Supplier_pricing(Pricing_id)
                    );
create table rating (Rat_id int primary key,
					 Rat_ratstars int not null,
                     Order_id int,
                     foreign key(Order_id) references Orders(Order_id)
                     );
insert into supplier values(1, "Rajesh Retails", "Delhi", 1234567890);  
insert into supplier values(2, "Appario Ltd.", "Mumbai", 2589631470); 
insert into supplier values(3, "Knome products", "Banglore", 9785462315); 
insert into supplier values(4, "Bansal Retails", "Kochi", 8975463285); 
insert into supplier values(5, "Mittal Ltd.", "Lucknow", 7898456532); 
insert into Customer values(1, "AAKASH", "9999999999", "DELHI", 'M');  
insert into Customer values(2, "AMAN", "9785463215", "NOIDA", 'M'); 
insert into Customer values(3, "NEHA", "9999987999", "MUMBAI", 'F'); 
insert into Customer values(4, "MEGHA", "9994562399", "KOLKATA", 'F'); 
insert into Customer values(5, "PULKIT", "7895999999", "LUCKNOW", 'M');  
insert into Category values(1, "BOOKS");
insert into Category values(2, "GAMES");  
insert into Category values(3, "GROCERIES"); 
insert into Category values(4, "ELECTRONICS"); 
insert into Category values(5, "CLOTHES");          
insert into Products values(1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into Products values(2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into Products values(3, "ROG", "LAPTOP Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into Products values(4, "OATS", "Highly Nutritious from Nestle", 3);
insert into Products values(5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into Products values(6, "MILK", "1L Toned MIlk", 3);
insert into Products values(7, "Boat", "Earphones 1.5Meter long Dolby Atmos", 4);
insert into Products values(8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into Products values(9, "Project IGI", "compatible with windows 7 and above", 2);
insert into Products values(10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into Products values(11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into Products values(12, "Train Your Brain", "By Shireen Stephen", 1);
insert into Supplier_pricing values(1, 1, 2, 1500);
insert into Supplier_pricing values(2, 3, 5, 30000);
insert into Supplier_pricing values(3, 5, 1, 3000);
insert into Supplier_pricing values(4, 2, 3, 2500);
insert into Supplier_pricing values(5, 4, 1, 1000);
insert into Orders values(101, 1500, "2021-10-06", 2, 1);
insert into Orders values(102, 1000, "2021-10-12", 3, 5);
insert into Orders values(103, 30000, "2021-09-16", 5, 2);
insert into Orders values(104, 1500, "2021-10-05", 1, 1);
insert into Orders values(105, 3000, "2021-08-16", 4, 3);
insert into Orders values(106, 1450, "2021-08-18", 1, 4);
insert into Orders values(107, 789, "2021-09-01", 3, 5);
insert into Orders values(108, 780, "2021-09-07", 5, 1);
insert into Orders values(109, 3000, "2021-01-10", 5, 3);
insert into Orders values(110, 2500, "2021-09-10", 2, 4);
insert into Orders values(111, 1000, "2021-09-15", 4, 5);
insert into Orders values(112, 789, "2021-09-16", 4, 2);
insert into Orders values(113, 31000, "2021-09-16", 1, 3);
insert into Orders values(114, 1000, "2021-09-16", 3, 5);
insert into Orders values(115, 3000, "2021-09-16", 5, 3);
insert into Orders values(116, 99, "2021-09-17", 2, 5);
insert into rating values(1, 4, 101);
insert into rating values(2, 3, 102);
insert into rating values(3, 1, 103);
insert into rating values(4, 2, 104);
insert into rating values(5, 4, 105);
insert into rating values(6, 3, 106);
insert into rating values(7, 4, 107);
insert into rating values(8, 4, 108);
insert into rating values(9, 3, 109);
insert into rating values(10, 5, 110);
insert into rating values(11, 3, 111);
insert into rating values(12, 4, 112);
insert into rating values(13, 2, 113);
insert into rating values(14, 1, 114);
insert into rating values(15, 1, 115);
insert into rating values(16, 0, 116);
/*3rd query*/
select count(1),c.cus_gender from customer c join Orders o on c.cus_id
 = o.cus_id where Order_amount >= 3000 group by c.cus_gender;
 /*9th query*/
 select supplier.supp_id,Supp_name,Rat_ratstars, 
 case when Rat_ratstars=5 then "Excellent Services" 
 when Rat_ratstars=4 then "good service" 
 when Rat_ratstars>=2 then "Average service" else "Poor service" end as type_of_service from supplier inner join supplier_pricing on supplier.Supp_id=supplier_pricing.Supp_id inner join orders on supplier_pricing.Pricing_id=orders.Pricing_id inner join rating on orders.Order_id=rating.Order_id;
/*4th query*/
select O.*,p.Pro_name from Orders O inner join supplier_pricing s on 
O.Pricing_id = s.pricing_id inner join products p on s.Pro_id = p.Pro_id
where O.Cus_id = 2;
/*6th query*/
select min(s.Supp_price) Least_expensive ,p.*,c.Cat_name from supplier_pricing s inner join products p
on s.Pro_id = p.Pro_id inner join category c on p.Cat_id = c.Cat_id group by c.Cat_id;
/*7th query*/
select Pro_id,Pro_name,Order_date from products,Orders where order_date > '2021-10-05';
/*8th query*/
select Cus_name,Cus_gender from customer where Cus_name like '%A%';
/*5th query*/
SELECT s.*, PRO_NAME, COUNT(sp.PRO_ID) AS No_of_Products FROM supplier s INNER JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
INNER JOIN products p ON sp.PRO_ID = p.PRO_ID GROUP BY SUPP_ID HAVING No_of_products > 1 ORDER BY SUPP_ID;

drop procedure review;
/*9th query another method*/
DELIMITER $$
CREATE PROCEDURE Review()
BEGIN
SELECT s.SUPP_ID, s.SUPP_NAME, rt.RAT_RATSTARS,
CASE
    WHEN rt.RAT_RATSTARS =5 THEN 'EXCELLENT SERVICE'
    WHEN rt.RAT_RATSTARS = 4 THEN 'GOOD SERVICE'
	WHEN rt.RAT_RATSTARS > 2 THEN 'AVERAGE SERVICE'
    ELSE 'POOR SERVICE'
END AS Type_of_Service
FROM rating rt
INNER JOIN orders ON rt.Order_id= orders.Order_id
INNER JOIN supplier_pricing sp ON sp.PRICING_ID= orders.PRICING_ID
INNER JOIN supplier s ON s.SUPP_ID= sp.SUPP_ID;
END $$
DELIMITER ;

call Review();


