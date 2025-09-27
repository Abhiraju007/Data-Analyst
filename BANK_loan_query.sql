use [bank_project]
select  *from [dbo].[bank_loan]
order by [issue_date] desc

---Total_loan_application

select count([id]) as 'Total_loan_application' from [dbo].[bank_loan]

---MTD Loan Applications

select count([id]) from [dbo].[bank_loan]
where [issue_date] >= DATEFROMPARTS(
                                    year((select max([issue_date]) from [dbo].[bank_loan])),
                       month((select max([issue_date]) from [dbo].[bank_loan])),1)
 AND [issue_date] <= (SELECT MAX(issue_date) FROM [dbo].[bank_loan])



select DATEFROMPARTS(year(max([issue_date])),month(max([issue_date])),1) from [dbo].[bank_loan]

select max([issue_date]) from [dbo].[bank_loan]


 select DATEFROMPARTS(2025,09,20)

 --MOM Loan Applications

  select COUNT([id])
  from [dbo].[bank_loan]
  where [issue_date] >= ( select 
  DATEFROMPARTS(year(EOMONTH(max([issue_date]),-1)),month(EOMONTH(max([issue_date]),-1)),1) from [dbo].[bank_loan])
   AND [issue_date]<= (select EOMONTH(max([issue_date]),-1) from [dbo].[bank_loan])

 --MOM Loan Applications_Percentage

 WITH MTD AS (
 select  count([id]) as 'TOTAL'  from [dbo].[bank_loan]
where [issue_date] >= DATEFROMPARTS(
                                    year((select max([issue_date]) from [dbo].[bank_loan])),
                       month((select max([issue_date]) from [dbo].[bank_loan])),1)
 AND [issue_date] <= (SELECT MAX(issue_date) FROM [dbo].[bank_loan])

 UNION ALL

   select COUNT([id]) as'TOTAL'
  from [dbo].[bank_loan]
  where [issue_date] >= ( select 
  DATEFROMPARTS(year(EOMONTH(max([issue_date]),-1)),month(EOMONTH(max([issue_date]),-1)),1) from [dbo].[bank_loan])
   AND [issue_date]<= (select EOMONTH(max([issue_date]),-1) from [dbo].[bank_loan]
   )
   )
   select *,LEAD(TOTAL,1) over(order by TOTAL asc) from MTD






--Total Funded Amount






  











