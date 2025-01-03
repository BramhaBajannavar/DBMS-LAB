

select branch_name,assets
from branch;


select customer_name
from bank_customer
where customer_city = "Bangalore";


select customer_name, accno
from depositor;


select d.customer_name
from depositor d, bank_account b
join branch on d.accno = b.accno
where b.branch_name = "Bangalore"
group by b.branch_name
having count(b.branch_name) = (
		select count(*) 
		from bank_customer
		where customer_city = "Bangalore"
        );


select d.customer_name , d.accno
from depositor d ,Bank_account b
where d.accno = b.accno and b.balance > 1000;

select l.loan_number
from loan l , bank_account b
where l.branch_name = b.branch_name;



select branch_name , count(accno)
from bank_account
group by branch_name;


select loan.branch_name
from loan,branch
where loan.branch_name = branch.branch_name and loan.branch_name = NULL;



select branch_name,sum(amount) as total_loans
from loan
group by branch_name
order by total_loans asc
limit 1;
