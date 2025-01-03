create database bank_1BM23CS071;

use bank_1BM23CS071;

create table Branch (
	branch_name varchar(20),
    branch_city varchar(20),
    assets real,
    primary key (branch_name)
);

insert into branch values("SBI_Chamrajpet","Bangalore",50000);
insert into branch values("SBI_ResidencyRoad","Bangalore",10000);
insert into branch values("SBI_ShivajiRoad","Bombay",20000);
insert into branch values("SBI_ParlimentRoad","Delhi",10000);
insert into branch values("SBI_Jantarmantar","Delhi",20000);

select * from branch;

create table Bank_account (
	accno int,
	branch_name varchar(20),
    balance real,
    primary key (accno),
    foreign key (branch_name) references Branch(branch_name)
);

insert into Bank_account values(1,"SBI_Chamrajpet",2000);
insert into Bank_account values(2,"SBI_ResidencyRoad",5000);
insert into Bank_account values(3,"SBI_ShivajiRoad",6000);
insert into Bank_account values(4,"SBI_ParlimentRoad",9000);
insert into Bank_account values(5,"SBI_Jantarmantar",8000);
insert into Bank_account values(6,"SBI_ShivajiRoad",6000);
insert into Bank_account values(7,"SBI_ResidencyRoad",5000);
insert into Bank_account values(8,"SBI_ResidencyRoad",5000);

select * from bank_account;


create table bank_customer (
	customer_name varchar(20),
    cutomer_street varchar(20),
    customer_city varchar(20),
    primary key(customer_name)
);

insert into bank_customer value("Avinash","Bull_Temple_Road","Bangalore");
insert into bank_customer value("Dinesh","Bannergatta_Road","Bangalore");
insert into bank_customer value("Mohan","NationalCollege_Road","Bangalore");
insert into bank_customer value("Nikil","Akbar_Road","Delhi");
insert into bank_customer value("Ravi","PritviRaj_Road","Delhi");
insert into bank_customer value("Bramha","PritviRaj_Road","Delhi");

select * from bank_customer;


create table depositor (
	customer_name varchar(20),
    accno int,
    primary key (customer_name,accno),
    foreign key (accno) references Bank_account (accno),
    foreign key (customer_name) references bank_customer(customer_name)
);

insert into depositor values("Avinash",1);
insert into depositor values("Dinesh",2);
insert into depositor values("Nikil",4);
insert into depositor values("Ravi",5);
insert into depositor values("Mohan",3);
insert into depositor values("Bramha",7);
insert into depositor values("Bramha",8);


select * from depositor;

create table loan (
	loan_number int,
    branch_name varchar(20),
    amount real,
    primary key (loan_number) ,
    foreign key (branch_name) references Branch(branch_name)
);

insert into loan values(1,"SBI_Chamrajpet",1000);
insert into loan values(2,"SBI_ResidencyRoad",2000);
insert into loan values(3,"SBI_ShivajiRoad",3000);
insert into loan values(4,"SBI_ParlimentRoad",4000);
insert into loan values(5,"SBI_Jantarmantar",5000);

select * from loan;

select branch_name, assets as "assets in lakhs" from branch;

select depositor.customer_name from depositor,bank_account where bank_account.branch_name="SBI_ResidencyRoad" and bank_account.accno=depositor.accno
group by customer_name
having count(*)>=2;
