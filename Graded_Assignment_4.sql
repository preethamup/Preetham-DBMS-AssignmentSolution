---------------------------------------------------------------------

-- Q1

create table PASSENGER
(
 Passenger_name varchar(20),
 Category varchar(20),
 Gender varchar(1),
 Boarding_City varchar(20),
 Destination_City varchar(20),
 Distance int,
 Bus_Type varchar(20)
);

select  * from passenger;

create table PRICE
(
 Bus_Type varchar(20),
 Distance int,
 Price int
 );
 
 select * from price;
 -------------------------------------------------------------------------
 
 -- Q2
 
 insert into passenger values
('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
('Udit','Non-AC','M','Trivandrum','panaji',1000,'Sleeper'),
('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
('Hemant','Non-AC','M','panaji','Mumbai',700,'Sleeper'),
('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
('Piyush','AC','M','Pune','Nagpur',700,'Sitting');

select * from passenger;

insert into price values
('Sleeper',350,770),
('Sleeper',500,1100),
('Sleeper',600,1320),
('Sleeper',700,1540),
('Sleeper',1000,2200),
('Sleeper',1200,2640),
('Sleeper',350,434),
('Sitting',500,620),
('Sitting',500,620),
('Sitting',600,744),
('Sitting',700,868),
('Sitting',1000,1240),
('Sitting',1200,1488),
('Sitting',1500,1860);

select * from price;

-------------------------------------------------------------------------------------------

-- Q3

select gender,count(gender) from passenger
where distance >= 600
group by gender;

-- Q4

select min(price) from price 
where bus_type= 'Sleeper';

-- Q5

select passenger_name from passenger
where substr(passenger_name,1,1) = 'S';

-- Q6

select distinct a.passenger_name,a.boarding_city,a.destination_city,a.bus_type,b.price
from passenger a, price b
where a.distance = b.distance
and a.bus_type = b.bus_type	
order by a.passenger_name;

-- Note: There seems to be a mistake in the given data as there are two entries for 350 km for bus_type sleeper with charges 770 and 434

-- Q7

select distinct a.passenger_name,b.price
from passenger a, price b
where a.distance = b.distance
and a.bus_type = b.bus_type
and a.distance = 1000
and a.bus_type = 'Sitting';

-- Note: There is no such passenger

-- Q8

select sum(price)
from passenger a, price b
where a.distance = b.distance
and a.passenger_name = 'Pallavi';

-- Q9

select distinct distance from passenger
order by distance desc;

-- Q10

select passenger_name,(distance/(select sum(distinct distance) from passenger))*100 as percentage
from passenger;

-- Q11

-- For all

select distance,price,
case when price > 1000 then 'Expensive'
when price < 1000 and price > 500 then 'Average Cost'
else 'Cheap' end as verdict
from price;

-- For Sleeper

select distance,price,
case when price > 1000 then 'Expensive'
when price < 1000 and price > 500 then 'Average Cost'
else 'Cheap' end as verdict
from price
where bus_type = 'Sleeper';

-- For Sitting

select distance,price,
case when price > 1000 then 'Expensive'
when price < 1000 and price > 500 then 'Average Cost'
else 'Cheap' end as verdict
from price
where bus_type = 'Sitting';