SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastNmae]
      ,[Age]
      ,[Gender]
  FROM [Sql Angraiz].[dbo].[EmployeeDemographic]

  select count(LastNmae) as LastNameCount
  from EmployeeDemographic

  select max(Salary)
  from EmployeeSalary

   select min(Salary)
  from EmployeeSalary

   select avg(Salary)
  from EmployeeSalary

  select * from [Sql Angraiz].dbo.EmployeeSalary

  select *
  from EmployeeDemographic
  where Age> 19

   select *
  from EmployeeDemographic
  where Age <=20

   select *
  from EmployeeDemographic
  where Age <=20 AND Gender='male'

   select *
  from EmployeeDemographic
  where Age <=20 OR Gender='male'

  select *
  from EmployeeDemographic
  where FirstName like 'U%'

  select *
  from EmployeeDemographic
  where FirstName like '%n%'

  select *
  from EmployeeDemographic
  where FirstName like 'U%an%'

  select *
  from EmployeeDemographic
  where FirstName is NOT NULL

  select *
  from EmployeeDemographic
  where FirstName ='Ghania'

  select *
  from EmployeeDemographic
  where FirstName in('Ghania','Umama')

  select Gender , count(Gender)
  from EmployeeDemographic
  GROUP BY Gender

   select Gender , count(Gender) AS CountGender
  from EmployeeDemographic
  where Age>19
  GROUP BY Gender


  select * 
  from EmployeeDemographic
  order by Age DESC,Gender DESC

  select * 
  from EmployeeDemographic
  order by Age ,Gender

  -- define no of table intead of name
   select * 
  from EmployeeDemographic
  order by 4 DESC

  select *
  from [Sql Angraiz].dbo.EmployeeDemographic
  INNER JOIN [Sql Angraiz].dbo.EmployeeSalary
  ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

  select *
  from [Sql Angraiz].dbo.EmployeeDemographic
  FULL OUTER JOIN [Sql Angraiz].dbo.EmployeeSalary
  ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

  select *
  from [Sql Angraiz].dbo.EmployeeDemographic
  LEFT OUTER JOIN  [Sql Angraiz].dbo.EmployeeSalary
  ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

  select *
  from [Sql Angraiz].dbo.EmployeeDemographic
RIGHT OUTER JOIN [Sql Angraiz].dbo.EmployeeSalary
  ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

  select *
  from [Sql Angraiz].dbo.EmployeeDemographic
  FULL OUTER JOIN [Sql Angraiz].dbo.EmployeeSalary
  ON EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID

select EmployeeDemographic.EmployeeID,FirstName,LastNmae,Salary
from [Sql Angraiz].dbo.EmployeeDemographic
INNER JOIN [Sql Angraiz].dbo.EmployeeSalary
on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Usman'
ORDER BY SALARY DESC

select	JobTitle,avg(Salary) as Avg_Salary
from [Sql Angraiz].dbo.EmployeeDemographic
INNER JOIN [Sql Angraiz].dbo.EmployeeSalary
on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle= 'salesman'
GROUP BY JobTitle

--union,Union All
select *
  from [Sql Angraiz].dbo.EmployeeDemographic
  union
  select *
  from [Sql Angraiz].dbo.WareHouseDemographic


  select *
  from [Sql Angraiz].dbo.EmployeeDemographic
  union all
  select *
  from [Sql Angraiz].dbo.WareHouseDemographic
  order by EmployeeID

  select EmployeeID,FirstName,Age
  from [Sql Angraiz].dbo.EmployeeDemographic
  union 
  select EmployeeID,JobTitle,Salary
  from [Sql Angraiz].dbo.EmployeeSalary
  order by EmployeeID

  --Case Statement
select FirstName,LastNmae,Age,
Case
     when Age>=20 Then 'old' 
	 when Age BETWEEN 16 AND 19 THEN 'young'  
	 else 'baby' 
END as ans
from [Sql Angraiz].dbo.EmployeeDemographic
where Age is not null

select EmployeeDemographic.EmployeeID,FirstName,LastNmae, JobTitle,Salary,
CASE
	when JobTitle='salesman' Then Salary + (Salary *.10)
	when JobTitle='hr' Then Salary +(Salary*.05)
	else Salary+(Salary*.03)
END As SalaryAfterRaise
from [Sql Angraiz].dbo.EmployeeDemographic
JOIN [Sql Angraiz].dbo.EmployeeSalary
on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
--when used with then and in case statement or where we use singular

--Having Clause
select JobTitle,count(JobTitle)
from [Sql Angraiz].dbo.EmployeeDemographic
join [Sql Angraiz].dbo.EmployeeSalary
on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having  count(JobTitle) >1

select JobTitle,avg(Salary)
from [Sql Angraiz].dbo.EmployeeDemographic
join [Sql Angraiz].dbo.EmployeeSalary
on EmployeeDemographic.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having avg(Salary) >45000
order by avg(Salary)

--Updating/Deleting Data
--agr null hoga tu update kr da ga agr h howa tu existing value kar da ga change
select *
  from [Sql Angraiz].dbo.EmployeeDemographic

update [Sql Angraiz].dbo.EmployeeDemographic
SET EmployeeID=2011,Age=18
Where FirstName='Ayesha' AND LastNmae='Khan'

select *
  from [Sql Angraiz].dbo.EmployeeDemographic

Delete
from [Sql Angraiz].dbo.EmployeeDemographic
where EmployeeID=2011
--you would check what before what you will deleted is already the same thing or not
select *
from [Sql Angraiz].dbo.EmployeeDemographic
where EmployeeID=2011

--Aliasing

select FirstName as Fname
from [Sql Angraiz].dbo.EmployeeDemographic

select FirstName Fname
from [Sql Angraiz].dbo.EmployeeDemographic

select FirstName+' '+ LastNmae as FullName
from [Sql Angraiz].dbo.EmployeeDemographic

select avg(Age) as AvgAge
from [Sql Angraiz].dbo.EmployeeDemographic
-- select ka bd alias ai ga tu wo col name ha or from ka bd walai mai pori query ko ek table mai dal rahai hain
select Demo.EmployeeID, Sal.Salary,Demo.FirstName,Ware.Age
from [Sql Angraiz].dbo.EmployeeDemographic as Demo
join [Sql Angraiz].dbo.EmployeeSalary as sal
on Demo.EmployeeID=Sal.EmployeeID
left join [Sql Angraiz].dbo.WareHouseDemographic Ware
on Demo.EmployeeID =Ware.EmployeeID

select Demo.EmployeeID,Demo.FirstName,Sal.JobTitle
from [Sql Angraiz].dbo.EmployeeDemographic as Demo
join [Sql Angraiz].dbo.EmployeeSalary as sal
on Demo.EmployeeID=Sal.EmployeeID


--partition by

select FirstName,LastNmae,Gender, Salary,
count(Gender) over (partition by Gender) as TotalGender
from [Sql Angraiz].dbo.EmployeeDemographic dem
join [Sql Angraiz].dbo.EmployeeSalary sal
on dem.EmployeeID=sal.EmployeeID

select Gender,count(Gender) as TotalGender
from [Sql Angraiz].dbo.EmployeeDemographic dem
join [Sql Angraiz].dbo.EmployeeSalary sal
on dem.EmployeeID=sal.EmployeeID
group by Gender

--CTE (common table expression),doing all over thing in one query
WITH CTE_Employee as 
(select FirstName,LastNmae,Gender,Salary
, count(gender) over (partition by Gender ) as TotalGender
, Avg(Salary) over (Partition by Gender) as AvgSalary
from [Sql Angraiz]..EmployeeDemographic emp
join [Sql Angraiz]..EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID
where Salary > '4500'
)
select *
from  CTE_Employee

WITH CTE_Employee as 
(select FirstName,LastNmae,Gender,Salary
, count(gender) over (partition by Gender ) as TotalGender
, Avg(Salary) over (Partition by Gender) as AvgSalary
from [Sql Angraiz]..EmployeeDemographic emp
join [Sql Angraiz]..EmployeeSalary sal
on emp.EmployeeID = sal.EmployeeID
where Salary > '4500'
)
select FirstName ,AvgSalary
from  CTE_Employee


--Temp Tables (use further they don't use your memry)
Create Table #temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)

select * from #temp_Employee

Insert into #temp_Employee values(
'1001','hr','45000'
)
Insert into #temp_Employee
select *
from [Sql Angraiz]..EmployeeSalary



Drop Table If EXISTS #Temp_Employee2
create table #Temp_Employee2(
JobTiltle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

insert into #Temp_Employee2
select JobTitle,count(JobTitle) ,Avg(Age),Avg(Salary)
from [Sql Angraiz].dbo.EmployeeDemographic emp
join [Sql Angraiz].dbo.EmployeeSalary sal
  on emp.EmployeeID=sal.EmployeeID
group by JobTitle

select * 
from #Temp_Employee2

--string func, TRIM,LTRIM,RTRIM,REPLACE,SUBSTRING,UPPER,LOWER

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors

--trim (reduced space from both sides)
select EmployeeID, TRIM(EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID, LTRIM(EmployeeID) as IDTRIM
from EmployeeErrors

select EmployeeID, RTRIM(EmployeeID) as IDTRIM
from EmployeeErrors

--REPLACE
select LastName, REPLACE(LastName,'- Fired','')
as LastNameFixed
from EmployeeErrors

--substring (first one is starting part and the second num is how much letter you want)
select SUBSTRING(FirstName,1,4)
from EmployeeErrors


 
 --upper and lower
select FirstName,LOWER(FirstName)
as NameFixed
from EmployeeErrors

Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
FROM EmployeeErrors err
JOIN EmployeeDemographic dem
	on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
	and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)


select FirstName,UPPER(FirstName)
as NameFixed
from EmployeeErrors

--stored procedure

CREATE PROCEDURE TEST
as
select *
From EmployeeDemographic

EXEC TEST



create procedure Umama 
as 
select * from EmployeeDemographic

EXEC Umama

create procedure Temp_Employee
AS
CREATE TABLE #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM [Sql Angraiz]..EmployeeDemographic emp
JOIN [Sql Angraiz]..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee;

EXEC Temp_Employee @JobTitle ='salesman'

--subqueries

--subquery in select
select EmployeeID,Salary,(select avg(Salary) from EmployeeSalary) as AllAvgSalary
from EmployeeSalary

--how to do it with partition by
select EmployeeID,Salary, avg(Salary) over() as AllAvgSalary
from EmployeeSalary

--why group by does not work 
select EmployeeID,Salary, avg(Salary) over() as AllAvgSalary
from EmployeeSalary
group by EmployeeID,Salary
order by EmployeeID,Salary

--subquery in from
Select a.EmployeeID,AllAvgSalary
from (select EmployeeID,Salary, Avg(Salary) over() as AllAvgSalary
from EmployeeSalary) a

--subquery in where
select EmployeeID,JobTitle,Salary
from EmployeeSalary
where EmployeeeID in(
					select EmployeeID
					from EmployeeDemographics where Age >300