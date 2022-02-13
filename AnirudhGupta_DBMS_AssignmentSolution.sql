-- Creating the database
Create Database if not exists TavelOnTheGo ;

-- Using the database
use TavelOnTheGo;

-- Creating the tables 
create table if not exists Passenger(
Passenger_Name varchar(50) ,
Category varchar(50),
Gender varchar(10),
Boarding_City varchar(50),
Destination_City varchar(50),
Distance INT,
Bus_Type varchar(50)
);

create table if not exists Price(
Bus_Type varchar(50) ,
Distance INT,
Price INT
);

-- inserying the values in the table
insert into Passenger values("Sejal", "AC","F", "Bengaluru", "Chennai", 350,"Sleeper");
insert into Passenger values("Anmol", "Non-AC", "M", "Mumbai","Hyderabad", 700,"Sitting");
insert into Passenger values("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
insert into Passenger values("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
insert into Passenger values("Udit","Non-AC", "M", "Trivandrum", "panaji" ,1000 ,"Sleeper");
insert into Passenger values("Ankur", "AC", "M","Nagpur", "Hyderabad" ,500 ,"Sitting");
insert into Passenger values("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
insert into Passenger values("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into Passenger values("Piyush", "AC", "M", "Pune", "Nagpur", 700 ,"Sitting");

select * from Passenger;

insert into Price values("Sleeper", 350 ,770);
insert into Price values("Sleeper", 500, 1100);
insert into Price values("Sleeper", 600, 1320);
insert into Price values("Sleeper", 700, 1540);
insert into Price values("Sleeper", 1000, 2200);
insert into Price values("Sleeper", 1200, 2640);
insert into Price values("Sleeper", 1500, 2700);
insert into Price values("Sitting", 600, 744);
insert into Price values("Sitting", 700, 868);
insert into Price values("Sitting", 1000, 1240);
insert into Price values("Sitting", 1200, 1488);
insert into Price values("Sitting" ,1500, 1860);
insert into Price values("Sitting" ,500, 620);


select * from Price;

-- 3)How many females and how many male passengers travelled for a minimum distance of 600 KM s?
select Gender, count(Gender) as Count from Passenger where Distance >= 600 group by Gender;

-- 4) Find the minimum ticket price for Sleeper Bus. 
select MIN(Price) from Price where Bus_Type = "Sleeper";

-- 5) Select passenger names whose names start with character 'S' 
select Passenger_Name from Passenger where Passenger_Name LIKE 'S%';


-- 6)Calculate price charged for each passenger displaying Passenger name, Boarding City, 
-- Destination City, Bus_Type, Price in the output
select Passenger.Passenger_name,Passenger.Boarding_City,Passenger.Destination_City, Passenger.Bus_Type,Price.Price 
from Passenger inner join price on 
Passenger.Bus_Type = Price.Bus_Type and Passenger.Distance = Price.Distance;

-- 7)What are the passenger name/s and his/her ticket price who travelled in the Sitting bus 
-- for a distance of 1000 KM s
select Passenger.Passenger_name,Price.Price 
from Passenger inner join price on 
Passenger.Bus_Type = Price.Bus_Type and Passenger.Distance = Price.Distance
where Passenger.Distance = 1000 and Passenger.Bus_Type ="Sitting";

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select Bus_Type, Price from Price where Distance = 
(select Distance from Passenger where Passenger_name = "Pallavi");

-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
select distinct(Distance) from Passenger order by Distance desc;

-- 10) Display the passenger name and percentage of distance travelled by that passenger 
-- from the total distance travelled by all passengers without using user variables 
select Passenger_Name, Distance/ (select sum(Distance) from Passenger)*100
 as PercentageDisatnce from Passenger;

-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap
SELECT Distance,Price,
CASE
    WHEN Price >1000 THEN 'Expensive'
    WHEN Price<1000 AND Price >500 THEN 'Average Cost'
    ELSE 'Cheap'
END AS Category FROM Price;


