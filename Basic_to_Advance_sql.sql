# func to find username
SELECT user();

select * from newone.hotel_booking;
select arrival_date_year,market_segment from newone.hotel_booking;
select * from newone.hotel_booking where arrival_date_year='2017';
select arrival_date_month,arrival_date_year,arrival_date_week_number from newone.hotel_booking where arrival_date_year='2017';

#AND , OR , NOT OPERATOR 
#particular ek operation ka leyai use AND
select arrival_date_month,arrival_date_year,market_segment,arrival_date_week_number from newone.hotel_booking where arrival_date_year ='2017' and arrival_date_month ='January';
select deposit_type,reservation_status from newone.hotel_booking where deposit_type = 'No Deposit' or reservation_status= 'Check-Out';
select deposit_type,reservation_status from newone.hotel_booking where not reservation_status= 'Check-Out';
select arrival_date_year,arrival_date_month from newone.hotel_booking where arrival_date_year = '2017' or arrival_date_month= 'June';
#LIKE OPERATOR (find )
select * from newone.hotel_booking where email like '%gmail.com';
#ORDER BY 
select * from newone.hotel_booking order by name asc;
select * from newone.hotel_booking order by name desc;
select * from newone.hotel_booking order by name,arrival_date_day_of_month asc;
#LIMIT CLAUSE (kitna data chahiyai apko show karna ha )
select * from newone.hotel_booking order by name desc limit 5;
select * from newone.hotel_booking order by name desc limit 2,5;
#BETWEEN OPERATOR (work only in num)
select * from newone.hotel_booking where arrival_date_day_of_month between '10' and '23';
#IN , NOT IN OPERATOR (values pr work krai ga)
select * from newone.hotel_booking where country in ('PRT','IRL');
select * from newone.hotel_booking where arrival_date_year='2015' and arrival_date_month  in ('July','August');
select * from newone.hotel_booking where country not in ('PRT','IRL');
#STRING FUNC
#concatenate
select concat(name,' ',country) as destination from newone.hotel_booking;
# ek dafa lagana hoga space (delimeter)  wahera br br nh khud ajai ga wo
select concat_ws(' - ',name,email ,country) as Emp from newone.hotel_booking;
select length(email) as digitCount from newone.hotel_booking;
select Upper(name) as person from newone.hotel_booking;
select lower(country) as CountryNmae from newone.hotel_booking;
select left(name,5) as UserNmae from newone.hotel_booking;
select right(email,5) as UserName from newone.hotel_booking;
#starting Lt and how many digit want
select mid(name,2,3) as UserNmae from newone.hotel_booking;
#DATA AGGREGATION AND NUMERIC FUNC(avg,min ,max value find kr sehkthai hain)
select sum(lead_time) as total from newone.hotel_booking;
select avg(lead_time) as Avg_total from newone.hotel_booking;
select max(adr) as max_value from newone.hotel_booking;
select min(adr) as min_value from newone.hotel_booking;
#if not want point value 
select truncate(lead_time,0) as total from newone.hotel_booking;
# use for ek zada ajai value point conversition
select ceil(adr) as min_value from newone.hotel_booking;
#if want lower value 
select floor(adr) as min_value from newone.hotel_booking;
#DATA FUNCTION(find diff)(date time vala data nh hai ya karna ha kisi csv file lai kar umama tumnai)

#CASE OPERATORS(cond col )
select * from newone.hotel_booking;
select customer_type, adr,
case
	when adr <50 then 'URGENT'
    else 'it is enough'
end as disussion
from newone.hotel_booking;
#if multiple cond
select customer_type, adr,
case
	when adr <50 then 'URGENT'
    when adr >=50 and adr<=90 then 'no more Urgent '
    else 'it is enough'
end as disussion_type
from newone.hotel_booking;
#GROUP BY
select * from bussine.hotel_booking;
select reservation_status,count(country) from newone.hotel_booking group by reservation_status;
select reservation_status,sum(country) from newone.hotel_booking group by reservation_status order by count(reservation_status) asc;
#HAVING CLAUSE
select reservation_status,count(country) from newone.hotel_booking group by reservation_status having count(reservation_status) > 1000;
#join (left,inner ,right...)
SELECT * FROM salesdata.sales_data_sample;
#intersection like
select sales_data_sample.CUSTOMERNAME, country_data.last_update from salesdata.sales_data_sample inner join salesdata.country_data on  sales_data_sample.COUNTRY= country_data.country;

select sales_data_sample.CUSTOMERNAME, country_data.last_update from salesdata.sales_data_sample left join salesdata.country_data on  sales_data_sample.COUNTRY= country_data.country;

select sales_data_sample.CUSTOMERNAME, country_data.last_update, sales_data_sample.COUNTRY from salesdata.sales_data_sample right join salesdata.country_data on  sales_data_sample.COUNTRY= country_data.country;
#give all values not given null
select sales_data_sample.CUSTOMERNAME, country_data.last_update from salesdata.sales_data_sample cross join salesdata.country_data on  sales_data_sample.COUNTRY= country_data.country;

select count(last_update) from salesdata.sales_data_sample cross join salesdata.country_data;

SELECT * FROM regionalsales.us_regional_sales_data;

SELECT * FROM regionalsales.us_regional_sales_data;
select date(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select time(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select year(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select month(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select day(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select dayname(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select monthname(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select hour(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select minute(ProcuredDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select datediff(ProcuredDate,OrderDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select datediff(OrderDate,ShipDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select datediff(ShipDate,DeliveryDate) as FormatedDate FROM regionalsales.us_regional_sales_data;
select datediff(date(OrderDate),date(ShipDate)) as Date FROM regionalsales.us_regional_sales_data;
select getdate(ShipDate) from regionalsales.us_regional_sales_data;


SELECT * FROM salesdata.sales_data_sample;


#Set OPerator(union,intersect etc)
select COUNTRY from salesdata.sales_data_sample 
union 
select country from salesdata.country_data;

#union all (ismai reperting value show krai ga hrr brr wo)
select COUNTRY from salesdata.sales_data_sample 
union all
select country from salesdata.country_data;

#intersect
select COUNTRY from salesdata.sales_data_sample 
intersect
select country from salesdata.country_data;

select COUNTRY from salesdata.sales_data_sample 
where COUNTRY in (select country from salesdata.country_data);
# not repeat the value
select COUNTRY from salesdata.sales_data_sample 
except
select country from salesdata.country_data;

# repeat the value
select COUNTRY from salesdata.sales_data_sample 
where country not in (select country from salesdata.country_data);

#subqueries (first run inner query(bracket ma jo hai) then outer its work on 2 query)
select avg(PRICEEACH) from salesdata.sales_data_sample;
#(wo vale da rah jo above then 90 ha)
select * from salesdata.sales_data_sample where PRICEEACH >90;
#(ya dono avg ko mila kr da raha ha value in one code)
select * from salesdata.sales_data_sample where PRICEEACH > (select avg(PRICEEACH) from salesdata.sales_data_sample);
#similar name ajai ga (intersection)
select sales_data_sample.COUNTRY from salesdata.sales_data_sample 
where sales_data_sample.COUNTRY in (select country_data.country from salesdata.country_data);
# first table mai hai second ,aoi nh ha(except)
select sales_data_sample.COUNTRY from salesdata.sales_data_sample 
where sales_data_sample.COUNTRY not in (select country_data.country from salesdata.country_data);

SELECT * FROM salesdata.country_data;

ALTER TABLE salesdata.country_data
ADD COLUMN agent_level varchar(100); #character limit ha 
SELECT * FROM salesdata.country_data;

update salesdata.country_data set salesdata.country_data.agent_level='TURKEY'; 
SELECT * FROM salesdata.country_data;


#VIEWS in (it is not a table),(virtual table which is made by you like dehknai ka leyai create kia ha table
create view total_customer as
select COUNTRY,count(CUSTOMERNAME) from  salesdata.sales_data_sample group by COUNTRY;

create view USA_data as
select * from salesdata.sales_data_sample where COUNTRY='USA';

#bana kisi bhi sceheme mai lu gi
create view bussiness.total_customer as
select COUNTRY,count(CUSTOMERNAME) from salesdata.sales_data_sample group by COUNTRY;

create view salesdata.total_customer as
select COUNTRY,count(CUSTOMERNAME) from salesdata.sales_data_sample group by COUNTRY;

create view salesdata.USA_data as
select * from salesdata.sales_data_sample where COUNTRY='USA';

#STORED PROCEDURE
Delimiter &&
create procedure salesdata.get_data()
begin
	select * from salesdata.sales_data_sample;    
end &&
Delimiter ;

call salesdata.get_data();

#jitni value chahiyai utni da ga
Delimiter &&
create procedure salesdata.get_limit(in var int)
begin
	select * from salesdata.sales_data_sample limit var;    
end &&
Delimiter ;

call salesdata.get_data();
call salesdata.get_limit(2);

# os col ka max dai dai ga or stored in variable
Delimiter &&
create procedure salesdata.max_sales(out var int)
begin
	select max(SALES) into var from salesdata.sales_data_sample ;    
end &&
Delimiter ;

call salesdata.get_data();
call salesdata.get_limit(2);
call salesdata.max_sales(@b);
select @b;


Delimiter &&
create procedure salesdata.get_name(inout var int)
begin
	select CUSTOMERNAME  from salesdata.sales_data_sample where ORDERNUMBER= var ;    
end &&
Delimiter ;

call salesdata.get_data();
call salesdata.get_limit(2);
call salesdata.max_sales(@b);
select @b;
set @m=10174;
call salesdata.get_name(@m);


select count(CUSTOMERNAME) from salesdata.sales_data_sample where CUSTOMERNAME='Australian Gift Network, Co';


Delimiter &&
create procedure salesdata.get_name(inout var int)
begin
	select CUSTOMERNAME  from salesdata.sales_data_sample where ORDERNUMBER= var ;    
end &&
Delimiter ;


call salesdata.get_data();
call salesdata.get_limit(2);
call salesdata.max_sales(@b);
select @b;
call salesdata.get_name(10183);

SELECT * FROM salesdata.sales_data_sample;
select CUSTOMERNAME,SALES,ADDRESSLINE1,YEAR_ID, sum(SALES) over (partition by YEAR_ID) from salesdata.sales_data_sample ;

select CUSTOMERNAME,SALES,ADDRESSLINE1,YEAR_ID, sum(SALES) over (partition by YEAR_ID order by CUSTOMERNAME) from salesdata.sales_data_sample ;
#konsi cheze kitni dafa a rahe os ka serial no bata raha ha
select *, row_number()
over(partition by salesdata.sales_data_sample .COUNTRY) from salesdata.sales_data_sample  ;

select *, rank()
over(partition by sales_data_sample.COUNTRY) from salesdata.sales_data_sample ;

select *, rank()
over(partition by COUNTRY order by QUANTITYORDERED) from salesdata.sales_data_sample ;
#give same value bcz nothing for changes
select *, dense_rank()
over(partition by COUNTRY order by QUANTITYORDERED) from salesdata.sales_data_sample ;

select CUSTOMERNAME,SALES,ADDRESSLINE1,YEAR_ID, rank() over (partition by YEAR_ID order by SALES) from salesdata.sales_data_sample ;
# ek sa zada chezo mai 1,2 hoga or value dai ga sahi wo 
select CUSTOMERNAME,SALES,ADDRESSLINE1,YEAR_ID, dense_rank() over (partition by YEAR_ID order by SALES) from salesdata.sales_data_sample ;

SELECT * FROM newone.hotel_booking;
#find total data entries
select count(meal) from newone.hotel_booking;
# Arrange name in alphabetic order
select * FROM newone.hotel_booking order by name asc;
#create view 
create view newone.alphabet_customer as
select * FROM newone.hotel_booking order by name asc;
#arrange in asc
select * FROM newone.hotel_booking order by agent asc;
#group by agent
select agent FROM newone.hotel_booking group by agent order by agent asc;
#count how many blanks value in agent 
select count(agent) from newone.hotel_booking where agent='' ;
#create col
select agent,
case
	when agent='' then 'Cheaper'
    when agent>=1 and agent<=100 then 'Level one'
    when agent>100 and agent<=200 then 'Level two'
    when agent>200 and agent<=300 then 'Level three'
    when agent>300 and agent<=400 then 'Level four'
    when agent>400 then 'Premium'
end as no_of_level
from newone.hotel_booking;
#  sequence maintain
select agent,
case
	when agent='' then 'Cheaper'
    when agent>=1 and agent<=100 then 'Level one'
    when agent>100 and agent<=200 then 'Level two'
    when agent>200 and agent<=300 then 'Level three'
    when agent>300 and agent<=400 then 'Level four'
    when agent>400 then 'Premium'
end as no_of_level
from newone.hotel_booking order by no_of_level asc ;

ALTER TABLE newone.hotel_booking
ADD COLUMN agent_level varchar(500); #character limit ha 
SELECT * FROM newone.hotel_booking;

UPDATE hotel_booking
SET agent_level=
case
	when agent='' then 'Cheaper'
    when agent>=1 and agent<=100 then 'Level one'
    when agent>100 and agent<=200 then 'Level two'
    when agent>200 and agent<=300 then 'Level three'
    when agent>300 and agent<=400 then 'Level four'
    else 'Premium'
end;
select * from newone.hotel_booking;

#create view newone.get_name as
select reserved_room_type,assigned_room_type,
case
	when reserved_room_type = assigned_room_type then 'wanted room'
    
    else 'not wanted room'
end as wanted
from newone.hotel_booking order by wanted asc ;

select count(wanted) from newone.hotel_booking where wanted='not wanted room' ;















