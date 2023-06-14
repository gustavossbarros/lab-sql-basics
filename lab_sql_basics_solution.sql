-- Q1
select client_id
from bank.client
where district_id = 1
limit 5;

-- Q2
select client_id
from bank.client
where district_id = 72
order by client_id desc
limit 1;

-- Q3
select amount
from bank.loan
order by amount
limit 3;

-- Q4
select distinct status
from bank.loan
order by status;

-- Q5
select loan_id
from bank.loan
order by payments desc
limit 1;
-- I'm getting loan_id 6415 instead of the expected result of 6312

-- Q6
select account_id, amount
from bank.loan
order by account_id
limit 5;

-- Q7
select account_id
from bank.loan
where duration = 60
order by amount;

-- Q8
select distinct k_symbol
from bank.order
order by k_symbol;

-- Q9
select order_id
from bank.order
where account_id = 34;

-- Q10
select distinct account_id
from bank.order
where order_id between 29540 and 29560;

-- Q11
select amount
from bank.order
where account_to = 30067122;

-- Q12
select trans_id, date, type, amount
from bank.trans
where account_id = 793
order by date desc
limit 10;

-- Q13
select district_id, count(*)
from bank.client
where district_id < 10
group by district_id
order by district_id;

-- Q14
select type, count(*)
from bank.card
group by type;

-- Q15
select account_id, amount
from bank.loan
order by amount desc
limit 10;

-- Q16
select date, count(*) as loans_issued
from bank.loan
where date < 930907
group by date
order by date desc;

-- Q17
select date, duration, count(*) as loans_issued
from bank.loan
where date between 971201 and 971231
group by date, duration
order by date, duration;

-- Q18
select account_id, type, sum(amount)
from bank.trans
where account_id = 396
group by type;

-- Q19
select 
		account_id,
		case
		when type = 'PRIJEM' then 'INCOMING'
		when type = 'VYDAJ' then 'OUTGOING'
		end as transaction_type,
		floor(sum(amount)) as total_amount
from bank.trans
where account_id = 396
group by type;

-- Q20
select
	account_id,
	floor(sum(case when type = 'PRIJEM' then amount end), 2) as 'incoming',
    floor(sum(case when type = 'VYDAJ' then amount end), 2) as 'outgoing',
    floor(sum(case when type = 'PRIJEM' then amount end) - 
		  sum(case when type = 'VYDAJ' then amount end), 2) as 'difference'
from bank.trans
where account_id = 396;

-- Q21
select
	account_id,
    floor(sum(case when type = 'PRIJEM' then amount end) - 
		  sum(case when type = 'VYDAJ' then amount end)) as 'difference'
from bank.trans
group by account_id
order by difference desc
limit 10;