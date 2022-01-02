--Checking the Data
select *
from [dbo].[complete$]
order by Date
-- total cases per_day_over_india_with_recovery percentage
select Date,sum([New cases])as cases,sum([New recovered]) as recovered,(sum([New recovered])/nullif(sum([New cases]),0))*100 as recovery_percentage 
from [dbo].[complete$]
group by Date
order by Date
-- death percentage all over India
select *,(Death/[Total Confirmed cases])*100 as deathpercentage
from [dbo].[complete$]
order by Death 
--state with highest cases
select top 10 [Name of State / UT],MAX([Total Confirmed cases])as highestinfection
from [dbo].[complete$]
group by [Name of State / UT]
order by highestinfection desc 
--top highest death percentage
select top 10 [Name of State / UT],max([Total Confirmed cases])as highestinfection,MAX(Death)highestdeaths, (max(Death)/max([Total Confirmed cases]))*100 as deathpercentage
from [dbo].[complete$]
group by [Name of State / UT] 
order by highestinfection desc
select * 
from [dbo].[complete$]
where [Name of State / UT] = 'Kerala'
order by Date
select Date,sum([New cases])as total_cases,sum([New deaths])as total_deaths,(sum([New deaths])/nullif (sum([New cases]),0))*100 as deathpercentageperday
from [dbo].[complete$]
group by Date
order by Date
--total deaths in india in the year 2020
select [Name of State / UT], MAX([Total Confirmed cases]) as totalcases_india,max(Death) as totaldeaths_india,(max(Death)/max([Total Confirmed cases]))*100 as percentageoftotal
from [dbo].[complete$]
group by [Name of State / UT]
-- recovery rate per state to check ratio between cases and recovered
SElect  Date , Max([Total Confirmed cases])as cases, MAx([Cured/Discharged/Migrated])as recovered, (max([Cured/Discharged/Migrated])/max([Total Confirmed cases]))*100 as recovery_patient_rate
from [dbo].[complete$]
group by   [Name of State / UT] , Date
order by [Name of State / UT]
-- recovery rate per state per day
SElect   date[Date] ,[Name of State / UT], [Total Confirmed cases], [New recovered], ([New recovered]/[Total Confirmed cases])*100 as recovery_patient_rate
from [dbo].[complete$]
select [Name of State / UT],MAX([Total Confirmed cases])as total_cases,MAX(Death) as total_deaths,MAX([Cured/Discharged/Migrated]) as total_cured
from[dbo].[complete$]
group by [Name of State / UT]
having [Name of State / UT] = 'Maharashtra'
-- most affected state Maharashtra report
select Date , sum([New cases])as cases, SUM([New recovered])as recovered,(sum([New recovered])/nullif(sum([New cases]),0))*100 as recovery_percentage
from[dbo].[complete$]
where [Name of State / UT] = 'Maharashtra'
group by Date
-- next visualizing gathered information in Tableau
