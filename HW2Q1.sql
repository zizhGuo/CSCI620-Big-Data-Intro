Create database HW2Q1;
use HW2Q1;

create table BookPublish(
book int NOT NULL comment 'Book ID',
year int comment 'publish year',
publisher varchar(255) NOT NULL comment 'person publisher',
price int comment 'book price',
num int comment 'book number',
primary key (book)
);

create table BookReference(
book int NOT NULL comment 'Book ID',
referencedBook int NOT NULL comment 'referenced Book ID',
primary Key (book, referencedBook),
foreign key (book) references BookPublish (book),
foreign key (referencedBook) references BookPublish (book)
);

create table BookAuthor(
book int NOT NULL comment 'Book ID',
author varchar(255) NOT NULL comment 'person author',
earnings int NOT NULL comment 'eraning',
primary key (book, author)
);

create table BookReview(
book int NOT NULL comment 'Book ID',
reviewer varchar(255) NOT NULL comment 'person reviewer',
score int NOT NULL comment 'score',
primary key (book, reviewer)
);

insert into bookpublish values(1000, 1999, "Rowan Boyle", 14, 200);
insert into bookpublish values(1001, 2010, "Paul Gray", 32, 320);
insert into bookpublish values(1002, 1994, "Holly Wilson", 55, 50);
insert into bookpublish values(1003, 1995, "Daphne Merkin", 20, 250);
insert into bookpublish values(1004, 1996, "Ewan Blake", 78, 80);
insert into bookpublish values(1005, 1999, "Yan Lee", 30, 300);
insert into bookpublish values(1006, 2003, "Sophie Wong", 99, 20);
insert into bookpublish values(1007, 1992, "Rowan Boyle", 12, 400);
insert into bookpublish values(1008, 1999, "Meimei Han", 32, 150);
insert into bookpublish values(1009, 2003, "Daphne Merkin", 80, 30);

insert into bookauthor values(1000, "Holly Wilson", 35000);
insert into bookauthor values(1000, "Felix mendez", 20000);
insert into bookauthor values(1001, "Cleo Carson", 50000);
insert into bookauthor values(1002, "Joel Reed", 40000);
insert into bookauthor values(1003, "Qiao Lin", 80000);
insert into bookauthor values(1004, "Stephanie Crawford", 40000);
insert into bookauthor values(1004, "Rowan Boyle", 30000);
insert into bookauthor values(1004, "Ewan Blake", 15000);
insert into bookauthor values(1005, "Meimei Han", 30000);
insert into bookauthor values(1006, "Kira Fowler", 35000);
insert into bookauthor values(1007, "Iqra Whitehead", 15000);
insert into bookauthor values(1008, "Yang Song", 25000);
insert into bookauthor values(1009, "Kira Fowler", 20000);

insert into bookreview values(1000, "Cleo Carson", 4);
insert into bookreview values(1000, "Yu Qiao", 4);
insert into bookreview values(1001, "Joel Reed", 5);
insert into bookreview values(1002, "Yang Song", 5);
insert into bookreview values(1003, "Paul Gray", 4);
insert into bookreview values(1003, "Daphne Merkin", 4);
insert into bookreview values(1004, "Paula Bradford", 3);
insert into bookreview values(1004, "Cleo Carson", 4);
insert into bookreview values(1004, "Meimei Han", 5);
insert into bookreview values(1005, "Paul Gray", 5);
insert into bookreview values(1006, "Iqra Whitehead", 4);
insert into bookreview values(1007, "Cleo Carson", 4);
insert into bookreview values(1008, "Holly Wilson", 3);
insert into bookreview values(1009, "Daphne Merkin", 5);

insert into bookreference value(1000, 1002);
insert into bookreference value(1001, 1009);
insert into bookreference value(1002, 1002);
insert into bookreference value(1003, 1001);
insert into bookreference value(1004, 1006);
insert into bookreference value(1005, 1003);
insert into bookreference value(1006, 1001);
insert into bookreference value(1007, 1009);
insert into bookreference value(1008, 1002);
insert into bookreference value(1009, 1000);

# 1) Find all the books published in 1999 and reviewed by Paul.
select p.book
from bookreview as r, bookpublish as p
where r.book = p.book and p.year = 1999 and r.reviewer like "Paul%"
group by r.book;
# result: 1005

# 2) Find all the books reviewed by both Paul Gray and Daphne Merkin.
select r.book
from bookreview as r, bookreview as r1
where r.reviewer = "Paul Gray" and r1.reviewer = "Daphne Merkin" and r.book = r1.book
group by r.book;
#result: 1003

# 3) List each author's total earnings in 1995-2000 in descending order.
select a.author, a.earnings
from bookauthor as a, bookpublish as p
where a.book = p.book and p.year between 1995 and 2000
order by a.earnings desc;
