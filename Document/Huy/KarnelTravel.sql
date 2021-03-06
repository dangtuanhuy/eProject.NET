USE [master]
GO
/****** Object:  Database [KarnelTravel]    Script Date: 9/25/2018 12:57:24 AM ******/
CREATE DATABASE [KarnelTravel]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KarnelTravel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KarnelTravel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KarnelTravel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KarnelTravel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KarnelTravel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KarnelTravel] SET ARITHABORT OFF 
GO
ALTER DATABASE [KarnelTravel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KarnelTravel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KarnelTravel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KarnelTravel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KarnelTravel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KarnelTravel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KarnelTravel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KarnelTravel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KarnelTravel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KarnelTravel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KarnelTravel] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [KarnelTravel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KarnelTravel] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [KarnelTravel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KarnelTravel] SET  MULTI_USER 
GO
ALTER DATABASE [KarnelTravel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KarnelTravel] SET ENCRYPTION ON
GO
USE [KarnelTravel]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Abouts]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[AboutId] [int] IDENTITY(1,1) NOT NULL,
	[AboutName] [nvarchar](50) NULL,
	[AboutBirth] [date] NULL,
	[AboutGender] [bit] NULL,
	[AboutLike] [nvarchar](150) NULL,
	[AboutImg] [nvarchar](250) NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[AboutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Id] [nvarchar](20) NOT NULL,
	[Customer_Password] [nvarchar](32) NULL,
	[Customer_LastName] [nvarchar](20) NULL,
	[Customer_FirstName] [nvarchar](20) NULL,
	[Customer_Bithday] [date] NULL,
	[Customer_Gender] [bit] NULL,
	[Customer_Phone] [nvarchar](20) NULL,
	[Customer_Address] [ntext] NULL,
	[Customer_Email] [nvarchar](50) NULL,
	[Customer_Possport] [nvarchar](20) NULL,
 CONSTRAINT [PK__Customer__8CB28699363DD3B5] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[SenderName] [nvarchar](50) NULL,
	[SenderMail] [nvarchar](50) NULL,
	[FeedBackTitle] [nvarchar](40) NULL,
	[FeedBackContent] [nvarchar](150) NULL,
	[State] [bit] NOT NULL,
	[Create_on] [datetime] NOT NULL,
 CONSTRAINT [PK__Feedback__6A4BEDD6D723F049] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foods](
	[Food_Code] [nvarchar](20) NOT NULL,
	[Food_Name] [nvarchar](20) NULL,
	[Food_Price] [decimal](12, 2) NULL,
	[Food_Specific] [ntext] NULL,
	[Restaurant_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Food_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Hotel_Id] [nvarchar](20) NOT NULL,
	[Hotel_Name] [nvarchar](120) NULL,
	[Hotel_Address] [nvarchar](255) NULL,
	[Hotel_Details] [nvarchar](max) NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Hotels__AA4FC851081BE738] PRIMARY KEY CLUSTERED 
(
	[Hotel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgFoods]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgFoods](
	[Img_Foods_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Foods] [nvarchar](max) NULL,
	[Img_Foods_Sort] [tinyint] NOT NULL,
	[Food_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Foods_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgHotels]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgHotels](
	[Img_Hotels_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Hotels] [nvarchar](max) NULL,
	[Img_Hotels_Sort] [tinyint] NOT NULL,
	[Hotel_Id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Hotels_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgRestaurants]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgRestaurants](
	[Img_Restaurants_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Restaurants] [nvarchar](max) NULL,
	[Img_Restaurants_Sort] [tinyint] NOT NULL,
	[Restaurant_Code] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Restaurants_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgRooms]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgRooms](
	[Img_Rooms_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_Rooms] [nvarchar](max) NULL,
	[Img_Rooms_Sort] [tinyint] NOT NULL,
	[Room_Id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Img_Rooms_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgTouristSpot]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImgTouristSpot](
	[Img_TouristSpot_Id] [int] IDENTITY(1,1) NOT NULL,
	[Img_TouristSpot] [nvarchar](max) NULL,
	[Img_TouristSpot_Sort] [tinyint] NOT NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK_ImgTouristSpot] PRIMARY KEY CLUSTERED 
(
	[Img_TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Location_Id] [nvarchar](20) NOT NULL,
	[Location_Name] [nvarchar](20) NULL,
	[Location_Location] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[Restaurant_Code] [nvarchar](20) NOT NULL,
	[Restaurant_Name] [nvarchar](20) NULL,
	[Restaurant_Address] [nvarchar](150) NULL,
	[Restaurant_Description] [ntext] NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Restaurant_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Room_Id] [nvarchar](20) NOT NULL,
	[Room_Type] [nvarchar](55) NULL,
	[Room_Name] [nvarchar](50) NULL,
	[Room_Start] [time](7) NULL,
	[Room_Stop] [time](7) NULL,
	[Room_Cost] [money] NULL,
	[Hotel_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Rooms__19EE6A1397D0401A] PRIMARY KEY CLUSTERED 
(
	[Room_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TouristSpot]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TouristSpot](
	[TouristSpot_Id] [nvarchar](20) NOT NULL,
	[TouristSpot_Name] [nvarchar](30) NULL,
	[TouristSpot_Limit] [int] NULL,
	[TouristSpot_Price] [decimal](12, 0) NULL,
	[TouristSpot_Specific] [nvarchar](20) NULL,
	[TouristSpot_Status] [bit] NULL,
	[Location_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__TouristS__87091DC549C789A0] PRIMARY KEY CLUSTERED 
(
	[TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportations]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportations](
	[Transportation_Id] [nvarchar](20) NOT NULL,
	[Transportation_Name] [nvarchar](100) NOT NULL,
	[Transportation_Details] [nvarchar](255) NULL,
	[Transportation_Img] [nvarchar](150) NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK__Transpor__B821F19693C36C8D] PRIMARY KEY CLUSTERED 
(
	[Transportation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[Trip_Id] [int] IDENTITY(1,1) NOT NULL,
	[Trip_Name] [nvarchar](25) NOT NULL,
	[Trip_Details] [ntext] NULL,
	[Trip_Date] [datetime] NULL,
	[Trip_Address] [ntext] NULL,
	[Trip_Status] [bit] NULL,
	[Customer_Id] [nvarchar](20) NULL,
	[PaymentId] [int] NULL,
	[MasterOnline] [nvarchar](50) NULL,
 CONSTRAINT [PK__Trip__6852735EF9FB8961] PRIMARY KEY CLUSTERED 
(
	[Trip_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripDetails]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripDetails](
	[Trip_Id] [int] NOT NULL,
	[TouristSpot_Id] [nvarchar](20) NOT NULL,
	[Trip_Quantity] [int] NULL,
	[OrginalPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_TripDetails] PRIMARY KEY CLUSTERED 
(
	[Trip_Id] ASC,
	[TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 9/25/2018 12:57:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Vehicle_Id] [nvarchar](20) NOT NULL,
	[Vehicle_Name] [nvarchar](50) NULL,
	[Vehicle_Price] [decimal](12, 0) NULL,
	[Vehicle_Weight] [int] NULL,
	[Vehicle_Img] [nvarchar](50) NULL,
	[Transportation_Id] [nvarchar](20) NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([AboutId], [AboutName], [AboutBirth], [AboutGender], [AboutLike], [AboutImg]) VALUES (1, N'Mr Đặng Tuấn Huy', CAST(N'1997-01-01' AS Date), 0, N'C#,PHP, Laravel', N'~/myImg/Abouts/1/20160919102603-xe-may.jpg')
INSERT [dbo].[Abouts] ([AboutId], [AboutName], [AboutBirth], [AboutGender], [AboutLike], [AboutImg]) VALUES (2, N'Mr Trần Trung Phong', CAST(N'1997-01-01' AS Date), 1, N'Java', N'~/myImg/Abouts/2/20160919102603-xe-may.jpg')
INSERT [dbo].[Abouts] ([AboutId], [AboutName], [AboutBirth], [AboutGender], [AboutLike], [AboutImg]) VALUES (3, N'Mr Phạm Nguyễn Hoàng Sơn', CAST(N'1998-01-01' AS Date), 1, N'Angular', N'~/myImg/Abouts/3/20160919102603-xe-may.jpg')
INSERT [dbo].[Abouts] ([AboutId], [AboutName], [AboutBirth], [AboutGender], [AboutLike], [AboutImg]) VALUES (4, N'Miss Nguyễn Thị Yến Nhi', CAST(N'1995-01-01' AS Date), 1, N'Designer', N'~/myImg/Abouts/4/Capture.PNG')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'dangtuanhuy', N'61fcd36c8292bdf65aab93287009f0f0')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'hanabi', N'd43fcce13f4c88fd28c279cc2859f579')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'hoangson', N'24ca43c7f02d50e1b0882485e9859a31')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 1, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY1', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 1, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY2', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 1, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY3', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 1, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'LHH', NULL, N'Huong', N'Luong', CAST(N'1988-01-02' AS Date), 1, N'(+84)925028454', N'CaiRang, Can Tho', N'huongluonf@gmail.com', N'D001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'LHH1', NULL, N'Huong', N'Luong', CAST(N'1988-01-02' AS Date), 1, N'(+84)925028454', N'CaiRang, Can Tho', N'huongluonf@gmail.com', N'D001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'LHH22', NULL, N'Huong', N'Luong', CAST(N'1988-01-02' AS Date), 1, N'(+84)925028454', N'CaiRang, Can Tho', N'huongluonf@gmail.com', N'D001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'LHH3', NULL, N'Huong', N'Luong', CAST(N'1988-01-02' AS Date), 1, N'(+84)925028454', N'CaiRang, Can Tho', N'huongluonf@gmail.com', N'D001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NAT', NULL, N'Tuan', N'Anh', CAST(N'1995-01-02' AS Date), 1, N'(+84)925029450', N'Ninh Kieu,Can Tho', N'yamino@gmail.com', N'B001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NAT1', NULL, N'Tuan', N'Anh', CAST(N'1995-01-02' AS Date), 1, N'(+84)925029450', N'Ninh Kieu,Can Tho', N'yamino@gmail.com', N'B001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NAT2', NULL, N'Tuan', N'Anh', CAST(N'1995-01-02' AS Date), 1, N'(+84)925029450', N'Ninh Kieu,Can Tho', N'yamino@gmail.com', N'B001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NAT3', NULL, N'Tuan', N'Anh', CAST(N'1995-01-02' AS Date), 1, N'(+84)925029450', N'Ninh Kieu,Can Tho', N'yamino@gmail.com', N'B001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NDT', NULL, N'Trung', N'Duc', CAST(N'1998-01-04' AS Date), 1, N'(+84)925828450', N'Kien Giang, An Giang', N'yamiku@gmail.com', N'A0301849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NDT1', NULL, N'Trung', N'Duc', CAST(N'1998-01-04' AS Date), 1, N'(+84)925828450', N'Kien Giang, An Giang', N'yamiku@gmail.com', N'A0301849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NDT2', NULL, N'Trung', N'Duc', CAST(N'1998-01-04' AS Date), 1, N'(+84)925828450', N'Kien Giang, An Giang', N'yamiku@gmail.com', N'A0301849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NDT3', NULL, N'Trung', N'Duc', CAST(N'1998-01-04' AS Date), 1, N'(+84)925828450', N'Kien Giang, An Giang', N'yamiku@gmail.com', N'A0301849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NHH', NULL, N'Hai', N'24', CAST(N'1993-01-02' AS Date), 1, N'(+84)925088450', N'Yen Bai', N'nana@gmail.com', N'R001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NHH24', NULL, N'Hai', N'24', CAST(N'1993-01-02' AS Date), 1, N'(+84)925088450', N'Yen Bai', N'nana@gmail.com', N'R001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NHH242', NULL, N'Hai', N'24', CAST(N'1993-01-02' AS Date), 1, N'(+84)925088450', N'Yen Bai', N'nana@gmail.com', N'R001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NHH243', NULL, N'Hai', N'24', CAST(N'1993-01-02' AS Date), 1, N'(+84)925088450', N'Yen Bai', N'nana@gmail.com', N'R001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NTYN', NULL, N'Nhi', N'Yen', CAST(N'1996-08-31' AS Date), 0, N'(+84)925028150', N'Can Tho', N'yamino@gmail.com', N'A001867')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NTYN1', NULL, N'Nhi', N'Yen', CAST(N'1996-08-31' AS Date), 0, N'(+84)925028150', N'Can Tho', N'yamino@gmail.com', N'A001867')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NTYN2', NULL, N'Nhi', N'Yen', CAST(N'1996-08-31' AS Date), 0, N'(+84)925028150', N'Can Tho', N'yamino@gmail.com', N'A001867')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'NTYN3', NULL, N'Nhi', N'Yen', CAST(N'1996-08-31' AS Date), 0, N'(+84)925028150', N'Can Tho', N'yamino@gmail.com', N'A001867')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'OTML', NULL, N'Linh', N'My', CAST(N'1978-01-02' AS Date), 1, N'(+84)925038450', N'Go Cong, Tien Giang', N'otmlinh@cusc.ctu.edu.com', N'C001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'OTML1', NULL, N'Linh', N'My', CAST(N'1978-01-02' AS Date), 1, N'(+84)925038450', N'Go Cong, Tien Giang', N'otmlinh@cusc.ctu.edu.com', N'C001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'OTML2', NULL, N'Linh', N'My', CAST(N'1978-01-02' AS Date), 1, N'(+84)925038450', N'Go Cong, Tien Giang', N'otmlinh@cusc.ctu.edu.com', N'C001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'OTML3', NULL, N'Linh', N'My', CAST(N'1978-01-02' AS Date), 1, N'(+84)925038450', N'Go Cong, Tien Giang', N'otmlinh@cusc.ctu.edu.com', N'C001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'PNHS', NULL, N'Son', N'Pham', CAST(N'1998-12-31' AS Date), 1, N'(+84)925028445', N'Hong Nghu', N'yamishiba@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'PNHS1', NULL, N'Son', N'Pham', CAST(N'1998-12-31' AS Date), 1, N'(+84)925028445', N'Hong Nghu', N'yamishiba@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'PNHS2', NULL, N'Son', N'Pham', CAST(N'1998-12-31' AS Date), 1, N'(+84)925028445', N'Hong Nghu', N'yamishiba@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'PNHS3', NULL, N'Son', N'Pham', CAST(N'1998-12-31' AS Date), 1, N'(+84)925028445', N'Hong Nghu', N'yamishiba@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTP', NULL, N'Tran', N'Phong', CAST(N'1991-11-02' AS Date), 1, N'(+84)925128450', N'Phong Dien', N'hikari@gmail.com', N'A001843')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTP1', NULL, N'Tran', N'Phong', CAST(N'1991-11-02' AS Date), 1, N'(+84)925128450', N'Phong Dien', N'hikari@gmail.com', N'A001843')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTP2', NULL, N'Tran', N'Phong', CAST(N'1991-11-02' AS Date), 1, N'(+84)925128450', N'Phong Dien', N'hikari@gmail.com', N'A001843')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTP3', NULL, N'Tran', N'Phong', CAST(N'1991-11-02' AS Date), 1, N'(+84)925128450', N'Phong Dien', N'hikari@gmail.com', N'A001843')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTT', NULL, N'Thai', N'Tan', CAST(N'1995-01-02' AS Date), 1, N'(+84)925028441', N'Ca Mau, Minh Hai', N'fuu@gmail.com', N'A101849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTT1', NULL, N'Thai', N'Tan', CAST(N'1995-01-02' AS Date), 1, N'(+84)925028441', N'Ca Mau, Minh Hai', N'fuu@gmail.com', N'A101849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTT2', NULL, N'Thai', N'Tan', CAST(N'1995-01-02' AS Date), 1, N'(+84)925028441', N'Ca Mau, Minh Hai', N'fuu@gmail.com', N'A101849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'TTT3', NULL, N'Thai', N'Tan', CAST(N'1995-01-02' AS Date), 1, N'(+84)925028441', N'Ca Mau, Minh Hai', N'fuu@gmail.com', N'A101849')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (1, N'Mr Dang Tuan ', N'dthuya17007@cusc.ctu.edu.vn', N'Food and Restaurent', N'Very Good', 0, CAST(N'2018-09-12T10:56:34.000' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (2, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:26:46.743' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (3, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.253' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (4, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.267' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (5, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.267' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (6, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.283' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (7, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.283' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (8, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.283' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (9, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.300' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (10, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.300' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (11, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.300' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (12, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.313' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (13, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15T11:29:57.313' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (14, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.313' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (15, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.330' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (16, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.330' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (17, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.347' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (18, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.347' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (19, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.347' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (20, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.360' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (21, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.360' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (22, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.360' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (23, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.377' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (24, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.377' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (25, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.410' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (26, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.410' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (27, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.410' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (28, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.423' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (29, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.423' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (30, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15T11:29:57.440' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (31, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.440' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (32, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.440' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (33, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.457' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (34, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.457' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (35, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.487' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (36, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.487' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (37, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.503' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (38, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.503' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (39, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.503' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (40, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.517' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (41, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15T11:29:57.517' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0001', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0002', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0003', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0004', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0005', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0006', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0007', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0008', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0009', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0010', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0011', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0012', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0013', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0014', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0015', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0016', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0017', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0018', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0019', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0020', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0021', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0022', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0023', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F0024', N'Fresh seafood', CAST(4500000.00 AS Decimal(12, 2)), N'', N'RTR1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT1', N'Muong Thanh Luxury', N'Area E1, Cai Khe River Islet, Cai Khe Ward , Can Tho city, Việt Nam agoda', N'Very Luxury', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT10', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT11', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT12', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT13', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT14', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS2')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT2', N'Vinpearl Hotel Can Tho', N'No. 209, 30/4 Street, Xuan Khanh Ward, Ninh Kieu district, can tho', N'Vinpearl Tho Hotel is located in Ninh Kieu district, with views of the river area Tho poetic and tender of the West River. Hotels Vinpearl Tho lies in the combination of zone 5 star hotel, Trade Center Vincom Plaza largest regional Mekong Delta is a resort ideal, the convergence between the beauty of modern and beauty TV President of Can Tho. Vinpearl Tho hotel with over 260 rooms will give you a wide choice of accommodation types advanced international standards, offering relaxed comfort with modern facilities and amenities. Vinpearl Tho hotel has a luxury restaurant system, including Alarcate Allday Dinning and will certainly serve travelers with great meals. In addition, Vinpearl Tho hotel also has a system Bar and Lounge, Spa area with modern therapies to ensuring guests moments of relaxation.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT3', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT4', N'Iris Can Tho', N'224 30/4 Street, Xuan Khanh Ward, Ninh Kieu District, Can Tho', N'Hotel Iris has 73 rooms including room Rating: VIP Suite, Deluxe, Superior Executive, Superior Premium, Superior. The rooms are equipped with modern amenities items in the cozy, harmonious. You will have moments of great relaxation in the luxury space and offering a dedicated service. Iris Tho has a system of leisure services and entertainment to please guests. You can sign up for tours to famous landmarks in Can Tho, explore the river region. Funding or singing with family and friends in the karaoke room equipped with professional sound. Last day or relax with a spa treatment course from the professional staff of Iris. The hotel restaurant serves European cuisine - attractive Asian diners. Coffee Lounge serves light snacks and coffee.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT5', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT6', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT7', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT8', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Details], [TouristSpot_Id]) VALUES (N'HT9', N'Azerai Can Tho', N'Con Au, Hung Phu ward, Cai Rang District, Can Tho', N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1')
SET IDENTITY_INSERT [dbo].[ImgHotels] ON 

INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (9, N'new.PNG', 7, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (11, N'thieap.PNG', 8, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (12, N'new.PNG', 9, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (14, N'thieap.PNG', 10, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (15, N'thieap.PNG', 11, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (16, N'thieap.PNG', 12, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (17, N'Rest-1.jpg', 1, N'HT10')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (18, N'LeftGrass.jpg', 2, N'HT10')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (19, N'Room1.jpg', 3, N'HT10')
SET IDENTITY_INSERT [dbo].[ImgHotels] OFF
SET IDENTITY_INSERT [dbo].[ImgRestaurants] ON 

INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (3, N'restaurant-chocolat.jpg', 3, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (4, N'Rest-1.jpg', 4, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (5, N'Rest-1.jpg', 5, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (6, N'restaurant-chocolat.jpg', 6, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (7, N'Rest-1.jpg', 1, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (8, N'Rest-1.jpg', 2, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (9, N'restaurant-chocolat.jpg', 3, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (10, N'Rest-1.jpg', 1, N'RTR11')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (11, N'Rest-1.jpg', 2, N'RTR11')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (12, N'restaurant-chocolat.jpg', 3, N'RTR11')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (13, N'LeftGrass.jpg', 1, N'RTR12')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (14, N'thieap.PNG', 4, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (15, N'thieap.PNG', 5, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (16, N'thieap.PNG', 6, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (17, N'watch.PNG', 7, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (18, N'LeftGrass.jpg', 7, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (19, N'LeftGrass.jpg', 8, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (20, N'LeftGrass.jpg', 9, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (21, N'thieap.PNG', 10, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (22, N'thieap.PNG', 11, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (23, N'thieap.PNG', 12, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (24, N'Train.jpg', 13, N'RTR1')
SET IDENTITY_INSERT [dbo].[ImgRestaurants] OFF
SET IDENTITY_INSERT [dbo].[ImgRooms] ON 

INSERT [dbo].[ImgRooms] ([Img_Rooms_Id], [Img_Rooms], [Img_Rooms_Sort], [Room_Id]) VALUES (4, N'Room1.jpg', 3, N'R01')
INSERT [dbo].[ImgRooms] ([Img_Rooms_Id], [Img_Rooms], [Img_Rooms_Sort], [Room_Id]) VALUES (5, N'Room1.jpg', 4, N'R01')
INSERT [dbo].[ImgRooms] ([Img_Rooms_Id], [Img_Rooms], [Img_Rooms_Sort], [Room_Id]) VALUES (9, N'LeftGrass.jpg', 6, N'R01')
INSERT [dbo].[ImgRooms] ([Img_Rooms_Id], [Img_Rooms], [Img_Rooms_Sort], [Room_Id]) VALUES (10, N'LeftGrass.jpg', 7, N'R01')
INSERT [dbo].[ImgRooms] ([Img_Rooms_Id], [Img_Rooms], [Img_Rooms_Sort], [Room_Id]) VALUES (11, N'LeftGrass.jpg', 8, N'R01')
SET IDENTITY_INSERT [dbo].[ImgRooms] OFF
SET IDENTITY_INSERT [dbo].[ImgTouristSpot] ON 

INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (1, N'20160919102603-xe-may.jpg', 1, N'a')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (2, N'20160919102603-xe-may.jpg', 2, N'a')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (3, N'20160919102603-xe-may.jpg', 3, N'a')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (4, N'20160919102603-xe-may.jpg', 1, N'TS10')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (5, N'LeftGrass.jpg', 4, N'a')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (6, N'Room1.jpg', 1, N'TS12')
SET IDENTITY_INSERT [dbo].[ImgTouristSpot] OFF
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC1', N'Southern VietNam', N'Mekong Delta1')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC2', N'North VietNam', N'Red river delta')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC3', N'Northwest VietNam', N'North-west forest')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC4', N'Beach VietNam', N'Central')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR1', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR10', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR11', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR12', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR13', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR14', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR15', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR16', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR17', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR18', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR19', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR2', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR20', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR21', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR3', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR4', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR5', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR6', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR7', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR8', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Description], [TouristSpot_Id]) VALUES (N'RTR9', N'Southern restaurant', N'48 Hai Ba Trung - Region 1, Ninh Kieu District, Can Tho, Vietnam', N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R01', N'Five Start 12', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R02', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R03', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R04', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R05', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R06', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R07', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R08', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R09', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R10', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R11', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R12', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R13', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R14', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R15', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R16', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'DF', 1, 2, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000002D00000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF2F000000030000000400000005000000060000000700000008000000090000000A000000FEFFFFFF0C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C000000FEFFFFFFFEFFFFFF4B000000FEFFFFFF3100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A000000FEFFFFFF4C0000004D000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000010DC14D5FB52D4012E00000040070000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000008E110000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000B0000009843000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000430000A1E100C05000080440000000F00FFFF44000000007D0000CD680000B43A000054BD000011F40000012900009B1D0000DE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C350000009C10000000B5010000003400A509000007000080100000009E020000008000000C0000805363684772696400000000003408000041626F757473202864626F2900003400A509000007000080110000009C020000008000000B0000805363684772696400FC2100003408000041646D696E202864626F290000003800A50900000700008012000000A2020000008000000E0000805363684772696400A41F000032640000437573746F6D6572202864626F29000000003800A50900000700008013000000A2020000008000000E00008053636847726964008A66000034080000466565646261636B202864626F29000000003400A509000007000080140000009C020000008000000B0000805363684772696400DE3F0000F69F0000466F6F6473202864626F296200003400A509000007000080150000009E020000008000000C0000805363684772696400825F0000E4570000486F74656C73202864626F2900003800A50900000700008016000000A2020000008000000E0000805363684772696400DE3F000054BA0000496D67466F6F6473202864626F29000000008800A5090000070000801700000052000000018000005E000080436F6E74726F6C00694900004DAE000052656C6174696F6E736869702027464B5F5F496D67466F6F64735F5F466F6F645F435F5F3542453241364632202864626F2927206265747765656E2027466F6F6473202864626F292720616E642027496D67466F6F6473202864626F2927000000002800B50100000700008018000000310000006F00000002800000436F6E74726F6C00ED35000094B5000000003800A50900000700008019000000A4020000008000000F0000805363684772696400825F0000D8720000496D67486F74656C73202864626F290000008800A5090000070000801A000000520000000180000060000080436F6E74726F6C000D6900003B66000052656C6174696F6E736869702027464B5F5F496D67486F74656C735F5F486F74656C5F5F3630413735433046202864626F2927206265747765656E2027486F74656C73202864626F292720616E642027496D67486F74656C73202864626F292700002800B5010000070000801B000000310000006F00000002800000436F6E74726F6C00B2560000D36D000000003C00A5090000070000801C000000AE02000000800000140000805363684772696400A41F0000A2C60000496D6752657374617572616E7473202864626F2900003800A5090000070000801D000000A2020000008000000E0000805363684772696400BC7F0000D4490000496D67526F6F6D73202864626F29000000003C00A5090000070000801E000000AE02000000800000140000805363684772696400825F0000F69F0000496D67546F757269737453706F74202864626F2900003800A5090000070000801F000000A2020000008000000E0000805363684772696400825F0000488A00004C6F636174696F6E202864626F29000000003C00A50900000700008020000000AC0200000080000013000080536368477269640000000000B28900005061796D656E744D6574686F64202864626F290000003C00A50900000700008021000000A802000000800000110000805363684772696400A41F000044AC000052657374617572616E7473202864626F2900000000009400A5090000070000802200000052000000018000006A000080436F6E74726F6C002F2900009BBA000052656C6174696F6E736869702027464B5F5F496D675265737461755F5F52657374615F5F3537314446314435202864626F2927206265747765656E202752657374617572616E7473202864626F292720616E642027496D6752657374617572616E7473202864626F2927000000002800B50100000700008023000000310000006F00000002800000436F6E74726F6C000A160000A5C2000000008C00A50900000700008024000000620000000180000061000080436F6E74726F6C000035000045A7000052656C6174696F6E736869702027464B5F5F466F6F64735F5F52657374617572616E5F5F3539464135453830202864626F2927206265747765656E202752657374617572616E7473202864626F292720616E642027466F6F6473202864626F2927006E0000002800B50100000700008025000000310000006F00000002800000436F6E74726F6C00AB3E000013B1000000003400A509000007000080260000009C020000008000000B0000805363684772696400BC7F0000DA610000526F6F6D73202864626F290000008800A5090000070000802700000052000000018000005E000080436F6E74726F6C0047890000AC55000052656C6174696F6E736869702027464B5F5F496D67526F6F6D735F5F526F6F6D5F495F5F3635364331313243202864626F2927206265747765656E2027526F6F6D73202864626F292720616E642027496D67526F6F6D73202864626F2927000000002800B50100000700008028000000310000006F00000002800000436F6E74726F6C008D8B00000C5B000000008400A5090000070000802900000062000000018000005B000080436F6E74726F6C00DE740000175F000052656C6174696F6E736869702027464B5F5F526F6F6D735F5F486F74656C5F49645F5F3633383343384241202864626F2927206265747765656E2027486F74656C73202864626F292720616E642027526F6F6D73202864626F29270000002800B5010000070000802A000000310000006D00000002800000436F6E74726F6C00E8690000F865000000003C00A5090000070000802B000000A8020000008000001100008053636847726964008E440000340800007379736469616772616D73202864626F29626F2900003C00A5090000070000802C000000A802000000800000110000805363684772696400DE3F00005E650000546F757269737453706F74202864626F2900000000008C00A5090000070000802D000000620000000180000064000080436F6E74726F6C003A5500009B6F000052656C6174696F6E736869702027464B5F5F546F757269737453705F5F4C6F6361745F5F3530373046343436202864626F2927206265747765656E20274C6F636174696F6E202864626F292720616E642027546F757269737453706F74202864626F292700002800B5010000070000802E000000310000006F00000002800000436F6E74726F6C00315E00003176000000009000A5090000070000802F000000620000000180000067000080436F6E74726F6C004B290000AB78000052656C6174696F6E736869702027464B5F5F52657374617572616E5F5F546F7572695F5F3535333541393633202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E64202752657374617572616E7473202864626F29270000002800B50100000700008030000000310000006F00000002800000436F6E74726F6C00BD250000EA9B000000008C00A50900000700008031000000620000000180000062000080436F6E74726F6C003A550000335F000052656C6174696F6E736869702027464B5F5F486F74656C735F5F546F7572697374535F5F3545424631333944202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E642027486F74656C73202864626F2927646200002800B50100000700008032000000310000006F00000002800000436F6E74726F6C00315E00001F6A000000009400A50900000700008033000000620000000180000069000080436F6E74726F6C00FF490000AB78000052656C6174696F6E736869702027464B5F496D67546F757269737453706F745F546F757269737453706F74202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E642027496D67546F757269737453706F74202864626F292700000000002800B50100000700008034000000310000006D00000002800000436F6E74726F6C00663F0000A09E000000004000A50900000700008035000000B002000000800000150000805363684772696400DE3F0000004B00005472616E73706F72746174696F6E73202864626F290E010F00009400A5090000070000803600000052000000018000006B000080436F6E74726F6C00694900005359000052656C6174696F6E736869702027464B5F5F5472616E73706F72745F5F546F7572695F5F3645463537423636202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E6420275472616E73706F72746174696F6E73202864626F29270000002800B50100000700008037000000310000006F00000002800000436F6E74726F6C00AF4B00007C5F000000003400A509000007000080380000009A020000008000000A0000805363684772696400000000005E65000054726970202864626F29646200007800A5090000070000803900000052000000018000004F000080436F6E74726F6C005C1500004171000052656C6174696F6E736869702027464B5F547269705F437573746F6D6572202864626F2927206265747765656E2027437573746F6D6572202864626F292720616E64202754726970202864626F29278000002800B5010000070000803A000000310000005300000002800000436F6E74726F6C0021160000D170000000008400A5090000070000803B000000520000000180000059000080436F6E74726F6C008B0900009D7D000052656C6174696F6E736869702027464B5F547269705F5061796D656E744D6574686F64202864626F2927206265747765656E20275061796D656E744D6574686F64202864626F292720616E64202754726970202864626F292700000000002800B5010000070000803C000000310000005D00000002800000436F6E74726F6C00D10B0000DE83000000003C00A5090000070000803D000000A80200000080000011000080536368477269640000000000584D00005472697044657461696C73202864626F2900000000008C00A5090000070000803E000000620000000180000063000080436F6E74726F6C005C150000E552000052656C6174696F6E736869702027464B5F5472697044657461696C735F546F757269737453706F74202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E6420275472697044657461696C73202864626F29276200002800B5010000070000803F000000310000006700000002800000436F6E74726F6C00BD380000AE5E000000008000A50900000700008040000000520000000180000055000080436F6E74726F6C008B0900003059000052656C6174696F6E736869702027464B5F5472697044657461696C735F54726970202864626F2927206265747765656E202754726970202864626F292720616E6420275472697044657461696C73202864626F292700000000002800B50100000700008041000000310000005900000002800000436F6E74726F6C00D10B00001760000000003800A50900000700008042000000A0020000008000000D0000805363684772696400DE3F0000B42D000056656869636C65202864626F2909000000008C00A50900000700008043000000520000000180000063000080436F6E74726F6C0069490000823E000052656C6174696F6E736869702027464B5F56656869636C655F5472616E73706F72746174696F6E73202864626F2927206265747765656E20275472616E73706F72746174696F6E73202864626F292720616E64202756656869636C65202864626F29276200002800B50100000700008044000000310000006700000002800000436F6E74726F6C00AF4B00005144000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000021433412080000008816000089130000785634120700000014010000410062006F0075007400730020002800640062006F00290000005B3FEAE9693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000007000000410062006F0075007400730000002143341208000000881600009D090000785634120700000014010000410064006D0069006E0020002800640062006F0029000000F1F0703F0000803F0000803F48005600000080400000E0400000A040000040400000A0400000C040000040400000C0400000C040000040400000C0400000C040000080400000C0400000E040000040400000C0400000C0400000E040000040400000C0400000A0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000006000000410064006D0069006E000000214334120800000088160000751D000078563412070000001401000043007500730074006F006D006500720020002800640062006F0029000000693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F0000003F000000000000000000000000ADAC2C3E3333333F000000000000000000000000E1E0603D6666663F000000000000000000000000C1C0403C0000803F000000000000000000000000000000000000F03F0000000000000000C4AB35650000000000000000846C36651C583665A0839C0FA0839C0F020000000200000000000000000000000090500F000000000200000000000000000000000000000000008243000082C30000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000C3200000000000002D0100000C0000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000751D0000000000000A0000000A00000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000043007500730074006F006D006500720000002143341208000000881600000416000078563412070000001401000046006500650064006200610063006B0020002800640062006F0029000000000000001440000000000000244000000000000014400000000000406F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000F03F00000000000000000000000000000000000000000000000000000000000000000000000000000000C4AB23650000000000000000846C24651C582465D055A70ED055A70E02000000020000000000000000000000202CE20E000000000200000000002041000020410000A04000002041000020410000A04000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000F1190000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000046006500650064006200610063006B0000002143341208000000881600000E11000078563412070000001401000046006F006F006400730020002800640062006F0029000000000000000000000000607140000000000000244000000000000014400000000000406F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F00000000000000000000000000000000C4AB23650000000000000000846C24651C582465A062A70EA062A70E0200000002000000000000000000000098B89B0E000000000200000000008B430000204100808D430000204100008B430000704100000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000600000046006F006F006400730000002143341208000000881600000E11000078563412070000001401000048006F00740065006C00730020002800640062006F00290000000000000000000000244000000000004070400000000000C070400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000C4AB23650000000000000000846C24651C5824651857A70E1857A70E02000000020000000000000000000000D8AFCE0E0000000002000000000020410000824300002041008084430000A0400000824300000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000048006F00740065006C0073000000214334120800000088160000930E000078563412070000001401000049006D00670046006F006F006400730020002800640062006F002900000000000000244000000000000014400000000000C070400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000F03F0000000000000000000000000000000000000000000000000000000000000000C4AB23650000000000000000846C24651C5824655861A70E5861A70E02000000020000000000000000000000E029E20E00000000020000000000204100002041000020410000A040000070410000204100000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000049006D00670046006F006F0064007300000002000B00004B000004B10000004B000054BA00000000000002000000F0F0F00000000000000000000000000000000000010000001800000000000000ED35000094B500006414000058010000390000000100000200006414000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D00670046006F006F00640073005F005F0046006F006F0064005F0043005F005F0035004200450032004100360046003200214334120800000088160000930E000078563412070000001401000049006D00670048006F00740065006C00730020002800640062006F002900000000000000000000000000000000000000006071400000000000407040000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000C4AB23650000000000000000846C24651C582465E863A70EE863A70E02000000020000000000000000000000202AE20E000000000200000000000000000000000000000000008243000082C30000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000049006D00670048006F00740065006C007300000002000B00A46A0000F2680000A46A0000D87200000000000002000000F0F0F00000000000000000000000000000000000010000001B00000000000000B2560000D36D00004313000058010000390000000100000200004313000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D00670048006F00740065006C0073005F005F0048006F00740065006C005F005F0036003000410037003500430030004600214334120800000088160000930E000078563412070000001401000049006D006700520065007300740061007500720061006E007400730020002800640062006F002900000000400000000000E06A400000000000003340000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000C4AB23650000000000000000846C24651C58246560B0940E60B0940E02000000020000000000000000000000602FE20E00000000020000000000000000000040000000000000A841000098C10000004000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F00000049006D006700520065007300740061007500720061006E00740073000000214334120800000088160000930E000078563412070000001401000049006D00670052006F006F006D00730020002800640062006F00290000000000000000009605000000000000000000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000009E0600000000000000000000000000000000000000000000E30400000000000000000000000000000000000000000105000000000000000000000000000000000000000000000000730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006E0200000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000049006D00670052006F006F006D0073000000214334120800000088160000930E000078563412070000001401000049006D00670054006F0075007200690073007400530070006F00740020002800640062006F0029000000000002053F030000000000000000000000000000000000000000000000000000000000000000C502000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006C27004BF9167F00D89CFF0E708BA70E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D0060000000000000000000000000000000000000000000000000000D005000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F00000049006D00670054006F0075007200690073007400530070006F0074000000214334120800000088160000180C00007856341207000000140100004C006F0063006100740069006F006E0020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000090000004C006F0063006100740069006F006E0000002143341208000000881600009D0900007856341207000000140100005000610079006D0065006E0074004D006500740068006F00640020002800640062006F002900000072006D0069006E006900730074006900630027002900200061007300200049007300440065007400650072006D0069006E00690073007400690063002C00200078006D006C0063006F006C006C002E006E0061006D006500200061007300200078006D006C0053006300680065006D0061005F006E0061006D0065002C00200073006300680065006D0061005F006E0061006D006500280078006D006C0063006F006C006C002E0073006300680065006D0061005F0069006400290020006100730020007800000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E0000005000610079006D0065006E0074004D006500740068006F00640000002143341208000000881600000E110000785634120700000014010000520065007300740061007500720061006E007400730020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C000000520065007300740061007500720061006E0074007300000002000B00C62A000052BD0000C62A0000A2C600000000000002000000F0F0F000000000000000000000000000000000000100000023000000000000000A160000A5C200000D14000058010000430000000100000200000D14000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D0067005200650073007400610075005F005F00520065007300740061005F005F003500370031004400460031004400350004000B002C3600000EB50000FC3D00000EB50000FC3D0000C0A80000DE3F0000C0A800000000000002000000F0F0F00000000000000000000000000000000000010000002500000000000000AB3E000013B10000D41300005801000039000000010000020000D413000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0046006F006F00640073005F005F00520065007300740061007500720061006E005F005F00350039004600410035004500380030002143341208000000881600000416000078563412070000001401000052006F006F006D00730020002800640062006F00290000006C0075006D006E00500072006F0070006500720074007900280063006F006C002E006F0062006A006500630074005F00690064002C00200063006F006C002E006E0061006D0065002C0020004E00270049007300490064004E006F00740046006F0072005200650070006C00270029002900200061007300200049007300490064004E006F00740046006F0072005200650070006C002C00200063006F006C002E00690073005F007200650070006C006900630061007400650064002C00200063006F006C002E00690073005F006E006F006E005F00000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000F1190000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000600000052006F006F006D007300000002000B00DE8A0000DA610000DE8A0000675800000000000002000000F0F0F000000000000000000000000000000000000100000028000000000000008D8B00000C5B0000D71400005801000043000000010000020000D714000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D00670052006F006F006D0073005F005F0052006F006F006D005F0049005F005F003600350036004300310031003200430004000B000A760000AE600000DA7D0000AE600000DA7D0000FC6C0000BC7F0000FC6C00000000000002000000F0F0F00000000000000000000000000000000000010000002A00000000000000E8690000F86500004313000058010000380000000100000200004313000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611D0046004B005F005F0052006F006F006D0073005F005F0048006F00740065006C005F00490064005F005F00360033003800330043003800420041002143341208000000881600000E1100007856341207000000140100007300790073006400690061006700720061006D00730020002800640062006F0029000000200061007300200066006F0072006D0075006C00610072002C002000630061007300650020007700680065006E00280063006D0063002E0063006F006C0075006D006E005F006900640020006900730020006E0075006C006C00290020007400680065006E0020006E0075006C006C00200065006C0073006500200063006D0063002E00690073005F00700065007200730069007300740065006400200065006E0064002000610073002000690073005F007000650072007300690073007400650064002C0020006400000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000007300790073006400690061006700720061006D00730000002143341208000000881600000416000078563412070000001401000054006F0075007200690073007400530070006F00740020002800640062006F00290000006C002C00200063006F006C005F006E0061006D006500280063006F006C002E006F0062006A006500630074005F00690064002C0020006600740063002E0074007900700065005F0063006F006C0075006D006E005F006900640029002000460054005F0074007900700065005F0063006F006C0075006D006E002C0020006600740063002E006C0061006E00670075006100670065005F00690064002000610073002000460054005F006C0061006E00670075006100670065005F00690064002C002000630061007300000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000F1190000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C00000054006F0075007200690073007400530070006F007400000004000B00825F000024900000825D000024900000825D00001671000066560000167100000000000002000000F0F0F00000000000000000000000000000000000010000002E00000000000000315E000031760000D01200005801000041000000010000020000D012000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0054006F0075007200690073007400530070005F005F004C006F006300610074005F005F003500300037003000460034003400360004000B00D4490000627B0000D4490000F19D0000C62A0000F19D0000C62A000044AC00000000000002000000F0F0F00000000000000000000000000000000000010000003000000000000000BD250000EA9B000043130000580100003F0000000100000200004313000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F00520065007300740061007500720061006E005F005F0054006F007500720069005F005F003500350033003500410039003600330004000B0066560000546F0000825D0000546F0000825D0000AE600000825F0000AE6000000000000002000000F0F0F00000000000000000000000000000000000010000003200000000000000315E00001F6A0000B31200005801000037000000010000020000B312000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0048006F00740065006C0073005F005F0054006F007500720069007300740053005F005F003500450042004600310033003900440004000B00964B0000627B0000964B0000F19D0000A46A0000F19D0000A46A0000F69F00000000000002000000F0F0F00000000000000000000000000000000000010000003400000000000000663F0000A09E00001F110000580100003B0000000100000200001F11000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F0049006D00670054006F0075007200690073007400530070006F0074005F0054006F0075007200690073007400530070006F0074002143341208000000881600000E1100007856341207000000140100005400720061006E00730070006F00720074006100740069006F006E00730020002800640062006F00290000006D0065002C00200073006300680065006D0061005F006E0061006D0065002800730074002E0073006300680065006D0061005F006900640029002000610073002000440054005F0073006300680065006D0061002C00200063006F006C002E006D00610078005F006C0065006E006700740068002C00200063006F006C002E0070007200650063006900730069006F006E002C00200063006F006C002E00730000005000520049004D0041005200590000006E0061006D0065002000610073002000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000100000005400720061006E00730070006F00720074006100740069006F006E007300000002000B00004B00005E650000004B00000E5C00000000000002000000F0F0F00000000000000000000000000000000000010000003700000000000000AF4B00007C5F0000D01200005801000039000000010000020000D012000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F005400720061006E00730070006F00720074005F005F0054006F007500720069005F005F0036004500460035003700420036003600214334120800000088160000FA1A0000785634120700000014010000540072006900700020002800640062006F00290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003D000000000000000000000000000000000000000000000000000000000000000000000000000000E404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000920600000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000222900007D1E0000000000002D0100000B0000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000FA1A000000000000090000000900000002000000020000001C010000F50A0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000005400720069007000000002000B00A41F0000D872000088160000D87200000000000002000000F0F0F00000000000000000000000000000000000010000003A0000000000000021160000D1700000E90900005801000032000000010000020000E909000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61100046004B005F0054007200690070005F0043007500730074006F006D006500720002000B00220B0000B2890000220B0000588000000000000002000000F0F0F00000000000000000000000000000000000010000003C00000000000000D10B0000DE830000840D00005801000038000000010000020000840D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61150046004B005F0054007200690070005F005000610079006D0065006E0074004D006500740068006F006400214334120800000088160000930E00007856341207000000140100005400720069007000440065007400610069006C00730020002800640062006F0029000000C9000000000000000000000000000000000000000000000000000000BE0200000000000000000000000000004B0600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000005400720069007000440065007400610069006C007300000004000B00DE3F0000807000000E380000807000000E3800006054000088160000605400000000000002000000F0F0F00000000000000000000000000000000000010000003F00000000000000BD380000AE5E0000880E00005801000022000000010000020000880E000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611A0046004B005F005400720069007000440065007400610069006C0073005F0054006F0075007200690073007400530070006F00740002000B00220B00005E650000220B0000EB5B00000000000002000000F0F0F00000000000000000000000000000000000010000004100000000000000D10B0000176000005D0A000058010000310000000100000200005D0A000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F005400720069007000440065007400610069006C0073005F00540072006900700021433412080000008816000089130000785634120700000014010000560065006800690063006C00650020002800640062006F0029000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000560065006800690063006C006500000002000B00004B0000004B0000004B00003D4100000000000002000000F0F0F00000000000000000000000000000000000010000004400000000000000AF4B000051440000FB0E0000580100003F000000010000020000FB0E000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611A0046004B005F00560065006800690063006C0065005F005400720061006E00730070006F00720074006100740069006F006E007300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F5739000002009040E5D4FB52D401020200001048450000000000000000000000000000000000260200004400610074006100200053006F0075007200630065003D00640061006E0067007400750061006E006800750079002E00640061007400610062006100730065002E00770069006E0064006F00770073002E006E00650074003B0049006E0069007400690061006C00200043006100740061006C006F0067003D004B00610072006E0065006C00540072006100760065006C003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00640061006E0067007400750061006E006800750079003B004D0075006C007400690070006C0065004100630074000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000030000000DA3500000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000180600000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001C00000012000000000000000C000000012900009B1D00000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000100000001000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000110000001100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000120000001200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000130000001300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000140000001400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000150000001500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000160000001600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001700000017000000000000004E00000001EEE70E01000000640062006F00000046004B005F005F0049006D00670046006F006F00640073005F005F0046006F006F0064005F0043005F005F003500420045003200410036004600320000000000000000000000C40200000000180000001800000017000000080000000143E20EA043E20E0000000000000000AD0F0000010000190000001900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001A0000001A000000000000004E0000000100350001000000640062006F00000046004B005F005F0049006D00670048006F00740065006C0073005F005F0048006F00740065006C005F005F003600300041003700350043003000460000000000000000000000C402000000001B0000001B0000001A000000080000000145E20EE045E20E0000000000000000AD0F00000100001C0000001C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001D0000001D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001E0000001E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001F0000001F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000200000002000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000210000002100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002200000022000000000000004E000000013F866D01000000640062006F00000046004B005F005F0049006D0067005200650073007400610075005F005F00520065007300740061005F005F003500370031004400460031004400350000000000000000000000C40200000000230000002300000022000000080000000144E20EA044E20E0000000000000000AD0F00000100002400000024000000000000004E0000000100350001000000640062006F00000046004B005F005F0046006F006F00640073005F005F00520065007300740061007500720061006E005F005F003500390046004100350045003800300000000000000000000000C40200000000250000002500000024000000080000000145E20EA045E20E0000000000000000AD0F0000010000260000002600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002700000027000000000000004E00000001EFE70E01000000640062006F00000046004B005F005F0049006D00670052006F006F006D0073005F005F0052006F006F006D005F0049005F005F003600350036004300310031003200430000000000000000000000C40200000000280000002800000027000000080000000150E20EE050E20E0000000000000000AD0F00000100002900000029000000000000004C000000013F866D01000000640062006F00000046004B005F005F0052006F006F006D0073005F005F0048006F00740065006C005F00490064005F005F003600330038003300430038004200410000000000000000000000C402000000002A0000002A0000002900000008000000014FE20E604FE20E0000000000000000AD0F00000100002B0000002B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002C0000002C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002D0000002D000000000000004E000000013F866D01000000640062006F00000046004B005F005F0054006F0075007200690073007400530070005F005F004C006F006300610074005F005F003500300037003000460034003400360000000000000000000000C402000000002E0000002E0000002D000000080000000152E20E2052E20E0000000000000000AD0F00000100002F0000002F000000000000004E000000013F866D01000000640062006F00000046004B005F005F00520065007300740061007500720061006E005F005F0054006F007500720069005F005F003500350033003500410039003600330000000000000000000000C4020000000030000000300000002F00000008000000014CE20EA04CE20E0000000000000000AD0F00000100003100000031000000000000004E000000013F866D01000000640062006F00000046004B005F005F0048006F00740065006C0073005F005F0054006F007500720069007300740053005F005F003500450042004600310033003900440000000000000000000000C4020000000032000000320000003100000008000000014CE20E604CE20E0000000000000000AD0F00000100003300000033000000000000004C00000001CBE70E01000000640062006F00000046004B005F0049006D00670054006F0075007200690073007400530070006F0074005F0054006F0075007200690073007400530070006F00740000000000000000000000C4020000000034000000340000003300000008000000014BE20EA04BE20E0000000000000000AD0F0000010000350000003500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003600000036000000000000004E000000013F866D01000000640062006F00000046004B005F005F005400720061006E00730070006F00720074005F005F0054006F007500720069005F005F003600450046003500370042003600360000000000000000000000C4020000000037000000370000003600000008000000014DE20E204DE20E0000000000000000AD0F0000010000380000003800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003900000039000000000000003200000001E3E70E01000000640062006F00000046004B005F0054007200690070005F0043007500730074006F006D006500720000000000000000000000C402000000003A0000003A00000039000000080000000157E20E6057E20E0000000000000000AD0F00000100003B0000003B000000000000003C0000000100000001000000640062006F00000046004B005F0054007200690070005F005000610079006D0065006E0074004D006500740068006F00640000000000000000000000C402000000003C0000003C0000003B000000080000000154E20EA054E20E0000000000000000AD0F00000100003D0000003D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003E0000003E00000000000000460000000100000001000000640062006F00000046004B005F005400720069007000440065007400610069006C0073005F0054006F0075007200690073007400530070006F00740000000000000000000000C402000000003F0000003F0000003E00000008000000015BE20E205BE20E0000000000000000AD0F00000100004000000040000000000000003800000001E3E70E01000000640062006F00000046004B005F005400720069007000440065007400610069006C0073005F00540072006900700000000000000000000000C40200000000410000004100000040000000080000000155E20E2055E20E0000000000000000AD0F0000010000420000004200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000004300000043000000000000004600000001E6E70E01000000640062006F00000046004B005F00560065006800690063006C0065005F005400720061006E00730070006F00720074006100740069006F006E00730000000000000000000000C40200000000440000004400000043000000080000000158E20E6058E20E0000000000000000AD0F0000010000500000003900000012000000380000007A000000770000001700000014000000160000002500000024000000290000001500000026000000670000006E0000001A000000150000001900000025000000240000002D0000001F0000002C0000005C000000710000003B00000020000000380000002400000025000000240000002100000014000000670000006600000022000000210000001C000000250000002400000027000000260000001D00000024000000250000003E0000002C0000003D0000006E00000061000000360000002C000000350000002400000025000000330000002C0000001E0000002700000024000000310000002C000000150000006B000000660000002F0000002C000000210000002100000024000000430000003500000042000000240000002500000040000000380000003D0000002400000025000000000000000000000000000000000000000000000000000000000000000000000000000000000069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B0043006F006E006E006500630074002000540069006D0065006F00750074003D00330030003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F00220000000080050006000000440046000000000226000E000000410062006F00750074007300000008000000640062006F000000000226000C000000410064006D0069006E00000008000000640062006F000000000226001200000043007500730074006F006D0065007200000008000000640062006F000000000226001200000046006500650064006200610063006B00000008000000640062006F000000000226000C00000046006F006F0064007300000008000000640062006F000000000226000E00000048006F00740065006C007300000008000000640062006F000000000226001200000049006D00670046006F006F0064007300000008000000640062006F000000000226001400000049006D00670048006F00740065006C007300000008000000640062006F000000000226001E00000049006D006700520065007300740061007500720061006E0074007300000008000000640062006F000000000226001200000049006D00670052006F006F006D007300000008000000640062006F000000000226001E00000049006D00670054006F0075007200690073007400530070006F007400000008000000640062006F00000000022600120000004C006F0063006100740069006F006E00000008000000640062006F000000000226001C0000005000610079006D0065006E0074004D006500740068006F006400000008000000640062006F0000000002260018000000520065007300740061007500720061006E0074007300000008000000640062006F000000000226000C00000052006F006F006D007300000008000000640062006F00000000022600180000007300790073006400690061006700720061006D007300000008000000640062006F000000000226001800000054006F0075007200690073007400530070006F007400000008000000640062006F00000000022600200000005400720061006E00730070006F00720074006100740069006F006E007300000008000000640062006F000000000226000A0000005400720069007000000008000000640062006F00000000022600180000005400720069007000440065007400610069006C007300000008000000640062006F0000000002240010000000560065006800690063006C006500000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'a', N'a', NULL, NULL, N'a', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'a1', N'hoang son', 0, CAST(10 AS Decimal(12, 0)), N'd', 1, N'LC1')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS1', N'Mekong Delta River', NULL, NULL, N'Private 3-Day', 1, N'LC1')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS10', N'Beach', NULL, NULL, N'Vung Tau sea', 1, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS11', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 1, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS12', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS13', N'Plateau Son La', NULL, NULL, N'Private 6-Day', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS14', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS15', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS16', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS17', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS18', N'Plateau Son La', NULL, NULL, N'Private 6-Day', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS19', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS2', N'Plateau Son La', NULL, NULL, N'Private 6-Day', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS20', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS21', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS22', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS23', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS24', N'Plateau Son La', NULL, NULL, N'Private 6-Day', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS25', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS26', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS27', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS28', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS29', N'Plateau Son La', NULL, NULL, N'Private 6-Day', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS3', N'Da Lat', NULL, NULL, N'Private 16-Day', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS30', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS31', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS32', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS33', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS4', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS5', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS6', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS7', N'Beach', NULL, NULL, N'Vung Tau sea', 0, N'LC4')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS8', N'Plateau Son La', NULL, NULL, N'Private 6-Day', 0, N'LC2')
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id]) VALUES (N'TS9', N'Mountain', NULL, NULL, N'Mrs. Black Mountain', 0, N'LC2')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT001', N'Train1', NULL, N'~/myImg/Transportations/TSTT001/thieap.PNG', N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT002', N'Train', NULL, N'~/myImg/Transportations/TSTT002/LeftGrass.jpg', N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT003', N'Train', NULL, N'~/myImg/Transportations/TSTT003/Water.jpg', N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT004', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT005', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT006', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT007', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT008', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT009', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT010', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id]) VALUES (N'TSTT011', N'Train', NULL, NULL, N'TS1')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V001', N'Steam train 1', NULL, 500, N'~/myImg/Vehicle/V001/Train.jpg', N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V0010', N'Steam train', NULL, 500, N'~/myImg/Vehicle/V0010/DBStructure.png', N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V0011', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V0012', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V002', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V003', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V004', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V005', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V006', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V007', N'Steam train', NULL, 500, NULL, N'TSTT011')
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id]) VALUES (N'V008', N'Steam train', NULL, 500, NULL, N'TSTT011')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 9/25/2018 12:57:48 AM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Custom__4BAC3F29]  DEFAULT ((1)) FOR [Customer_Gender]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Feedback__State__160F4887]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Feedback__Create__17036CC0]  DEFAULT (getdate()) FOR [Create_on]
GO
ALTER TABLE [dbo].[TouristSpot] ADD  CONSTRAINT [DF_TouristSpot_TouristSpot_Status]  DEFAULT ((0)) FOR [TouristSpot_Status]
GO
ALTER TABLE [dbo].[Trip] ADD  CONSTRAINT [DF_Trip_Trip_Date]  DEFAULT (getdate()) FOR [Trip_Date]
GO
ALTER TABLE [dbo].[Trip] ADD  CONSTRAINT [DF_Trip_Trip_Status]  DEFAULT ((0)) FOR [Trip_Status]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD FOREIGN KEY([Restaurant_Code])
REFERENCES [dbo].[Restaurants] ([Restaurant_Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hotels]  WITH CHECK ADD  CONSTRAINT [FK__Hotels__TouristS__5EBF139D] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hotels] CHECK CONSTRAINT [FK__Hotels__TouristS__5EBF139D]
GO
ALTER TABLE [dbo].[ImgFoods]  WITH CHECK ADD FOREIGN KEY([Food_Code])
REFERENCES [dbo].[Foods] ([Food_Code])
GO
ALTER TABLE [dbo].[ImgHotels]  WITH CHECK ADD  CONSTRAINT [FK__ImgHotels__Hotel__60A75C0F] FOREIGN KEY([Hotel_Id])
REFERENCES [dbo].[Hotels] ([Hotel_Id])
GO
ALTER TABLE [dbo].[ImgHotels] CHECK CONSTRAINT [FK__ImgHotels__Hotel__60A75C0F]
GO
ALTER TABLE [dbo].[ImgRestaurants]  WITH CHECK ADD FOREIGN KEY([Restaurant_Code])
REFERENCES [dbo].[Restaurants] ([Restaurant_Code])
GO
ALTER TABLE [dbo].[ImgRooms]  WITH CHECK ADD  CONSTRAINT [FK__ImgRooms__Room_I__656C112C] FOREIGN KEY([Room_Id])
REFERENCES [dbo].[Rooms] ([Room_Id])
GO
ALTER TABLE [dbo].[ImgRooms] CHECK CONSTRAINT [FK__ImgRooms__Room_I__656C112C]
GO
ALTER TABLE [dbo].[ImgTouristSpot]  WITH CHECK ADD  CONSTRAINT [FK_ImgTouristSpot_TouristSpot] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImgTouristSpot] CHECK CONSTRAINT [FK_ImgTouristSpot_TouristSpot]
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD  CONSTRAINT [FK__Restauran__Touri__5535A963] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Restaurants] CHECK CONSTRAINT [FK__Restauran__Touri__5535A963]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK__Rooms__Hotel_Id__6383C8BA] FOREIGN KEY([Hotel_Id])
REFERENCES [dbo].[Hotels] ([Hotel_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK__Rooms__Hotel_Id__6383C8BA]
GO
ALTER TABLE [dbo].[TouristSpot]  WITH CHECK ADD  CONSTRAINT [FK__TouristSp__Locat__5070F446] FOREIGN KEY([Location_Id])
REFERENCES [dbo].[Location] ([Location_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TouristSpot] CHECK CONSTRAINT [FK__TouristSp__Locat__5070F446]
GO
ALTER TABLE [dbo].[Transportations]  WITH CHECK ADD  CONSTRAINT [FK__Transport__Touri__6EF57B66] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transportations] CHECK CONSTRAINT [FK__Transport__Touri__6EF57B66]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_Customer] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[Customer] ([Customer_Id])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_Customer]
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD  CONSTRAINT [FK_Trip_PaymentMethod] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[PaymentMethod] ([PaymentId])
GO
ALTER TABLE [dbo].[Trip] CHECK CONSTRAINT [FK_Trip_PaymentMethod]
GO
ALTER TABLE [dbo].[TripDetails]  WITH CHECK ADD  CONSTRAINT [FK_TripDetails_TouristSpot] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
GO
ALTER TABLE [dbo].[TripDetails] CHECK CONSTRAINT [FK_TripDetails_TouristSpot]
GO
ALTER TABLE [dbo].[TripDetails]  WITH CHECK ADD  CONSTRAINT [FK_TripDetails_Trip] FOREIGN KEY([Trip_Id])
REFERENCES [dbo].[Trip] ([Trip_Id])
GO
ALTER TABLE [dbo].[TripDetails] CHECK CONSTRAINT [FK_TripDetails_Trip]
GO
ALTER TABLE [dbo].[Vehicle]  WITH CHECK ADD  CONSTRAINT [FK_Vehicle_Transportations] FOREIGN KEY([Transportation_Id])
REFERENCES [dbo].[Transportations] ([Transportation_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Transportations]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 9/25/2018 12:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [KarnelTravel] SET  READ_WRITE 
GO
