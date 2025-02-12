#1 Creating the schema and required tables using MySQL workbench
-- a. Create a schema named Travego and create the tables mentioned above with the mentioned
-- column names. Also, declare the relevant datatypes for each feature/column in the dataset. 

-- b. Insert the data in the newly created tables. 
create database travego;
use travego;
select * from passenger;
select * from price;
describe passenger;
describe price;

#2. Perform read operation on the designed table created in the above task.
-- a. How many female passengers traveled a minimum distance of 600 KMs? 

select COUNT(*) as female_passenger_travalled_with_min_d_600kms from passenger
where distance <= 600 and Gender = 'F';

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select * from passenger
where distance > 500 and Bus_type = 'sleeper';

-- c.Select passenger names whose names start with the character 'S'
select Passenger_name from passenger
where Passenger_name like 'S%';

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
-- Destination City, Bus type, and Price in the output.
select p.passenger_id,p.passenger_name,p.boarding_city,p.destination_city,pr.bus_type,pr.price from passenger p
 inner join price pr
 on p.passenger_id = pr.id;
 
 -- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
select p.passenger_name,pr.bus_type,pr.distance,pr.price from passenger p
inner join price pr
on p.passenger_id = pr.id
where pr.distance= 1000;

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select p.*,pr.bus_type,pr.price from passenger p
inner join price pr
on p.passenger_id = pr.id
where p.passenger_name = 'pallavi';

-- g .Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
set autocommit = 0 ;

update passenger
set category = 'Non-AC'
where bus_type = 'sleeper';
commit;
savepoint sp1;

-- h.Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
set autocommit = 0;

delete from passenger
where passenger_name = 'piyush';

commit;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required). 
truncate table passenger;
select * from passenger;

-- j. Delete the table passenger from the database.
drop table passenger;
select * from passenger;

-- here truncate will delete all the data inside the table ie rows and columns but retain the structure




