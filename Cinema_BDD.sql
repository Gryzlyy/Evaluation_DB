-- DB's and tables' creation
create database Cinema_DB;

create table Users (
    Id char(36) primary key not null,
    Name varchar(50) not null,
    Firstname varchar(50) not null,
    Phone varchar(20),
    Email varchar(254) not null,
    Password varchar(30) not null,
    DateBirth date not null,
    Handicapped bool
);

create table Films (
    Id int primary key auto_increment,
    Title varchar(100) not null,
    FilmShow datetime not null,
    RoomId int not null,
    AgesRestriction bool not null
);

create table Rooms (
  Id int primary key auto_increment,
  Capacity int not null,
  HandicappedFriendly bool not null
);

create table ReservationTickets (
    UserId char(36) not null,
    FilmId int not null,
    primary key (UserId, FilmId),
    foreign key (UserId) references Users(Id),
    foreign key (FilmId) references Films(Id),
    SeatNumber varchar(4)
);

create table Roles (
  IdRole int primary key not null auto_increment,
  RoleName varchar(100) not null
);

create table UserRoles (
    UserId char(36) not null,
    RoleId int not null,
    primary key (UserId, RoleId),
    foreign key (UserId) references Users(Id),
    foreign key (RoleId) references Roles(IdRole)
);


-- some implementation for test

insert into Users (Id, Name, Firstname, Phone, Email, Password, DateBirth, Handicapped)
values (UUID(), 'Tyler', 'Durden', '0601020304', 'tyler@durden.com', 'p@$$word', '1990-02-03', false);

insert into Films (Title, FilmShow, RoomId, AgesRestriction)
values ('Star Wars', '2021-03-10 10:25:00', 1, false);

insert into Rooms (Capacity, HandicappedFriendly)
values (1000, true);

insert into Roles (RoleName)
values ('Client');

-- some reading test
select
       *
from
     Users;


select
       Title, FilmShow
from
     Films
where
    AgesRestriction = true;

-- some updating test
update
    Users
set
    Email = 'tylerdurden@gmail.com',
    Phone = '+33 601020304'
where
    Id = 1;

-- some deleting test
delete from Users
where
    Id = 1;