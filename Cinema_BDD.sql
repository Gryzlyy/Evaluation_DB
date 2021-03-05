create database Cinema_DB;

create table Clients (
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
    ClientId char(36) not null,
    FilmId int not null,
    primary key (ClientId, FilmId),
    foreign key (ClientId) references Clients(Id),
    foreign key (FilmId) references Films(Id),
    SeatNumber varchar(4)
);

create table Roles (
  IdRole int primary key not null auto_increment,
  RoleName varchar(100) not null
);

create table UserRoles (
    ClientId char(36) not null,
    RoleId int not null,
    primary key (ClientId, RoleId),
    foreign key (ClientId) references Clients(Id),
    foreign key (RoleId) references Roles(IdRole)
);
