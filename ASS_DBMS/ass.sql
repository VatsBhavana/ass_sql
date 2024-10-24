-- Write SQL query to solve the problem given below

create table city(
id int primary key,
city_name varchar(20) not null,
lat float not null,
longg float not null,
country_id int not null);

insert into city values(1,'Berlin',52.520008,13.404954,1);
insert into city values(2,'Belgrade',44.787197,20.457273,2);
insert into city values(3,'Zagreb',45.815399,15.966568,3);
insert into city values(4,'New York',43.730610,-73.935242,4);
insert into city values(5,'Los Angeles',34.052235,-118.243683,4);
insert into city values(6,'Warsaw',52.237049,21.017532,5);

create table customer3(
id int not null,
customer_name varchar(20) not null,
city_id int not null,
customer_address varchar(50) not null,
next_call_date date not null,
 ts_inserted datetime not null,
foreign key(id) references city(id)
);






alter table customer3 modify next_call_date varchar(15) not null;
alter table customer3 modify next_call_date varchar(60) not null;

insert into customer3 values(1,'Jwellery Store',4,'Long Street 120','2020-01-21','2020-01-09 14:01:20.000');
insert into customer3 values(2,'Bakery',1,'Kurfurstendmm 25','2020-02-21','2020-01-09 17:52:15.000');
insert into customer3 values(3,'Cafe',1,'Tauentzienstrbe 44','2020-01-21','2020-01-10 08:02:50.000');
insert into customer3 values(4,'Restaurant',3,'Ulica Lipa 15','2020-01-21','2020-01-10 09:20:21.000');

create table country(
id int not null,
country_name varchar(20)not null,
country_name_eng varchar(20) not null,
country_code varchar(20) not null,
foreign key(id) references city(id));

alter table country modify country_name varchar(60) not null;
alter table country modify country_name_eng varchar(60) not null;

insert into country values(1,'Deutschland','Germany','DEU');
insert into country values(2,'Srbija','Serbia','SRB');
insert into country values(3,'Hrvatska','Croatia','HRV');
insert into country values(4,'United_States_Of_America','United_States_Of_America','USA');
insert into country values(5,'Polska','Poland','POL');
insert into country values(6,'Espana','Spain','ESP');
insert into country values(7,'Rossiya','Russia','RUS');

select * from city;
select * from customer3;
select * from country;

/* Task : 1 (join multiple tables using left join)
List all Countries and customers related to these countries.
For each country displaying its name in English, the name of the city customer is located in as
well as the name of the customer.
Return even countries without related cities and customers.*/

select customer3.customer_name, customer3.customer_address,country.country_name_eng,country.country_name
from city
left join customer3 on city.id = customer3.id
left join country on country.id = city.id;

/*Task : 2 (join multiple tables using both left and inner join)
Return the list of all countries that have pairs(exclude countries which are not referenced by any
city). For such pairs return all customers.
Return even pairs of not having a single customer*/


select customer3.customer_name,customer3.customer_address,country.country_name,customer3.id
from city
inner join country on city.country_id= country.id
left join customer3 on customer3.city_id = city.id;



commit;

