create database StackOverflow
go

use StackOverflow
go

create table Categories(
CategoryID int primary key identity(1,1),
CategoryName nvarchar(max))
go

create table Users(
UserID int primary key identity(1,1),
Email nvarchar(max),
PasswordHash nvarchar(max),
Name nvarchar(max),
Mobile nvarchar(max),
IsAdmin bit default(0))
go


create table Questions(
QuestionID int primary key identity(1,1),
QuestionName nvarchar(max),
QuestionDateAndTime datetime,
UserID int references Users(UserID) on delete cascade,
CategoryID int references Categories(CategoryID) on delete cascade,
VotesCount int,
AnswersCount int,
ViewsCount int)
go

create table Answers(
AnswerID int primary key identity(1,1),
AnswerText nvarchar(max),
AnswerDateAndTime datetime,
UserID int references Users(UserID),
QuestionID int references Questions(QuestionID) on delete cascade,
VotesCount int)
go

create table Votes(
VoteID int primary key identity(1,1),
UserID int references Users(UserID),
AnswerID int references Answers(AnswerID) on delete cascade,
VoteValue int)
go

insert into Users values('admin@gmail.com', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9',
'Admin', '0000000000', 1)
go
-- password:  admin123

insert into Users values('test@gmail.com', 'ECD71870D1963316A97E3AC3408C9835AD8CF0F3C1BC703527C30265534F75AE',
'Test', '0000000000', 0)  -- password: test123
go

insert into Categories values('HTML')
insert into Categories values('CSS')
insert into Categories values('JavaScript')

insert into Questions values('How to display icon in the browser titlebar using HTML','2018-09-02 10:03 am',2,1,0,0,0)
insert into Questions values('How to Set background image in CSS','2018-08-05 09:03 pm',2,2,0,0,0)


