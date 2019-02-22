Create database HW2Q2;
use HW2Q2;

create table Course(
number int NOT NULL comment 'Course ID',
title varchar(255) comment 'Course title',
credits int comment 'Course credits',
syllabus int comment 'Course syllabus',
primary key (number)
);

create table CourseOffering(
number int NOT NULL comment 'Course ID FK',
year int NOT NULL comment 'CourseOffering year',
semester varchar(255) NOT NULL comment 'CourseOffering semester',
section_number int NOT NULL comment 'CourseOffering section_number',
classroom int comment 'classroom',
primary key (number, year, semester, section_number),
foreign key (number) references Course(number)
);

create table CourseOffering_timing(
number int NOT NULL comment 'Course ID FK',
year int NOT NULL comment 'CourseOffering year',
semester varchar(255) NOT NULL comment 'CourseOffering semester',
section_number int NOT NULL comment 'CourseOffering section_number',
timing int NOT NULL comment 'timing',
primary key (number, year, semester, section_number, timing),
foreign key (number, year, semester, section_number) references CourseOffering(number, year, semester, section_number)
);

create table Student(
student_id int NOT NULL comment 'student ID number',
name varchar(255) comment 'student\'s name',
department varchar(255) comment 'student\'s department',
primary key (student_id)
);

create table Instructor(
instructor_id int NOT NULL comment 'instructor_id ID number',
name varchar(255) comment 'instructor_id\'s name',
department varchar(255) comment 'instructor_id\'s department',
title varchar(255) comment 'instructor\'s title',
primary key (instructor_id)
);

create table Prerequisite(
course_number int NOT NULL comment 'course number',
prerequisite_number int NOT NULL comment 'pre-req course number',
primary key (course_number, prerequisite_number),
foreign key (course_number) references Course(number),
foreign key (prerequisite_number) references Course(number)
);

create table Enrolls (
student_id int NOT NULL comment 'student id Number',
number int NOT NULL comment 'Course ID FK',
year int NOT NULL comment 'CourseOffering year',
semester varchar(255) NOT NULL comment 'CourseOffering semester',
section_number int NOT NULL comment 'CourseOffering section_number',
grade int comment 'student\'s grade for different course',
primary key (student_id, number, year, semester, section_number),
foreign key (student_id) references Student(student_id),
foreign key (number, year, semester, section_number) references CourseOffering(number, year, semester, section_number)
);

create table Teaches (
instructor_id int NOT NULL comment 'instructor id Number',
number int NOT NULL comment 'Course ID FK',
year int NOT NULL comment 'CourseOffering year',
semester varchar(255) NOT NULL comment 'CourseOffering semester',
section_number int NOT NULL comment 'CourseOffering section_number',
primary key (instructor_id, number, year, semester, section_number),
foreign key (instructor_id) references Instructor(instructor_id),
foreign key (number, year, semester, section_number) references CourseOffering(number, year, semester, section_number)
);

insert into Course values(101, "A1", 3, 610);
insert into Course values(102, "A2", 3, 620);
insert into Course values(103, "A3", 3, 630);
insert into Course values(104, "A4", 3, 640);
insert into Course values(105, "A5", 3, 650);
insert into Course values(201, "B1", 3, 610);
insert into Course values(202, "B2", 3, 620);
insert into Course values(203, "B3", 3, 630);
insert into Course values(204, "B4", 3, 640);
insert into Course values(205, "B5", 3, 650);

insert into CourseOffering values(101, 2018, "fall", 01, 3010);
insert into CourseOffering values(102, 2018, "fall", 02, 4002);
insert into CourseOffering values(103, 2019, "spring", 01, 2006);
insert into CourseOffering values(104, 2018, "fall", 02, 4020);
insert into CourseOffering values(105, 2019, "spring", 01, 1030);
insert into CourseOffering values(201, 2018, "fall", 02, 2030);
insert into CourseOffering values(202, 2019, "spring", 01, 3030);
insert into CourseOffering values(203, 2018, "fall", 02, 1010);
insert into CourseOffering values(204, 2019, "spring", 01, 1010);
insert into CourseOffering values(205, 2018, "fall", 01, 3010);

insert into CourseOffering_timing values(101, 2018, "fall", 01, 900);
insert into CourseOffering_timing values(102, 2018, "fall", 02, 800);
insert into CourseOffering_timing values(103, 2019, "spring", 01, 1200);
insert into CourseOffering_timing values(104, 2018, "fall", 02, 1400);
insert into CourseOffering_timing values(105, 2019, "spring", 01, 1000);
insert into CourseOffering_timing values(201, 2018, "fall", 02, 1500);
insert into CourseOffering_timing values(202, 2019, "spring", 01, 900);
insert into CourseOffering_timing values(203, 2018, "fall", 02, 800);
insert into CourseOffering_timing values(204, 2019, "spring", 01, 1000);
insert into CourseOffering_timing values(205, 2018, "fall", 01, 1400);


insert into Student values(7527001, "David Lee", "Computer Science");
insert into Student values(7527002, "Cleo Carson", "Computer Science");
insert into Student values(7527003, "Yu Qiao", "Computer Science");
insert into Student values(7527004, "Joel Reed", "Computer Science");
insert into Student values(7527005, "Paula Bradford", "Computer Science");
insert into Student values(7527006, "Paul Gray", "Electrical Engineering");
insert into Student values(7527007, "Iqra Whitehead", "Electrical Engineering");
insert into Student values(7527008, "Holly Wilson", "Electrical Engineering");
insert into Student values(7527009, "Daphne Merkin", "Electrical Engineering");
insert into Student values(7527010, "Sophie Wong", "Electrical Engineering");

insert into Instructor values(12301, "Ellis Myers", "Computer Science", "Professor");
insert into Instructor values(12302, "Bethany Holmes", "Computer Science", "Professor");
insert into Instructor values(12303, "Leal Cox", "Computer Science", "Associate Professor");
insert into Instructor values(12304, "Wolfe Torres", "Computer Science", "Associate, Professor");
insert into Instructor values(12305, "Kalie Ross", "Computer Science", "Assitant Professor");
insert into Instructor values(12306, "Jonh Hill", "Electrical Engineering", "Professor");
insert into Instructor values(12307, "Redford Bell", "Electrical Engineering", "Professor");
insert into Instructor values(12308, "Aleksa Thomas", "Electrical Engineering", "Associate Professor");
insert into Instructor values(12309, "Leland Rogers", "Electrical Engineering", "Associate Professor");
insert into Instructor values(12310, "Ladawn Davis", "Electrical Engineering", "Assitant Professor");

insert into Prerequisite values(101, 102);
insert into Prerequisite values(102, 103);
insert into Prerequisite values(103, 104);
insert into Prerequisite values(104, 105);
insert into Prerequisite values(101, 104);
insert into Prerequisite values(201, 202);
insert into Prerequisite values(202, 203);
insert into Prerequisite values(203, 204);
insert into Prerequisite values(204, 205);
insert into Prerequisite values(201, 204);

insert into Enrolls values(7527001, 101, 2018, "fall", 01, 80);
insert into Enrolls values(7527002, 101, 2018, "fall", 01, 92);
insert into Enrolls values(7527001, 102, 2018, "fall", 02, 78);
insert into Enrolls values(7527002, 102, 2018, "fall", 02, 73);
insert into Enrolls values(7527003, 103, 2019, "spring", 01, 87);
insert into Enrolls values(7527004, 103, 2019, "spring", 01, 89);
insert into Enrolls values(7527003, 104, 2018, "fall", 02, 61);
insert into Enrolls values(7527004, 104, 2018, "fall", 02, 78);
insert into Enrolls values(7527005, 105, 2019, "spring", 01, 79);
insert into Enrolls values(7527005, 103, 2019, "spring", 01, 83);
insert into Enrolls values(7527006, 201, 2018, "fall", 02, 95);
insert into Enrolls values(7527007, 201, 2018, "fall", 02, 94);
insert into Enrolls values(7527006, 202, 2019, "spring", 01, 76);
insert into Enrolls values(7527007, 202, 2019, "spring", 01, 68);
insert into Enrolls values(7527008, 203, 2018, "fall", 02, 83);
insert into Enrolls values(7527009, 203, 2018, "fall", 02, 82);
insert into Enrolls values(7527008, 204, 2019, "spring", 01, 79);
insert into Enrolls values(7527009, 204, 2019, "spring", 01, 92);
insert into Enrolls values(7527010, 205, 2018, "fall", 01, 83);
insert into Enrolls values(7527010, 203, 2018, "fall", 02, 90);
insert into Teaches values(12301, 101, 2018, "fall", 01);
insert into Teaches values(12302, 102, 2018, "fall", 02);
insert into Teaches values(12303, 103, 2019, "spring", 01);
insert into Teaches values(12304, 104, 2018, "fall", 02);
insert into Teaches values(12305, 105, 2019, "spring", 01);
insert into Teaches values(12306, 201, 2018, "fall", 02);
insert into Teaches values(12307, 202, 2019, "spring", 01);
insert into Teaches values(12308, 203, 2018, "fall", 02);
insert into Teaches values(12309, 204, 2019, "spring", 01);
insert into Teaches values(12310, 205, 2018, "fall", 01);

# 1) Retrieve student_ids, names of students with a major in "Computer Science".
select s.student_id, s.name
from student as s
where s.department = "Computer Science";

# 2) Retrieve student_ids of students who have taken a class with an instructor named "John".
select s.student_id
from student as s, Enrolls as e, Teaches as t, Instructor as i
where s.student_id = e.student_id 
and e.number = t.number and e.year = t.year and e.semester = t.semester and e.section_number = t.section_number
and t.instructor_id = i.instructor_id
and i.name like "Jonh%";

# 3) Retrieve student_ids of students who have never taken a class with an instructor named "John".
select s.student_id
from student as s
where s.student_id not in (select s.student_id
							from student as s, Enrolls as e, Teaches as t, Instructor as i
							where s.student_id = e.student_id 
							and e.number = t.number and e.year = t.year and e.semester = t.semester and e.section_number = t.section_number
							and t.instructor_id = i.instructor_id
							and i.name like "Jonh%");

# 4) Retrieve department names and the number of students with that department major.
select count(s.student_id), s.department
from student as s
group by (s.department);

# 5) Retrieve names of instructors teaching Computer Science courses, the sections (course number, 
#    section number, year, semester) they are teaching, and the total number of students in the sections.
select i.name as "Instructor\'s name", t.number, t.year, t.semester, t.section_number, count(s.student_id) as "Number of students"
from student as s, Enrolls as e, Teaches as t, Instructor as i
where s.student_id = e.student_id 
and e.number = t.number and e.year = t.year and e.semester = t.semester and e.section_number = t.section_number
and t.instructor_id = i.instructor_id
and i.department = "Computer Science"
group by t.number, t.year, t.semester, t.section_number;



show columns from Teaches;
show columns from enrolls;
show columns from Prerequisite;
show columns from Instructor;
show columns from Student;
show columns from CourseOffering_timing;
show columns from CourseOffering;
show columns from Course;


