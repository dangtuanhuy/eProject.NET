create table Administrator
(
Username nvarchar(20) Primary Key,
Password nvarchar(32) not null
);
create table Customer
(
Customer_Id nvarchar(20) Primary Key,
Customer_LastName nvarchar(20),
Customer_FirstName nvarchar(20),
Customer_Bithday date,
Customer_Gender bit default 1,
Customer_Phone nvarchar(20),
Customer_Address ntext,
Customer_Email nvarchar(50),
Customer_Possport nvarchar(20)
);
create table Location
(
Location_Id nvarchar(20) Primary Key,
Location_Name nvarchar(20),
Location_Location nvarchar(20)
)
create table TouristSpot
(
TouristSpot_Id nvarchar(20) Primary Key,
TouristSpot_Name nvarchar(30),
TouristSpot_Specific nvarchar(20),
TouristSpot_Img nvarchar(50),
Location_Id nvarchar(20) REFERENCES Location
on delete cascade
on update cascade
)
create table Trip(
Trip_Id nvarchar(20) Primary Key,
Trip_Name nvarchar(25) not null,
Trip_Details ntext
)
create table Restaurants
(
Restaurant_Code nvarchar(20) Primary Key,
Restaurant_Name nvarchar(20),
Restaurant_Address nvarchar(150),
Restaurant_Description ntext,
TouristSpot_Id nvarchar(20) REFERENCES TouristSpot
on delete cascade
on update cascade
)
create table ImgRestaurants
(
Img_Restaurants_Id int NOT NULL IDENTITY,
Img_Restaurants nvarchar(max),
Img_Restaurants_Sort tinyint not null,
Restaurant_Code nvarchar(20) REFERENCES Restaurants
)
create table Foods
(
Food_Code nvarchar(20) Primary Key,
Food_Name nvarchar(20),
Food_Cost decimal (12,2),
Food_Specific ntext,
Restaurant_Code nvarchar(20) REFERENCES Restaurants
on delete cascade
on update cascade
)
create table ImgFoods
(
Img_Foods_Id int NOT NULL IDENTITY,
Img_Foods nvarchar(max),
Img_Foods_Sort tinyint not null,
Food_Code nvarchar(20) REFERENCES Foods
)
create table Hotels
(
Hotel_Id nvarchar(20) Primary key,
Hotel_Name nvarchar(20),
Hotel_Address nvarchar(255),
Hotel_Details nvarchar(255),
TouristSpot_Id nvarchar(20) REFERENCES TouristSpot
on delete cascade
on update cascade,

)
create table ImgHotels
(
Img_Hotels_Id int NOT NULL IDENTITY,
Img_Hotels nvarchar(max),
Img_Hotels_Sort tinyint not null,
Hotel_Id nvarchar(20) REFERENCES Hotels
)
create table Rooms
(
Room_Id nvarchar(20) Primary Key,
Room_Type nvarchar(15),
Room_Name nvarchar(20),
Room_Start time,
Room_Stop time,
Room_Cost money,
Hotel_Id nvarchar(20) REFERENCES Hotels
on delete cascade
on update cascade,
)
create table ImgRooms
(
Img_Rooms_Id int NOT NULL IDENTITY,
Img_Rooms nvarchar(max),
Img_Rooms_Sort tinyint not null,
Room_Id nvarchar(20) REFERENCES Rooms
)
alter table ImgFoods
ADD PRIMARY KEY (Img_Foods_Id)

alter table ImgHotels
ADD PRIMARY KEY (Img_Hotels_Id)

alter table ImgRestaurants
ADD PRIMARY KEY (Img_Restaurants_Id)

alter table ImgRooms
ADD PRIMARY KEY (Img_Rooms_Id)

create table Transportations
(
Transportation_Id nvarchar(20) Primary Key,
Transportation_Name nvarchar(30) not null,
Transportation_Details nvarchar(255),
Transportation_Img nvarchar(50),
TouristSpot_Id nvarchar(20) REFERENCES TouristSpot
on delete cascade
on update cascade,
)

create table Vihicle(
Vihicle_Id nvarchar(20),
Vihicle_Name nvarchar(50),
Vihicle_Weight int,
Vihicle_Img nvarchar(50),
Transportation_Id nvarchar(20) REFERENCES Transportations
on delete cascade
on update cascade,

)

create table Trip_Customer
(
 Customer_Id nvarchar(20) References Customer ,
 Trip_Id nvarchar(20) References Trip ,
 Primary key (Customer_Id, Trip_Id)

)
create table Trip_TouristSpot
(
Trip_Id nvarchar(20) References Trip ,
TouristSpot_Id nvarchar(20) References TouristSpot,
Primary Key (Trip_Id,TouristSpot_Id)
)
create table Abouts
(
AboutId int Primary key IDENTITY,
AboutName nvarchar(50),
AboutBirth date,
AboutGender bit,
AboutLike nvarchar (150),
AboutImg nvarchar (250)
)
create table Feedback(

FeedbackId int Primary key Identity,
SenderName nvarchar(50),
SenderMail nvarchar(50),
FeedBackTitle nvarchar(40),
FeedBackContent nvarchar(150),
State int not null default 0,
Create_on datetime NOT NULL DEFAULT GETDATE()
)