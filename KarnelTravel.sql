USE [master]
GO
/****** Object:  Database [KarnelTravel]    Script Date: 10/6/2018 11:24:19 AM ******/
CREATE DATABASE [KarnelTravel]
GO
ALTER DATABASE [KarnelTravel] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [KarnelTravel] SET QUERY_STORE = ON
GO
ALTER DATABASE [KarnelTravel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [KarnelTravel]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 10/6/2018 11:24:26 AM ******/
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
/****** Object:  Table [dbo].[Abouts]    Script Date: 10/6/2018 11:24:26 AM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 10/6/2018 11:24:26 AM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 10/6/2018 11:24:26 AM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 10/6/2018 11:24:27 AM ******/
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
	[State] [bit] NULL,
	[Create_on] [date] NULL,
 CONSTRAINT [PK__Feedback__6A4BEDD6D723F049] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foods]    Script Date: 10/6/2018 11:24:27 AM ******/
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
/****** Object:  Table [dbo].[Hotels]    Script Date: 10/6/2018 11:24:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels](
	[Hotel_Id] [nvarchar](20) NOT NULL,
	[Hotel_Name] [nvarchar](120) NULL,
	[Hotel_Address] [nvarchar](255) NULL,
	[Hotel_Status] [bit] NULL,
	[Hotel_Details] [nvarchar](max) NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
	[Hotel_Create] [date] NULL,
 CONSTRAINT [PK__Hotels__AA4FC851081BE738] PRIMARY KEY CLUSTERED 
(
	[Hotel_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImgFoods]    Script Date: 10/6/2018 11:24:28 AM ******/
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
/****** Object:  Table [dbo].[ImgHotels]    Script Date: 10/6/2018 11:24:28 AM ******/
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
/****** Object:  Table [dbo].[ImgRestaurants]    Script Date: 10/6/2018 11:24:28 AM ******/
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
/****** Object:  Table [dbo].[ImgRooms]    Script Date: 10/6/2018 11:24:29 AM ******/
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
/****** Object:  Table [dbo].[ImgTouristSpot]    Script Date: 10/6/2018 11:24:29 AM ******/
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
/****** Object:  Table [dbo].[Location]    Script Date: 10/6/2018 11:24:29 AM ******/
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
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 10/6/2018 11:24:30 AM ******/
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
/****** Object:  Table [dbo].[Restaurants]    Script Date: 10/6/2018 11:24:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[Restaurant_Code] [nvarchar](20) NOT NULL,
	[Restaurant_Name] [nvarchar](20) NULL,
	[Restaurant_Address] [nvarchar](150) NULL,
	[Restaurant_Status] [bit] NULL,
	[Restaurant_Description] [ntext] NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
	[Restaurant_Create] [date] NULL,
 CONSTRAINT [PK__Restaura__DE376AFECF733EB9] PRIMARY KEY CLUSTERED 
(
	[Restaurant_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 10/6/2018 11:24:31 AM ******/
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
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 10/6/2018 11:24:31 AM ******/
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
/****** Object:  Table [dbo].[TouristSpot]    Script Date: 10/6/2018 11:24:31 AM ******/
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
	[TouristSpot_Create] [date] NULL,
 CONSTRAINT [PK__TouristS__87091DC549C789A0] PRIMARY KEY CLUSTERED 
(
	[TouristSpot_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transportations]    Script Date: 10/6/2018 11:24:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transportations](
	[Transportation_Id] [nvarchar](20) NOT NULL,
	[Transportation_Name] [nvarchar](100) NULL,
	[Transportation_Details] [nvarchar](255) NULL,
	[Transportation_Img] [nvarchar](150) NULL,
	[TouristSpot_Id] [nvarchar](20) NULL,
	[Transportation_Create] [date] NULL,
 CONSTRAINT [PK__Transpor__B821F19693C36C8D] PRIMARY KEY CLUSTERED 
(
	[Transportation_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 10/6/2018 11:24:32 AM ******/
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
/****** Object:  Table [dbo].[TripDetails]    Script Date: 10/6/2018 11:24:32 AM ******/
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
/****** Object:  Table [dbo].[Vehicle]    Script Date: 10/6/2018 11:24:33 AM ******/
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
	[Vehicle_Create] [date] NULL,
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
INSERT [dbo].[Abouts] ([AboutId], [AboutName], [AboutBirth], [AboutGender], [AboutLike], [AboutImg]) VALUES (5, N'Hoang Son', CAST(N'1998-08-08' AS Date), 1, N'ds', N'~/myImg/Abouts/5/1.jpg')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'dangtuanhuy', N'61fcd36c8292bdf65aab93287009f0f0')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'hanabi', N'd43fcce13f4c88fd28c279cc2859f579')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'hoangson', N'24ca43c7f02d50e1b0882485e9859a31')
INSERT [dbo].[Admin] ([Username], [Password]) VALUES (N'phong', N'9f48495bb4b98ac37a1a72c7e6490c7a')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'Agemon', N'6ff54955f154cfbc507e61b5a4f2283b', N'Tuan', N'Huy', CAST(N'1997-02-01' AS Date), 1, N'0963505927', N'Châu Thành', N'huygama@gmail.com', N'C001123')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'dangtuanhuy', N'61fcd36c8292bdf65aab93287009f0f0', N'Tuan', N'Huy', CAST(N'2018-10-03' AS Date), 1, N'0963505927', N'Bến Tre', N'huy@gmail.com', N'F001124')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 0, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY1', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 0, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY2', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 1, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'DTHUY3', NULL, N'Tuan', N'Huy', CAST(N'1997-01-02' AS Date), 1, N'(+84)925028450', N'Tien Thuy, Chau Thanh, Ben Tre', N'yami@gmail.com', N'A001849')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'hachibi', N'd43fcce13f4c88fd28c279cc2859f579', N'Tuan', N'Huy', CAST(N'1997-02-01' AS Date), 1, N'0963505927', N'Ben Tre City', N'huy@gmail.com', N'A001123')
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'hachibi1', N'f575da31e3ab5f8858dd1e5eac3e1ddd', N'Tuan', N'Huy', CAST(N'1997-10-01' AS Date), 1, N'0963505927', N'Bến Tre', N'huy@gmail.com', N'A001123')
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
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'phong', N'9f48495bb4b98ac37a1a72c7e6490c7a', N'a', N'a', CAST(N'2018-10-22' AS Date), 1, N'1234567898', N'asdasd', N'qweqwe@gmail.com', N'qweqw')
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
INSERT [dbo].[Customer] ([Customer_Id], [Customer_Password], [Customer_LastName], [Customer_FirstName], [Customer_Bithday], [Customer_Gender], [Customer_Phone], [Customer_Address], [Customer_Email], [Customer_Possport]) VALUES (N'Willy', N'ec1089fa8db98068303351bf86f5df73', N'Tuan', N'Huy', CAST(N'1997-02-01' AS Date), 1, N'0963505927', N'Chợ Lách', N'huygama@gmail.com', N'C001123')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (1, N'Mr Dang Tuan ', N'dthuya17007@cusc.ctu.edu.vn', N'Food and Restaurent', N'Very Good', 1, CAST(N'2018-09-12' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (2, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (3, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (4, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (5, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (6, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (7, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (8, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (9, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (10, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (11, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (12, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (13, N'Mr Trần Trung Phong ', N'ttphong@gmail.com.vn', N'Vihicle', N'Vihicle is very Badly', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (14, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (15, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (16, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (17, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (18, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (19, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (20, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (21, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (22, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (23, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (24, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (25, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (26, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (27, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (28, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (29, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (30, N'Mr Phạm Nguyễn Hoàng Sơn ', N'ttphong@gmail.com.vn', N'Hotels', N'The hotel is too dirty', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (31, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (32, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (33, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (34, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (35, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (36, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (37, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (38, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (39, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (40, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (41, N'Mr Đặng Tuấn Huy ', N'dthuya17007@cusc.com.vn', N'Hotels', N'The hotel`s bedrooms has a mouse', 0, CAST(N'2018-09-15' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (42, N'Phạm Nguyễn Hoàng Sơn', N'pnhson@gmail.com', N'Du lịch phiền quá', N'Quá Phiền', 1, CAST(N'2018-06-10' AS Date))
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (43, N'Phạm Nguyễn Hoàng Sơn', N'pnhson@gmail.com', N'Du lịch phiền quá', N'Không Đi Nữa', 1, NULL)
INSERT [dbo].[Feedback] ([FeedbackId], [SenderName], [SenderMail], [FeedBackTitle], [FeedBackContent], [State], [Create_on]) VALUES (45, N'Đặng Tuấn Huy', N'pnhson@gmail.com', N'Du lịch phiền quá', N'Không Bao vờ', 1, CAST(N'2018-10-06' AS Date))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F01', N'Hu Tieu', NULL, NULL, N'RTR1')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F02', N'Banh Canh', NULL, NULL, N'RTR2')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F03', N'Banh Da Cua', NULL, NULL, N'RTR3')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F04', N'Bun Bo Hue', NULL, NULL, N'RTR4')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F05', N'Bun Ca', NULL, NULL, N'RTR5')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F06', N'Mi Quang', NULL, NULL, N'RTR6')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F07', N'Pho', NULL, NULL, N'RTR7')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F08', N'Com Hen', NULL, NULL, N'RTR8')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F09', N'Com Lam', NULL, NULL, N'RTR9')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F10', N'Com Nep', NULL, NULL, N'RTR10')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F11', N'Ca Kho', NULL, NULL, N'RTR11')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F12', N'Cha', NULL, NULL, N'RTR12')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F13', N'Doi', NULL, NULL, N'RTR13')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F14', N'Chao', NULL, NULL, N'RTR14')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F15', N'Thit Kho', NULL, NULL, N'RTR15')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F16', N'Rau Muong xao Toi', NULL, NULL, N'RTR16')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F17', N'Long Non', NULL, NULL, N'RTR17')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F18', N'Ca Kho', NULL, NULL, N'RTR18')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F19', N'Thit Nuong', NULL, NULL, N'RTR19')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F20', N'Ga Nuong', NULL, NULL, N'RTR20')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F21', N'Oc Luoc', NULL, NULL, N'RTR21')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F22', N'Oc xao', NULL, NULL, N'RTR22')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F23', N'Oc Nuong', NULL, NULL, N'RTR23')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F24', N'Luon Nuong', NULL, NULL, N'RTR24')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F25', N'Thit Khia', NULL, NULL, N'RTR25')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F26', N'Tom Nuong', NULL, NULL, N'RTR26')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F27', N'Tom Hap', NULL, NULL, N'RTR27')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F28', N'Ngheu Hap', NULL, NULL, N'RTR28')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F29', N'Ngheu Nuong', NULL, NULL, N'RTR29')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F30', N'Ech Nuong', NULL, NULL, N'RTR30')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F31', N'Ech Khia', NULL, NULL, N'RTR31')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F32', N'Chao Ech', NULL, NULL, N'RTR32')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F33', N'Sup Yen', NULL, NULL, N'RTR33')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F34', N'Sup Cua', NULL, NULL, N'RTR34')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F35', N'Banh Hoi', NULL, NULL, N'RTR35')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F36', N'Banh Gio', NULL, NULL, N'RTR36')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F37', N'Banh Duc', NULL, NULL, N'RTR37')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F38', N'Banh Cong', NULL, NULL, N'RTR38')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F39', N'Banh Day', NULL, NULL, N'RTR39')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F40', N'Banh Chung', NULL, NULL, N'RTR40')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F41', N'Banh Can', NULL, NULL, N'RTR41')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F42', N'Banh Bot Loc', NULL, NULL, N'RTR42')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F43', N'Banh Beo', NULL, NULL, N'RTR43')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F44', N'Banh Bao', NULL, NULL, N'RTR44')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F45', N'Nem Chua', NULL, NULL, N'RTR45')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F46', N'Nem Cuon', NULL, NULL, N'RTR46')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F47', N'Goi Ca', NULL, NULL, N'RTR47')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F48', N'Nem Ran', NULL, NULL, N'RTR48')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F49', N'Bo Bia', NULL, NULL, N'RTR49')
INSERT [dbo].[Foods] ([Food_Code], [Food_Name], [Food_Price], [Food_Specific], [Restaurant_Code]) VALUES (N'F50', N'Banh Cuon', NULL, NULL, N'RTR50')
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT1', N'CAP SAINT JACQUE', N'169 Vung Tau', 1, N'Very Luxury', N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT10', N'Cong Tu Bac Lieu', N'13 Dien Bien Phu, Bac Lieu', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT11', N'Hoa Binh', N'5 Hoa Binh, Ninh Kieu', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS10', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT12', N'Sammy', N'157 Thuy Van, Vung Tau', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS10', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT13', N'Golf Can Tho', N'02 Ba Trung, Ninh Kieu, Can Tho', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS11', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT14', N'A & Em', N'179 Ly Tu Trong, Ben Thanh, Quan 1', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS11', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT15', N'Ngoi Sao SAPA', N'Thi tran SAPA, Tinh Lao Cai', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS16', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT16', N'Deawoo', N'360 Kim Ma, Ba Dinh, Ha Noi', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS16', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT17', N'VICTORIA', N'SaPa, Lao Cai', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS17', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT18', N'Bamboo', N'Pho Muong Hoa, Sapa, Lao Cai', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS17', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT19', N'Dang Khoa', N'74 Lao Cai, VN', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS18', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT2', N'Park Hyatt Saigon', N'So 2 Cong Truong Lam Son, Quan 1, HCM', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS12', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT20', N'Dream', N'10 Ha Long, Quang Ninh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS18', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT21', N'VINPEARL RESORT NHA TRANG', N'Vinpearl Resort', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT22', N'FURAMA RESORT', N'Da Nang', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT23', N'FUSION MAIA RESORT', N'Da Nang', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS20', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT24', N'VICTORIA BEACH RESORT & SPA', N'Hoi An', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS20', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT25', N'THE NAM HAI RESORT', N'Quang Nam', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS21', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT26', N'LA RESIDENCE HOTEL & SPA', N'Hue', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS21', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT27', N'PRINCESS D''ANNAM RESORT &SPA', N'Binh Thuan', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS22', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT28', N'ANA MANDARA VILLAS DALAT RESORT & SPA', N'Da Lat', 0, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS22', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT29', N'La Vie Hotel', N'Nha Trang', 0, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS19', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT3', N'Sheraton Saigon', N'88 Dong Khoi, Quan 1, HCM', 0, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS12', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT30', N'Dendro', N'Nha Trang', 0, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS19', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT31', N'ANA MANDARA VILLAS DALAT RESORT & SPA ', N'Da Lat', 0, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS23', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT32', N'Khu Nghi Duong BANA HILLS', N'BANA HILLS', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS23', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT33', N'Tan Da Resort', N'Ba Vi', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS24', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT34', N'TAM DAO BELVEDERE RESORT', N'Vinh Phuc', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS24', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT35', N'KHU NGHI DUONG TOPAS ECOLODGE', N'SaPa', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS25', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT36', N'V RESORT', N'Hoa Binh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS25', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT37', N'Emeralda', N'Ninh Binh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS26', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT38', N'Mai Chau Ecolodge', N'Hoa Binh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS26', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT39', N'Flamingo Dai Lai', N'Vinh Phuc', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS27', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT4', N'Caravelle', N'19 Cong Truong Lam Son, HCM', 1, N'Hotel Iris has 73 rooms including room Rating: VIP Suite, Deluxe, Superior Executive, Superior Premium, Superior. The rooms are equipped with modern amenities items in the cozy, harmonious. You will have moments of great relaxation in the luxury space and offering a dedicated service. Iris Tho has a system of leisure services and entertainment to please guests. You can sign up for tours to famous landmarks in Can Tho, explore the river region. Funding or singing with family and friends in the karaoke room equipped with professional sound. Last day or relax with a spa treatment course from the professional staff of Iris. The hotel restaurant serves European cuisine - attractive Asian diners. Coffee Lounge serves light snacks and coffee.', N'TS13', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT40', N'Cuc Phuong', N'Ninh Binh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS27', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT41', N'Zari House', N'Da Nang', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS28', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT42', N'Vivian Villa & Apartment By My Khe Beach', N'Da Nang', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS28', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT43', N'Papa Mike Hostel Prince', N'Da Nang', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS29', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT44', N'Hoang An Hotel', N'La Gi', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS29', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT45', N'Hotel Tan Phu', N'La Gi', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS30', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT46', N'MAY Bungalow', N'Mui Ne', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS30', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT47', N'Quoc Dinh Guesthouse', N'Mui Ne', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT48', N'Corvin Hotel', N'Vung Tau', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT49', N'Ocean View', N'Dong Hoi', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT5', N'REX', N'141 Nguyen Hue, Quan 1, HCM', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS13', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT50', N'Phoenix', N'Vung Tau', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT6', N'Thien Ngan', N'21 Cau May, Lao Cai, VN', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS14', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT7', N'Ha Long Plaza', N'8 Ha Long, Quang Ning', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS14', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT8', N'Mithrin', N'Ha Long, Quang Ninh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS15', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Hotels] ([Hotel_Id], [Hotel_Name], [Hotel_Address], [Hotel_Status], [Hotel_Details], [TouristSpot_Id], [Hotel_Create]) VALUES (N'HT9', N'Sao Mai', N'Ha Long, Quang Ninh', 1, N'Hotels Azerai resort - the first luxury hotel in the Mekong Delta is managed and operated by the brand Azerai - super luxury resort chain Aman Resort global reputation. The hotel has 60 bungalows, all with open space with glass interior with neutral colors allowing guests to enjoy maximum natural sunlight outside. Additionally Hotels Azerai also provide additional services such as: swimming pool, spa, gym, yoga room and Zen, tennis courts, a restaurant with a wide selection of cuisines, hair salon, shop Souvenir shop and also other interesting services.', N'TS15', CAST(N'2018-09-29' AS Date))
SET IDENTITY_INSERT [dbo].[ImgFoods] ON 

INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (1, N'Banh Bao.jpg', 1, N'F44')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (2, N'Banh Beo.png', 1, N'F43')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (3, N'Banh Bot Loc.jpg', 1, N'F42')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (4, N'Banh Can.jpg', 1, N'F41')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (5, N'Banh Canh.jpg', 1, N'F02')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (6, N'Banh Chung.jpg', 1, N'F40')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (7, N'Banh Cong.jpg', 1, N'F38')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (8, N'Banh Cuon.jpg', 1, N'F50')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (9, N'Banh Da Cua.jpg', 1, N'F03')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (10, N'Banh Day.jpg', 1, N'F39')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (11, N'Banh Duc.jpg', 1, N'F37')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (12, N'Banh Gio.jpg', 1, N'F36')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (13, N'Banh Hoi.jpg', 1, N'F35')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (14, N'Bo Bia.jpg', 1, N'F49')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (15, N'Bun Bo Hue.jpg', 1, N'F04')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (16, N'Bun Ca.png', 1, N'F05')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (17, N'Ca Kho.jpg', 1, N'F11')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (18, N'Ca Khos.jpg', 1, N'F18')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (19, N'Cha.png', 1, N'F12')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (20, N'Chao Ech.jpg', 1, N'F14')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (21, N'Chao.jpg', 1, N'F32')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (22, N'Com Hen.png', 1, N'F08')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (23, N'Com Lam.jpg', 1, N'F09')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (24, N'Com Nep.jpg', 1, N'F10')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (25, N'Doi.jpg', 1, N'F13')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (26, N'Ech Khia.jpg', 1, N'F31')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (27, N'Ech Nuong.png', 1, N'F30')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (28, N'Ga Nuong.jpg', 1, N'F20')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (29, N'Goi Ca.png', 1, N'F47')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (30, N'Hu Tieu.jpg', 1, N'F01')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (31, N'Long Non.jpg', 1, N'F17')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (32, N'Luon Nuong.jpg', 1, N'F24')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (33, N'Mi Quang.jpg', 1, N'F06')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (34, N'Nem Chua.jpg', 1, N'F45')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (35, N'Nem Cuon.jpg', 1, N'F46')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (36, N'Nem Ran.jpg', 1, N'F48')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (37, N'Ngheu Hap.jpg', 1, N'F28')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (38, N'Ngheu Nuong.jpg', 1, N'F29')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (39, N'Oc Luoc.jpg', 1, N'F21')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (40, N'Oc Nuong.jpg', 1, N'F23')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (41, N'Oc xao.jpg', 1, N'F22')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (42, N'Pho.jpg', 1, N'F07')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (43, N'rau muong xao toi.jpg', 1, N'F16')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (44, N'Sup Cua.jpg', 1, N'F34')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (45, N'Sup Yen.jpg', 1, N'F33')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (46, N'Thit Khia.jpg', 1, N'F25')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (47, N'Thit Kho.jpg', 1, N'F15')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (48, N'Thit Nuong.jpg', 1, N'F19')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (49, N'Tom Hap.jpg', 1, N'F27')
INSERT [dbo].[ImgFoods] ([Img_Foods_Id], [Img_Foods], [Img_Foods_Sort], [Food_Code]) VALUES (50, N'Tom Nuong.jpg', 1, N'F26')
SET IDENTITY_INSERT [dbo].[ImgFoods] OFF
SET IDENTITY_INSERT [dbo].[ImgHotels] ON 

INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (1, N'CAP SAINT JACQUE 1.jpg', 1, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (2, N'CAP SAINT JACQUE 2.jpg', 2, N'HT1')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (3, N'Cong Tu Bac Lieu 1.jpg', 1, N'HT10')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (4, N'Cong Tu Bac Lieu 2.jpg', 2, N'HT10')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (5, N'Hoa Binh.jpg', 1, N'HT11')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (6, N'Hoa Binh 2.jpg', 2, N'HT11')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (7, N'Sammy 2.jpg', 1, N'HT12')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (8, N'Corvin Hotel.jpg', 2, N'HT12')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (9, N'Golf Can Tho.jpg', 1, N'HT13')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (10, N'Golf Can Tho 2.jpg', 2, N'HT13')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (11, N'A & Em 2.jpg', 1, N'HT14')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (12, N'A & Em.jpg', 2, N'HT14')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (13, N'Ngoi Sao SAPA.jpg', 1, N'HT15')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (14, N'Ngoi Sao SAPA 2.jpg', 2, N'HT15')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (15, N'Deawoo.png', 1, N'HT16')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (16, N'Golf Can Tho.jpg', 2, N'HT16')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (17, N'VICTORIA.jpg', 1, N'HT17')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (18, N'VICTORIA 2.jpg', 2, N'HT17')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (19, N'Bamboo.jpg', 1, N'HT18')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (20, N'Bamboo 2.jpg', 2, N'HT18')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (21, N'Dang Khoa.jpg', 1, N'HT19')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (22, N'Dang Khoa 2.jpg', 2, N'HT19')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (23, N'Park Hyatt Saigon.jpg', 1, N'HT2')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (24, N'Park Hyatt Saigon 2.jpg', 2, N'HT2')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (25, N'Dream 2.jpg', 1, N'HT20')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (26, N'Dream.jpg', 2, N'HT20')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (27, N'VINPEARL RESORT NHA TRANG.jpg', 1, N'HT21')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (28, N'VINPEARL RESORT NHA TRANG 2.jpg', 2, N'HT21')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (29, N'FURAMA RESORT.jpg', 1, N'HT22')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (30, N'FURAMA RESORT 2.jpg', 2, N'HT22')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (31, N'FUSION MAIA RESORT.jpg', 1, N'HT23')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (32, N'FURAMA RESORT.jpg', 2, N'HT23')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (33, N'VICTORIA BEACH RESORT & SPA.jpg', 1, N'HT24')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (34, N'VICTORIA BEACH RESORT & SPA 2.jpg', 2, N'HT24')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (35, N'THE NAM HAI RESORT.jpg', 1, N'HT25')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (36, N'THE NAM HAI RESORT 2.jpg', 2, N'HT25')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (37, N'LA RESIDENCE HOTEL & SPA.jpg', 1, N'HT26')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (38, N'LA RESIDENCE HOTEL & SPA 2.jpg', 2, N'HT26')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (39, N'PRINCESS D''''''''''''''''ANNAM RESORT &SPA 2.jpg', 1, N'HT27')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (40, N'CAP SAINT JACQUE 1.jpg', 2, N'HT27')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (41, N'ANA MANDARA VILLAS DALAT RESORT & SPA.jpg', 1, N'HT28')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (42, N'ANA MANDARA VILLAS DALAT RESORT & SPA 2.jpg', 2, N'HT28')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (43, N'La Vie Hotel.jpg', 1, N'HT29')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (44, N'FURAMA RESORT.jpg', 2, N'HT29')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (45, N'Sheraton Saigon.jpg', 1, N'HT3')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (46, N'Sheraton Saigon 2.jpg', 2, N'HT3')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (47, N'Dendro.jpg', 1, N'HT30')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (48, N'Dendro 2.jpg', 2, N'HT30')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (49, N'Caravelle 2.jpg', 1, N'HT31')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (50, N'La Vie Hotel.jpg', 2, N'HT31')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (51, N'BANA HILLS.jpg', 1, N'HT32')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (52, N'BANA HILLS 2.jpg', 2, N'HT32')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (53, N'Tan Da Resort.jpg', 1, N'HT33')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (54, N'Tan Da Resort 2.jpg', 2, N'HT33')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (55, N'TAM DAO BELVEDERE RESORT 2.jpg', 1, N'HT34')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (56, N'TAM DAO BELVEDERE RESORT.jpg', 2, N'HT34')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (57, N'KHU NGHI DUONG TOPAS ECOLODGE.jpg', 1, N'HT35')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (58, N'KHU NGHI DUONG TOPAS ECOLODGE 2.png', 2, N'HT35')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (59, N'V resort.jpg', 1, N'HT36')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (60, N'V resort 2.jpg', 2, N'HT36')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (61, N'Emeralda 2.jpg', 1, N'HT37')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (62, N'Emeralda.jpg', 2, N'HT37')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (63, N'Mai Chau Ecolodge.png', 1, N'HT38')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (64, N'Mai Chau Ecolodge 2.jpg', 2, N'HT38')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (65, N'Flamingo Dai Lai.jpg', 1, N'HT39')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (66, N'Flamingo Dai Lai 2.jpg', 2, N'HT39')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (67, N'Caravelle.jpg', 1, N'HT4')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (68, N'Caravelle 2.jpg', 2, N'HT4')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (69, N'Cuc Phuong.jpg', 1, N'HT40')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (70, N'Cuc Phuong 2.jpg', 2, N'HT40')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (71, N'zari house.jpg', 1, N'HT41')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (72, N'zari house 2.jpg', 2, N'HT41')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (73, N'Vivian Villa & Apartment By My Khe Beach 2.jpg', 1, N'HT42')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (74, N'Vivian Villa & Apartment By My Khe Beach.jpg', 2, N'HT42')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (75, N'Papa Mike Hostel Prince 2.jpg', 1, N'HT43')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (76, N'Papa Mike Hostel Prince.jpg', 2, N'HT43')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (77, N'Hoang An Hotel.jpg', 1, N'HT44')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (78, N'Hoang An Hotel 2.jpg', 2, N'HT44')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (79, N'Hotel Tan Phu.jpg', 1, N'HT45')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (80, N'Hotel Tan Phu 2.jpg', 2, N'HT45')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (81, N'MAY Bungalow.jpg', 1, N'HT46')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (82, N'MAY Bungalow 2.jpg', 2, N'HT46')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (83, N'Quoc Dinh Guesthouse 2.jpg', 1, N'HT47')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (84, N'Quoc Dinh Guesthouse.jpg', 2, N'HT47')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (85, N'Corvin Hotel 2.jpg', 1, N'HT48')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (86, N'Corvin Hotel.jpg', 2, N'HT48')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (87, N'Ocean View 2.jpg', 1, N'HT49')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (88, N'Ocean View.jpg', 2, N'HT49')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (89, N'REX 2.jpg', 1, N'HT5')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (90, N'REX.jpg', 2, N'HT5')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (91, N'Phoenix 2.jpg', 1, N'HT50')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (92, N'Phoenix.jpg', 2, N'HT50')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (93, N'Thien Ngan 2.jpg', 1, N'HT6')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (94, N'Thien Ngan.jpg', 2, N'HT6')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (95, N'Ha Long Plaza 2.jpg', 1, N'HT7')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (96, N'Ha Long Plaza.jpg', 2, N'HT7')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (97, N'Mithrin 2.jpg', 1, N'HT8')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (98, N'Mithrin.jpg', 2, N'HT8')
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (99, N'sao mai 2.jpg', 1, N'HT9')
GO
INSERT [dbo].[ImgHotels] ([Img_Hotels_Id], [Img_Hotels], [Img_Hotels_Sort], [Hotel_Id]) VALUES (100, N'sao mai.jpg', 2, N'HT9')
SET IDENTITY_INSERT [dbo].[ImgHotels] OFF
SET IDENTITY_INSERT [dbo].[ImgRestaurants] ON 

INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (25, N'2.jpg', 1, N'RTR11')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (26, N'1.jpg', 2, N'RTR11')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (27, N'3.jpg', 1, N'RTR48')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (28, N'4.jpg', 2, N'RTR48')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (29, N'5.jpg', 1, N'RTR38')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (30, N'6.jpg', 2, N'RTR38')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (31, N'7.jpg', 1, N'RTR40')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (32, N'8.jpg', 2, N'RTR40')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (33, N'9.jpg', 1, N'RTR47')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (34, N'10.jpg', 2, N'RTR47')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (35, N'11.jpg', 1, N'RTR49')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (36, N'12.jpg', 2, N'RTR49')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (37, N'13.jpg', 1, N'RTR46')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (38, N'14.jpg', 2, N'RTR46')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (39, N'15.jpg', 1, N'RTR2')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (40, N'16.jpg', 2, N'RTR2')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (41, N'17.jpg', 1, N'RTR26')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (42, N'18.jpg', 2, N'RTR26')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (43, N'19.jpg', 1, N'RTR32')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (44, N'20.jpg', 2, N'RTR32')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (45, N'21.jpg', 1, N'RTR5')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (46, N'22.jpg', 2, N'RTR5')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (47, N'6.jpg', 1, N'RTR50')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (48, N'23.jpg', 2, N'RTR50')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (49, N'24.jpg', 1, N'RTR27')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (50, N'23.jpg', 2, N'RTR27')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (51, N'26.png', 1, N'RTR20')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (52, N'25.jpg', 2, N'RTR20')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (53, N'26.png', 1, N'RTR18')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (54, N'8.jpg', 2, N'RTR18')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (55, N'6.jpg', 1, N'RTR25')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (56, N'22.jpg', 2, N'RTR25')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (57, N'12.jpg', 1, N'RTR7')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (58, N'10.jpg', 2, N'RTR7')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (59, N'22.jpg', 1, N'RTR15')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (60, N'5.jpg', 2, N'RTR15')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (61, N'8.jpg', 1, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (62, N'23.jpg', 2, N'RTR10')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (63, N'1.jpg', 1, N'RTR12')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (64, N'24.jpg', 2, N'RTR12')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (65, N'27.jpg', 1, N'RTR4')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (66, N'28.jpg', 2, N'RTR4')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (67, N'25.jpg', 1, N'RTR42')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (68, N'26.png', 2, N'RTR42')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (69, N'29.jpg', 1, N'RTR37')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (70, N'30.jpg', 2, N'RTR37')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (71, N'31.jpg', 1, N'RTR36')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (72, N'33.jpg', 2, N'RTR36')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (73, N'34.jpg', 1, N'RTR14')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (74, N'35.jpg', 2, N'RTR14')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (75, N'40.jpg', 1, N'RTR30')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (76, N'41.jpg', 2, N'RTR30')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (77, N'42.jpg', 1, N'RTR39')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (78, N'43.jpg', 2, N'RTR39')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (79, N'44.jpg', 1, N'RTR35')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (80, N'45.jpg', 2, N'RTR35')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (81, N'46.jpg', 1, N'RTR29')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (82, N'47.jpg', 2, N'RTR29')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (83, N'49.jpg', 1, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (84, N'50.jpg', 2, N'RTR1')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (85, N'45.jpg', 1, N'RTR6')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (86, N'20.jpg', 2, N'RTR6')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (87, N'4.jpg', 1, N'RTR24')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (88, N'23.jpg', 2, N'RTR24')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (89, N'42.jpg', 1, N'RTR28')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (90, N'12.jpg', 2, N'RTR28')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (91, N'22.jpg', 1, N'RTR3')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (92, N'33.jpg', 2, N'RTR3')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (93, N'25.jpg', 1, N'RTR34')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (94, N'34.jpg', 2, N'RTR34')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (95, N'46.jpg', 1, N'RTR45')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (96, N'39.jpg', 2, N'RTR45')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (97, N'44.jpg', 1, N'RTR17')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (98, N'25.jpg', 2, N'RTR17')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (99, N'13.jpg', 1, N'RTR23')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (100, N'6.jpg', 2, N'RTR23')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (101, N'7.jpg', 1, N'RTR31')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (102, N'33.jpg', 2, N'RTR31')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (103, N'9.jpg', 1, N'RTR21')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (104, N'2.jpg', 2, N'RTR21')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (105, N'4.jpg', 1, N'RTR19')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (106, N'26.png', 2, N'RTR19')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (107, N'48.jpg', 1, N'RTR16')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (108, N'50.jpg', 2, N'RTR16')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (109, N'7.jpg', 1, N'RTR43')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (110, N'17.jpg', 2, N'RTR43')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (111, N'34.jpg', 1, N'RTR41')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (112, N'6.jpg', 2, N'RTR41')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (113, N'2.jpg', 1, N'RTR44')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (114, N'4.jpg', 2, N'RTR44')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (115, N'12.jpg', 1, N'RTR13')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (116, N'6.jpg', 2, N'RTR13')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (117, N'31.jpg', 1, N'RTR9')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (118, N'21.jpg', 2, N'RTR9')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (119, N'11.jpg', 1, N'RTR33')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (120, N'43.jpg', 2, N'RTR33')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (121, N'29.jpg', 1, N'RTR22')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (122, N'19.jpg', 2, N'RTR22')
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (123, N'49.jpg', 1, N'RTR8')
GO
INSERT [dbo].[ImgRestaurants] ([Img_Restaurants_Id], [Img_Restaurants], [Img_Restaurants_Sort], [Restaurant_Code]) VALUES (124, N'7.jpg', 2, N'RTR8')
SET IDENTITY_INSERT [dbo].[ImgRestaurants] OFF
SET IDENTITY_INSERT [dbo].[ImgTouristSpot] ON 

INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (1, N'Can Tho.jpg', 1, N'TS10')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (2, N'Can Tho 2.jpg', 2, N'TS10')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (3, N'Ca Mau 4.jpg', 3, N'TS10')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (4, N'Ca Mau 3.jpg', 1, N'TS1')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (5, N'Ca Mau 2.jpg', 2, N'TS1')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (6, N'Can Tho 4.jpg', 3, N'TS1')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (7, N'HCM 2.jpg', 1, N'TS11')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (8, N'HCM.jpg', 2, N'TS11')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (9, N'HCM 4.jpg', 3, N'TS11')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (10, N'Phu Quoc 3.jpg', 1, N'TS12')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (11, N'Phu Quoc 4.jpg', 2, N'TS12')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (12, N'Phu Quoc.jpg', 3, N'TS12')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (13, N'Da Lat 2.jpg', 1, N'TS13')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (14, N'Da Lat 3.jpg', 2, N'TS13')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (15, N'Da Lat.jpg', 3, N'TS13')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (16, N'Sapa 2.jpg', 1, N'TS14')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (17, N'Sapa 4.jpg', 2, N'TS14')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (18, N'Sapa.jpg', 3, N'TS14')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (19, N'Ha Noi 3.jpg', 1, N'TS15')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (20, N'Ha Noi 2.jpg', 2, N'TS15')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (21, N'Ha Noi.jpg', 3, N'TS15')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (22, N'Moc Chau 3.jpg', 1, N'TS16')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (23, N'Moc Chau 4.jpg', 2, N'TS16')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (24, N'Moc Chau.jpg', 3, N'TS16')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (25, N'Tam Dao 3.jpg', 1, N'TS17')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (26, N'Tam Dao 2.jpg', 2, N'TS17')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (27, N'Tam Dao 4.jpg', 3, N'TS17')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (28, N'Mai Chau 3.jpg', 1, N'TS18')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (29, N'Mai Chau 2.jpg', 2, N'TS18')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (30, N'Mai Chau.jpg', 3, N'TS18')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (31, N'Nha Trang 2.jpg', 1, N'TS19')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (32, N'Nha Trang 4.jpg', 2, N'TS19')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (33, N'Nha Trang.jpg', 3, N'TS19')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (34, N'Dao Ly Son 3.jpg', 1, N'TS2')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (35, N'Dao Ly Son 2.jpg', 2, N'TS2')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (36, N'Dao Ly Son 4.jpg', 3, N'TS2')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (37, N'Chua Thien Hung 3.jpg', 1, N'TS20')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (38, N'Chua Thien Hung 2.jpg', 2, N'TS20')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (39, N'Chua Thien Hung.jpg', 3, N'TS20')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (40, N'Cu Lao Cham 2.jpg', 1, N'TS21')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (41, N'Cu Lao Cham 4.jpg', 2, N'TS21')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (42, N'Cu Lao Cham.jpg', 3, N'TS21')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (43, N'Hoi An 3.jpg', 1, N'TS22')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (44, N'Hoi An 4.jpg', 2, N'TS22')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (45, N'Hoi An.jpg', 3, N'TS22')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (46, N'Sam Son 2.jpg', 1, N'TS23')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (47, N'Sam Son 3.jpg', 2, N'TS23')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (48, N'Sam Son 4.jpg', 3, N'TS23')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (49, N'Phan Thiet 2.jpg', 1, N'TS24')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (50, N'Phan Thiet 3.jpg', 2, N'TS24')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (51, N'Phan Thiet 4.jpg', 3, N'TS24')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (52, N'Vung Tau 2.jpg', 1, N'TS25')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (53, N'Vung Tau 3.jpg', 2, N'TS25')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (54, N'Vung Tau 4.jpg', 3, N'TS25')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (55, N'Co To 3.jpg', 1, N'TS26')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (56, N'Co To 2.jpg', 2, N'TS26')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (57, N'Co To 4.jpg', 3, N'TS26')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (58, N'Cua Lo 2.jpg', 1, N'TS27')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (59, N'Cua Lo 3.jpg', 2, N'TS27')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (60, N'Cua Lo 4.jpg', 3, N'TS27')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (61, N'Ba Na 2.jpg', 1, N'TS28')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (62, N'Ba Na 3.jpg', 2, N'TS28')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (63, N'Ba Na 4.jpg', 3, N'TS28')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (64, N'Moc Chau 2.jpg', 1, N'TS29')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (65, N'Moc Chau 3.jpg', 2, N'TS29')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (66, N'Moc Chau 4.jpg', 3, N'TS29')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (67, N'Phanxipang 2.jpg', 1, N'TS3')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (68, N'Phanxipang 3.jpg', 2, N'TS3')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (69, N'Phanxipang 4.png', 3, N'TS3')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (70, N'Trang an 2.jpg', 1, N'TS30')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (71, N'Trang an 3.jpg', 2, N'TS30')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (72, N'Trang an 4.jpg', 3, N'TS30')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (73, N'Ba Den 2.jpg', 1, N'TS31')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (74, N'Ba Den 3.jpg', 2, N'TS31')
INSERT [dbo].[ImgTouristSpot] ([Img_TouristSpot_Id], [Img_TouristSpot], [Img_TouristSpot_Sort], [TouristSpot_Id]) VALUES (75, N'Ba Den 4.jpg', 3, N'TS31')
SET IDENTITY_INSERT [dbo].[ImgTouristSpot] OFF
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC1', N'Southern VietNam', N'Mekong Delta1')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC2', N'North VietNam', N'Red river delta')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC3', N'Northwest VietNam', N'North-west forest')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC4', N'Beach VietNam', N'Central')
INSERT [dbo].[Location] ([Location_Id], [Location_Name], [Location_Location]) VALUES (N'LC5', N'Mountain', N'All Mountain in VN')
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR1', N'Mountain Retreat', N'Ho Chi Minh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR10', N'Hoang Yen Buffet
', N'Ho Chi Minh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR11', N'An Nam Quan', N'Ho Chi Minh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS10', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR12', N'Home Finest Saigon', N'Ho Chi Minh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS10', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR13', N'The Chopsticks', N'Ho Chi Minh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS11', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR14', N'Mekong', N'Can Tho', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS11', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR15', N'L''Escale', N'Can Tho', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS12', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR16', N'Sao Hom', N'Can Tho', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS12', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR17', N'Phương Nam', N'Can Tho', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS13', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR18', N'Hai San Bien Dong', N'Can Tho', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS13', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR19', N'Restaurant & cooking', N'Ha Noi', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS14', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR2', N'Downtown Restaurant', N'Thai Binh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS14', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR20', N'Green Farm', N'Thai Binh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS15', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR21', N'RedBean Trendy', N'Thai Binh', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS15', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR22', N'Vietnamese', N'Hai Phong', 1, NULL, N'TS16', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR23', N'Red Bean Central', N'Ha Noi', 1, NULL, N'TS16', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR24', N'Ngon Villa', N'Hai Phong', 1, NULL, N'TS17', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR25', N'Hanoi Food Culture', N'Ha Noi', 1, NULL, N'TS17', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR26', N'Essence', N'Hai Phong', 1, NULL, N'TS18', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR27', N'Grandma''s', N'Ha Noi', 1, NULL, N'TS18', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR28', N'Ngon Villa Danang', N'Da Nang', 1, NULL, N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR29', N'Nen', N'Da Nang', 1, NULL, N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR3', N'Olivia''s Prime', N'Da Nang', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS19', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR30', N'Merkat', N'Da Nang', 1, NULL, N'TS19', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR31', N'Red Sky Bar', N'Vung Tau', 1, NULL, N'TS25', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR32', N'Fish Dance Cafe', N'Vung Tau', 1, NULL, N'TS26', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR33', N'Veda''s Kitchen', N'Vung Tau', 1, NULL, N'TS26', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR34', N'Panorama', N'Vung Tau', 1, NULL, N'TS27', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR35', N'My Casa', N'Vung Tau', 1, NULL, N'TS27', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR36', N'Maharaja', N'Hue', 1, NULL, N'TS20', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR37', N'Madame Hanh', N'Hue', 1, NULL, N'TS20', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR38', N'Brilliant Top Bar', N'Hue', 1, NULL, N'TS21', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR39', N'Mumtaz Indian', N'Hue', 1, NULL, N'TS21', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR4', N'Limoncello', N'Hue', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS22', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR40', N'Citron', N'Nha Trang', 1, NULL, N'TS22', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR41', N'Tamarind Tree', N'Ba Na Hill', 1, NULL, N'TS3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR42', N'Le Rendez Vous', N'Ba Na Hill', 1, NULL, N'TS3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR43', N'Sofia Restaurant', N'Ba Na Hill', 1, NULL, N'TS28', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR44', N'Taco NGON', N'Co To', 1, NULL, N'TS28', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR45', N'Pho Viet Kieu', N'Co To', 1, NULL, N'TS29', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR46', N'DOM ', N'Co To', 1, NULL, N'TS29', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR47', N'CohibaR', N'Co To', 1, NULL, N'TS30', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR48', N'Ancient Hue', N'Co To', 1, NULL, N'TS30', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR49', N'DMZ bar', N'Co To', 1, NULL, N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR5', N'Gecko Pub', N'Nha Trang', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS23', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR50', N'Golden Rice', N'Ba Na Hill', 1, NULL, N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR6', N'Net Hue', N'Nha Trang', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS23', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR7', N'Hue Cocotte', N'Nha Trang', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS24', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR8', N'Why Not Bar', N'Nha Trang', 1, N'Bar on the central district and the need for security work, several times in the poem, but this is my first time to go to the bar, but not wide Qu m m space comfortable, waiter warm quickly, called three points: Sour Shrimp Soup, vegetables, pig Baohua * It should be said that it is a very tasty dish, but the taste of white rice is delicious, but the delicious food is good and cheap.', N'TS24', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Restaurants] ([Restaurant_Code], [Restaurant_Name], [Restaurant_Address], [Restaurant_Status], [Restaurant_Description], [TouristSpot_Id], [Restaurant_Create]) VALUES (N'RTR9', N'The Co Do Hue', N'Nha Trang', 1, NULL, N'TS25', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R01', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT1')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R02', N'Five Start', N'002', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT2')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R03', N'Two Start', N'003', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT3')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R04', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT4')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R05', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT5')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R06', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT6')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R07', N'Two Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT7')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R08', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT8')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R09', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT9')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R10', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT10')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R11', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT11')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R12', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT12')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R13', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT13')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R14', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT14')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R15', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT15')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R16', N'Five Start', N'001', CAST(N'06:00:00' AS Time), CAST(N'23:00:00' AS Time), 100000000.0000, N'HT16')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R17', N'Three Start', N'001', NULL, NULL, NULL, N'HT17')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R18', N'Five Start', N'001', NULL, NULL, NULL, N'HT18')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R19', N'Three Start', N'001', NULL, NULL, NULL, N'HT19')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R20', N'Five Start', N'001', NULL, NULL, NULL, N'HT20')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R21', N'Two Start', N'211', NULL, NULL, NULL, N'HT21')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R22', N'Four Start', N'333', NULL, NULL, NULL, N'HT22')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R23', N'Four Start', N'434', NULL, NULL, NULL, N'HT23')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R24', N'Two Start', N'534', NULL, NULL, NULL, N'HT24')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R25', N'Five Start', N'323', NULL, NULL, NULL, N'HT25')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R26', N'Four Start', N'333', NULL, NULL, NULL, N'HT26')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R27', N'Three Start', N'121', NULL, NULL, NULL, N'HT27')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R28', N'Four Start', N'123', NULL, NULL, NULL, N'HT28')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R29', N'Two Start', N'222', NULL, NULL, NULL, N'HT19')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R30', N'Four Start', N'211', NULL, NULL, NULL, N'HT30')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R31', N'Two Start', N'211', NULL, NULL, NULL, N'HT31')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R32', N'Two Start', N'211', NULL, NULL, NULL, N'HT32')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R33', N'Four Start', N'534', NULL, NULL, NULL, N'HT33')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R34', N'Two Start', N'115', NULL, NULL, NULL, N'HT34')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R35', N'Four Start', N'115', NULL, NULL, NULL, N'HT35')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R36', N'Three Start', N'115', NULL, NULL, NULL, N'HT36')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R37', N'Three Start', N'115', NULL, NULL, NULL, N'HT37')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R38', N'Two Start', N'115', NULL, NULL, NULL, N'HT38')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R39', N'Three Start', N'115', NULL, NULL, NULL, N'HT39')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R40', N'Three Start', N'115', NULL, NULL, NULL, N'HT40')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R41', N'Two Start', N'115', NULL, NULL, NULL, N'HT41')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R42', N'Two Start', N'115', NULL, NULL, NULL, N'HT42')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R43', N'Three Start', N'113', NULL, NULL, NULL, N'HT43')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R44', N'Four Start', N'113', NULL, NULL, NULL, N'HT44')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R45', N'Two Start', N'113', NULL, NULL, NULL, N'HT45')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R46', N'Two Start', N'113', NULL, NULL, NULL, N'HT46')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R47', N'Four Start', N'113', NULL, NULL, NULL, N'HT47')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R48', N'Three Start', N'112', NULL, NULL, NULL, N'HT48')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R49', N'Three Start', N'534', NULL, NULL, NULL, N'HT49')
INSERT [dbo].[Rooms] ([Room_Id], [Room_Type], [Room_Name], [Room_Start], [Room_Stop], [Room_Cost], [Hotel_Id]) VALUES (N'R50', N'Three Start', N'534', NULL, NULL, NULL, N'HT50')
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'DF', 1, 2, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000002D00000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF2F000000030000000400000005000000060000000700000008000000090000000A000000FEFFFFFF0C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C000000FEFFFFFFFEFFFFFF4B000000FEFFFFFF3100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F000000400000004100000042000000430000004400000045000000460000004700000048000000490000004A000000FEFFFFFF4C0000004D000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000070F0B021B857D4012E00000040070000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000008A110000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000B0000008043000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000430000A1E100C05000080480000000F00FFFF48000000007D000074450000B43A0000DAAF0000C71001008B51000082470000DE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C350000009810000000B5010000003400A509000007000080100000009E020000008000000C0000805363684772696400FC2100003408000041626F757473202864626F2900003400A509000007000080110000009C020000008000000B00008053636847726964008A6600003408000041646D696E202864626F290000003800A50900000700008012000000A2020000008000000E0000805363684772696400A41F00003A6B0000437573746F6D6572202864626F29000000003800A50900000700008013000000A2020000008000000E00008053636847726964008E44000034080000466565646261636B202864626F29000000003400A509000007000080140000009C020000008000000B00008053636847726964003E490000B2D40000466F6F6473202864626F290000003400A509000007000080150000009E020000008000000C00008053636847726964004272000034530000486F74656C73202864626F2900003800A50900000700008016000000A2020000008000000E00008053636847726964003E49000042BD0000496D67466F6F6473202864626F29000000008800A5090000070000801700000052000000018000005E000080436F6E74726F6C00C95200001AC9000052656C6174696F6E736869702027464B5F5F496D67466F6F64735F5F466F6F645F435F5F3542453241364632202864626F2927206265747765656E2027466F6F6473202864626F292720616E642027496D67466F6F6473202864626F2927000000002800B50100000700008018000000310000006F00000002800000436F6E74726F6C000F55000011CF000000003800A50900000700008019000000A4020000008000000F0000805363684772696400427200002E3B0000496D67486F74656C73202864626F290000008800A5090000070000801A000000520000000180000060000080436F6E74726F6C00CD7B00000647000052656C6174696F6E736869702027464B5F5F496D67486F74656C735F5F486F74656C5F5F3630413735433046202864626F2927206265747765656E2027486F74656C73202864626F292720616E642027496D67486F74656C73202864626F292700002800B5010000070000801B000000310000006F00000002800000436F6E74726F6C00137E00003D4D000000003C00A5090000070000801C000000AE020000008000001400008053636847726964000429000058E30000496D6752657374617572616E7473202864626F2900003800A5090000070000801D000000A2020000008000000E000080536368477269640042720000368D0000496D67526F6F6D73202864626F29000000003C00A5090000070000801E000000AE02000000800000140000805363684772696400427200003CA50000496D67546F757269737453706F74202864626F2900003800A5090000070000801F000000A2020000008000000E0000805363684772696400E268000042BD00004C6F636174696F6E202864626F29000000003C00A50900000700008020000000AC0200000080000013000080536368477269640000000000BA9000005061796D656E744D6574686F64202864626F290000003C00A50900000700008021000000A80200000080000011000080536368477269640004290000FAC8000052657374617572616E7473202864626F2900000000009400A5090000070000802200000052000000018000006A000080436F6E74726F6C008F32000051D7000052656C6174696F6E736869702027464B5F5F496D675265737461755F5F52657374615F5F3537314446314435202864626F2927206265747765656E202752657374617572616E7473202864626F292720616E642027496D6752657374617572616E7473202864626F2927000000002800B50100000700008023000000310000006F00000002800000436F6E74726F6C006A1F00005EDF000000008C00A50900000700008024000000620000000180000061000080436F6E74726F6C00603E00002DD0000052656C6174696F6E736869702027464B5F5F466F6F64735F5F52657374617572616E5F5F3539464135453830202864626F2927206265747765656E202752657374617572616E7473202864626F292720616E642027466F6F6473202864626F292700000000002800B50100000700008025000000310000006F00000002800000436F6E74726F6C00D9320000D7D6000000003400A509000007000080260000009C020000008000000B000080536368477269640042720000926D0000526F6F6D73202864626F290000008800A5090000070000802700000052000000018000005E000080436F6E74726F6C00CD7B0000DF80000052656C6174696F6E736869702027464B5F5F496D67526F6F6D735F5F526F6F6D5F495F5F3635364331313243202864626F2927206265747765656E2027526F6F6D73202864626F292720616E642027496D67526F6F6D73202864626F2927000000002800B50100000700008028000000310000006F00000002800000436F6E74726F6C00DE6700002189000000008400A5090000070000802900000052000000018000005B000080436F6E74726F6C00CD7B00008B61000052656C6174696F6E736869702027464B5F5F526F6F6D735F5F486F74656C5F49645F5F3633383343384241202864626F2927206265747765656E2027486F74656C73202864626F292720616E642027526F6F6D73202864626F29270000002800B5010000070000802A000000310000006D00000002800000436F6E74726F6C0072690000B868000000003C00A5090000070000802B000000A80200000080000011000080536368477269640000000000340800007379736469616772616D73202864626F2900000000003C00A5090000070000802C000000A802000000800000110000805363684772696400DE3F00000E6A0000546F757269737453706F74202864626F2900000000008C00A5090000070000802D000000620000000180000064000080436F6E74726F6C007B5300003282000052656C6174696F6E736869702027464B5F5F546F757269737453705F5F4C6F6361745F5F3530373046343436202864626F2927206265747765656E20274C6F636174696F6E202864626F292720616E642027546F757269737453706F74202864626F292700002800B5010000070000802E000000310000006F00000002800000436F6E74726F6C00A55500005CA2000000008C00A50900000700008031000000620000000180000062000080436F6E74726F6C00D4670000835A000052656C6174696F6E736869702027464B5F5F486F74656C735F5F546F7572697374535F5F3545424631333944202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E642027486F74656C73202864626F29276E0000002800B50100000700008032000000310000006F00000002800000436F6E74726F6C00CB7000008F6A000000009400A50900000700008033000000620000000180000069000080436F6E74726F6C00D46700008776000052656C6174696F6E736869702027464B5F496D67546F757269737453706F745F546F757269737453706F74202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E642027496D67546F757269737453706F74202864626F292700000000002800B50100000700008034000000310000006D00000002800000436F6E74726F6C004E5E0000EB95000000004000A50900000700008035000000B002000000800000150000805363684772696400DE3F0000004B00005472616E73706F72746174696F6E73202864626F290A000000003400A509000007000080380000009A020000008000000A000080536368477269640000000000666C000054726970202864626F29000000007800A5090000070000803900000052000000018000004F000080436F6E74726F6C005C1500004978000052656C6174696F6E736869702027464B5F547269705F437573746F6D6572202864626F2927206265747765656E2027437573746F6D6572202864626F292720616E64202754726970202864626F29270000002800B5010000070000803A000000310000005300000002800000436F6E74726F6C0021160000D977000000008400A5090000070000803B000000520000000180000059000080436F6E74726F6C008B090000A584000052656C6174696F6E736869702027464B5F547269705F5061796D656E744D6574686F64202864626F2927206265747765656E20275061796D656E744D6574686F64202864626F292720616E64202754726970202864626F292720286400002800B5010000070000803C000000310000005D00000002800000436F6E74726F6C00D10B0000E68A000000003C00A5090000070000803D000000A80200000080000011000080536368477269640000000000605400005472697044657461696C73202864626F2900000000008C00A5090000070000803E000000620000000180000063000080436F6E74726F6C005C150000ED59000052656C6174696F6E736869702027464B5F5472697044657461696C735F546F757269737453706F74202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E6420275472697044657461696C73202864626F29270000002800B5010000070000803F000000310000006700000002800000436F6E74726F6C00BD380000B465000000008000A50900000700008040000000520000000180000055000080436F6E74726F6C008B0900003860000052656C6174696F6E736869702027464B5F5472697044657461696C735F54726970202864626F2927206265747765656E202754726970202864626F292720616E6420275472697044657461696C73202864626F292700000000002800B50100000700008041000000310000005900000002800000436F6E74726F6C00D10B00001567000000003800A50900000700008042000000A0020000008000000D00008053636847726964003E490000B42D000056656869636C65202864626F290A000000008C00A50900000700008043000000520000000180000063000080436F6E74726F6C00C9520000823E000052656C6174696F6E736869702027464B5F56656869636C655F5472616E73706F72746174696F6E73202864626F2927206265747765656E20275472616E73706F72746174696F6E73202864626F292720616E64202756656869636C65202864626F29270000002800B50100000700008044000000310000006700000002800000436F6E74726F6C000F5500005A44000000008C00A50900000700008045000000620000000180000063000080436F6E74726F6C00AB3200003682000052656C6174696F6E736869702027464B5F52657374617572616E74735F546F757269737453706F74202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E64202752657374617572616E7473202864626F29271100002800B50100000700008046000000310000006700000002800000436F6E74726F6C00FA420000FAAC000000009400A5090000070000804700000052000000018000006B000080436F6E74726F6C00C95200002E5E000052656C6174696F6E736869702027464B5F5472616E73706F72746174696F6E735F546F757269737453706F74202864626F2927206265747765656E2027546F757269737453706F74202864626F292720616E6420275472616E73706F72746174696F6E73202864626F29270000002800B50100000700008048000000310000006F00000002800000436F6E74726F6C000F550000CF6400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000021433412080000008816000089130000785634120700000014010000410062006F0075007400730020002800640062006F00290000005B3FEAE9693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000007000000410062006F0075007400730000002143341208000000881600009D090000785634120700000014010000410064006D0069006E0020002800640062006F0029000000F1F0703F0000803F0000803F48005600000080400000E0400000A040000040400000A0400000C040000040400000C0400000C040000040400000C0400000C040000080400000C0400000E040000040400000C0400000C0400000E040000040400000C0400000A0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000006000000410064006D0069006E000000214334120800000088160000751D000078563412070000001401000043007500730074006F006D006500720020002800640062006F0029000000693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F0000003F000000000000000000000000ADAC2C3E3333333F000000000000000000000000E1E0603D6666663F000000000000000000000000C1C0403C0000803F000000000000000000000000000000000000F03F0000000000000000C4AB35650000000000000000846C36651C583665A0839C0FA0839C0F020000000200000000000000000000000090500F000000000200000000000000000000000000000000008243000082C30000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000C3200000000000002D0100000C0000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000751D0000000000000A0000000A00000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000043007500730074006F006D006500720000002143341208000000881600000416000078563412070000001401000046006500650064006200610063006B0020002800640062006F0029000000000000001440000000000000244000000000000014400000000000406F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000F03F00000000000000000000000000000000000000000000000000000000000000000000000000000000C4AB23650000000000000000846C24651C582465D055A70ED055A70E02000000020000000000000000000000202CE20E000000000200000000002041000020410000A04000002041000020410000A04000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000F1190000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000046006500650064006200610063006B0000002143341208000000881600000E11000078563412070000001401000046006F006F006400730020002800640062006F0029000000000000000000000000607140000000000000244000000000000014400000000000406F40000000000000F03F0000000000000000000000000100000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F00000000000000000000000000000000C4AB23650000000000000000846C24651C582465A062A70EA062A70E0200000002000000000000000000000098B89B0E000000000200000000008B430000204100808D430000204100008B430000704100000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000600000046006F006F006400730000002143341208000000881600000E11000078563412070000001401000048006F00740065006C00730020002800640062006F00290000000000000000000000244000000000004070400000000000C070400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000C4AB23650000000000000000846C24651C5824651857A70E1857A70E02000000020000000000000000000000D8AFCE0E0000000002000000000020410000824300002041008084430000A0400000824300000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000048006F00740065006C0073000000214334120800000088160000930E000078563412070000001401000049006D00670046006F006F006400730020002800640062006F002900000000000000244000000000000014400000000000C070400000000000001440000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000F03F0000000000000000000000000000000000000000000000000000000000000000C4AB23650000000000000000846C24651C5824655861A70E5861A70E02000000020000000000000000000000E029E20E00000000020000000000204100002041000020410000A040000070410000204100000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000049006D00670046006F006F0064007300000002000B0060540000B2D4000060540000D5CB00000000000002000000F0F0F000000000000000000000000000000000000100000018000000000000000F55000011CF00006414000058010000390000000100000200006414000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D00670046006F006F00640073005F005F0046006F006F0064005F0043005F005F0035004200450032004100360046003200214334120800000088160000930E000078563412070000001401000049006D00670048006F00740065006C00730020002800640062006F002900000000000000000000000000000000000000006071400000000000407040000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000C4AB23650000000000000000846C24651C582465E863A70EE863A70E02000000020000000000000000000000202AE20E000000000200000000000000000000000000000000008243000082C30000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000049006D00670048006F00740065006C007300000002000B00647D000034530000647D0000C14900000000000002000000F0F0F00000000000000000000000000000000000010000001B00000000000000137E00003D4D00004313000058010000390000000100000200004313000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D00670048006F00740065006C0073005F005F0048006F00740065006C005F005F0036003000410037003500430030004600214334120800000088160000930E000078563412070000001401000049006D006700520065007300740061007500720061006E007400730020002800640062006F002900000000400000000000E06A400000000000003340000000000000F03F00000000000000000000000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F03F0000000000000000C4AB23650000000000000000846C24651C58246560B0940E60B0940E02000000020000000000000000000000602FE20E00000000020000000000000000000040000000000000A841000098C10000004000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F00000049006D006700520065007300740061007500720061006E00740073000000214334120800000088160000930E000078563412070000001401000049006D00670052006F006F006D00730020002800640062006F00290000000000000000009605000000000000000000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000009E0600000000000000000000000000000000000000000000E30400000000000000000000000000000000000000000105000000000000000000000000000000000000000000000000730000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006E0200000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000049006D00670052006F006F006D0073000000214334120800000088160000930E000078563412070000001401000049006D00670054006F0075007200690073007400530070006F00740020002800640062006F0029000000000002053F030000000000000000000000000000000000000000000000000000000000000000C502000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006C27004BF9167F00D89CFF0E708BA70E00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000D0060000000000000000000000000000000000000000000000000000D005000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F00000049006D00670054006F0075007200690073007400530070006F0074000000214334120800000088160000180C00007856341207000000140100004C006F0063006100740069006F006E0020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000090000004C006F0063006100740069006F006E0000002143341208000000881600009D0900007856341207000000140100005000610079006D0065006E0074004D006500740068006F00640020002800640062006F002900000072006D0069006E006900730074006900630027002900200061007300200049007300440065007400650072006D0069006E00690073007400690063002C00200078006D006C0063006F006C006C002E006E0061006D006500200061007300200078006D006C0053006300680065006D0061005F006E0061006D0065002C00200073006300680065006D0061005F006E0061006D006500280078006D006C0063006F006C006C002E0073006300680065006D0061005F0069006400290020006100730020007800000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E0000005000610079006D0065006E0074004D006500740068006F00640000002143341208000000881600000E110000785634120700000014010000520065007300740061007500720061006E007400730020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F6090000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C000000520065007300740061007500720061006E0074007300000002000B002634000008DA00002634000058E300000000000002000000F0F0F000000000000000000000000000000000000100000023000000000000006A1F00005EDF00000D14000058010000430000000100000200000D14000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D0067005200650073007400610075005F005F00520065007300740061005F005F003500370031004400460031004400350004000B008C3F0000C4D100005C470000C4D100005C4700007CDD00003E4900007CDD00000000000002000000F0F0F00000000000000000000000000000000000010000002500000000000000D9320000D7D60000D41300005801000039000000010000020000D413000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0046006F006F00640073005F005F00520065007300740061007500720061006E005F005F00350039004600410035004500380030002143341208000000881600000416000078563412070000001401000052006F006F006D00730020002800640062006F00290000006C0075006D006E00500072006F0070006500720074007900280063006F006C002E006F0062006A006500630074005F00690064002C00200063006F006C002E006E0061006D0065002C0020004E00270049007300490064004E006F00740046006F0072005200650070006C00270029002900200061007300200049007300490064004E006F00740046006F0072005200650070006C002C00200063006F006C002E00690073005F007200650070006C006900630061007400650064002C00200063006F006C002E00690073005F006E006F006E005F00000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000F1190000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000600000052006F006F006D007300000002000B00647D000096830000647D0000368D00000000000002000000F0F0F00000000000000000000000000000000000010000002800000000000000DE67000021890000D71400005801000043000000010000020000D714000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0049006D00670052006F006F006D0073005F005F0052006F006F006D005F0049005F005F003600350036004300310031003200430002000B00647D000042640000647D0000926D00000000000002000000F0F0F00000000000000000000000000000000000010000002A0000000000000072690000B86800004313000058010000380000000100000200004313000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611D0046004B005F005F0052006F006F006D0073005F005F0048006F00740065006C005F00490064005F005F00360033003800330043003800420041002143341208000000881600000E1100007856341207000000140100007300790073006400690061006700720061006D00730020002800640062006F0029000000200061007300200066006F0072006D0075006C00610072002C002000630061007300650020007700680065006E00280063006D0063002E0063006F006C0075006D006E005F006900640020006900730020006E0075006C006C00290020007400680065006E0020006E0075006C006C00200065006C0073006500200063006D0063002E00690073005F00700065007200730069007300740065006400200065006E0064002000610073002000690073005F007000650072007300690073007400650064002C0020006400000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000007300790073006400690061006700720061006D0073000000214334120800000022290000DF1A000078563412070000001401000054006F0075007200690073007400530070006F00740020002800640062006F00290000006C002C00200063006F006C005F006E0061006D006500280063006F006C002E006F0062006A006500630074005F00690064002C0020006600740063002E0074007900700065005F0063006F006C0075006D006E005F006900640029002000460054005F0074007900700065005F0063006F006C0075006D006E002C0020006600740063002E006C0061006E00670075006100670065005F00690064002000610073002000460054005F006C0061006E00670075006100670065005F00690064002C002000630061007300000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000022290000DF1A0000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C00000054006F0075007200690073007400530070006F007400000004000B000474000042BD000004740000BEBA0000F6540000BEBA0000F6540000ED8400000000000002000000F0F0F00000000000000000000000000000000000010000002E00000000000000A55500005CA20000D01200005801000041000000010000020000D012000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0054006F0075007200690073007400530070005F005F004C006F006300610074005F005F003500300037003000460034003400360004000B00006900005C7600001C7000005C7600001C700000FE5B000042720000FE5B00000000000002000000F0F0F00000000000000000000000000000000000010000003200000000000000CB7000008F6A0000B31200005801000037000000010000020000B312000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005F0048006F00740065006C0073005F005F0054006F007500720069007300740053005F005F003500450042004600310033003900440004000B00006900001E7800001C7000001E7800001C70000044AC00004272000044AC00000000000002000000F0F0F000000000000000000000000000000000000100000034000000000000004E5E0000EB9500001F110000580100003B0000000100000200001F11000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F0049006D00670054006F0075007200690073007400530070006F0074005F0054006F0075007200690073007400530070006F007400214334120800000022290000E91500007856341207000000140100005400720061006E00730070006F00720074006100740069006F006E00730020002800640062006F00290000006D0065002C00200073006300680065006D0061005F006E0061006D0065002800730074002E0073006300680065006D0061005F006900640029002000610073002000440054005F0073006300680065006D0061002C00200063006F006C002E006D00610078005F006C0065006E006700740068002C00200063006F006C002E0070007200650063006900730069006F006E002C00200063006F006C002E00730000005000520049004D0041005200590000006E0061006D0065002000610073002000000000000000000000000000000005000000540000002C0000002C0000002C00000034000000000000000000000022290000E9150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000100000005400720061006E00730070006F00720074006100740069006F006E0073000000214334120800000088160000FA1A0000785634120700000014010000540072006900700020002800640062006F00290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003D000000000000000000000000000000000000000000000000000000000000000000000000000000E404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000920600000000000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000222900007D1E0000000000002D0100000B0000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000FA1A000000000000090000000900000002000000020000001C010000F50A0000000000000100000039130000060A000000000000030000000300000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000050000005400720069007000000002000B00A41F0000E079000088160000E07900000000000002000000F0F0F00000000000000000000000000000000000010000003A0000000000000021160000D9770000E90900005801000032000000010000020000E909000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61100046004B005F0054007200690070005F0043007500730074006F006D006500720002000B00220B0000BA900000220B0000608700000000000002000000F0F0F00000000000000000000000000000000000010000003C00000000000000D10B0000E68A0000840D00005801000038000000010000020000840D000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61150046004B005F0054007200690070005F005000610079006D0065006E0074004D006500740068006F006400214334120800000088160000930E00007856341207000000140100005400720069007000440065007400610069006C00730020002800640062006F0029000000C9000000000000000000000000000000000000000000000000000000BE0200000000000000000000000000004B0600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000B500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000005400720069007000440065007400610069006C007300000004000B00DE3F0000887700000E380000887700000E380000685B000088160000685B00000000000002000000F0F0F00000000000000000000000000000000000010000003F00000000000000BD380000B4650000880E00005801000022000000010000020000880E000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611A0046004B005F005400720069007000440065007400610069006C0073005F0054006F0075007200690073007400530070006F00740002000B00220B0000666C0000220B0000F36200000000000002000000F0F0F00000000000000000000000000000000000010000004100000000000000D10B0000156700005D0A000058010000310000000100000200005D0A000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F005400720069007000440065007400610069006C0073005F00540072006900700021433412080000008816000089130000785634120700000014010000560065006800690063006C00650020002800640062006F0029000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000560065006800690063006C006500000002000B0060540000004B0000605400003D4100000000000002000000F0F0F000000000000000000000000000000000000100000044000000000000000F5500005A440000FB0E0000580100003F000000010000020000FB0E000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611A0046004B005F00560065006800690063006C0065005F005400720061006E00730070006F00720074006100740069006F006E00730004000B0034530000ED84000034530000BEBA000026340000BEBA000026340000FAC800000000000002000000F0F0F00000000000000000000000000000000000010000004600000000000000FA420000FAAC00008B0F0000580100002A0000000100000200008B0F000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611A0046004B005F00520065007300740061007500720061006E00740073005F0054006F0075007200690073007400530070006F00740002000B00605400000E6A000060540000E96000000000000002000000F0F0F000000000000000000000000000000000000100000048000000000000000F550000CF6400007611000058010000320000000100000200007611000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611E0046004B005F005400720061006E00730070006F00720074006100740069006F006E0073005F0054006F0075007200690073007400530070006F007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F57390000020090F97D21B857D401020200001048450000000000000000000000000000000000400200004400610074006100200053006F0075007200630065003D00640061006E0067007400750061006E006800750079002E00640061007400610062006100730065002E00770069006E0064006F00770073002E006E00650074003B0049006E0069007400690061006C00200043006100740061006C006F0067003D004B00610072006E0065006C00540072006100760065006C003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00640061006E0067007400750061006E006800750079003B004D0075006C007400690070006C0065004100630074000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000030000000D23500000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000320600000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001C00000012000000000000000C0000008B510000824700000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000100000001000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000110000001100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000120000001200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000130000001300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000140000001400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000150000001500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000160000001600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001700000017000000000000004E000000013FC11B01000000640062006F00000046004B005F005F0049006D00670046006F006F00640073005F005F0046006F006F0064005F0043005F005F003500420045003200410036004600320000000000000000000000C402000000001800000018000000170000000800000001000412D80004120000000000000000AD070000000000190000001900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001A0000001A000000000000004E000000013FC11B01000000640062006F00000046004B005F005F0049006D00670048006F00740065006C0073005F005F0048006F00740065006C005F005F003600300041003700350043003000460000000000000000000000C402000000001B0000001B0000001A0000000800000001030412980304120000000000000000AD0700000000001C0000001C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001D0000001D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001E0000001E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001F0000001F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000200000002000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000210000002100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003500350030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002200000022000000000000004E000000013FC11B01000000640062006F00000046004B005F005F0049006D0067005200650073007400610075005F005F00520065007300740061005F005F003500370031004400460031004400350000000000000000000000C402000000002300000023000000220000000800000001030412580304120000000000000000AD0700000000002400000024000000000000004E000000013FC11B01000000640062006F00000046004B005F005F0046006F006F00640073005F005F00520065007300740061007500720061006E005F005F003500390046004100350045003800300000000000000000000000C402000000002500000025000000240000000800000001030412D80304120000000000000000AD070000000000260000002600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002700000027000000000000004E0000000167B11B01000000640062006F00000046004B005F005F0049006D00670052006F006F006D0073005F005F0052006F006F006D005F0049005F005F003600350036004300310031003200430000000000000000000000C402000000002800000028000000270000000800000001000412980004120000000000000000AD0700000000002900000029000000000000004C0000000167B11B01000000640062006F00000046004B005F005F0052006F006F006D0073005F005F0048006F00740065006C005F00490064005F005F003600330038003300430038004200410000000000000000000000C402000000002A0000002A000000290000000800000001050412180504120000000000000000AD0700000000002B0000002B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002C0000002C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002D0000002D000000000000004E000000013FC11B01000000640062006F00000046004B005F005F0054006F0075007200690073007400530070005F005F004C006F006300610074005F005F003500300037003000460034003400360000000000000000000000C402000000002E0000002E0000002D0000000800000001FD031298FD03120000000000000000AD0700000000003100000031000000000000004E00000001A47C2001000000640062006F00000046004B005F005F0048006F00740065006C0073005F005F0054006F007500720069007300740053005F005F003500450042004600310033003900440000000000000000000000C402000000003200000032000000310000000800000001030412180304120000000000000000AD0700000000003300000033000000000000004C000000013FC11B01000000640062006F00000046004B005F0049006D00670054006F0075007200690073007400530070006F0074005F0054006F0075007200690073007400530070006F00740000000000000000000000C402000000003400000034000000330000000800000001FF031218FF03120000000000000000AD070000000000350000003500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000380000003800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000390000003900000000000000320000000100000001000000640062006F00000046004B005F0054007200690070005F0043007500730074006F006D006500720000000000000000000000C402000000003A0000003A000000390000000800000001020412D80204120000000000000000AD0700000000003B0000003B000000000000003C0000000100000001000000640062006F00000046004B005F0054007200690070005F005000610079006D0065006E0074004D006500740068006F00640000000000000000000000C402000000003C0000003C0000003B0000000800000001FD0312D8FD03120000000000000000AD0700000000003D0000003D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003E0000003E00000000000000460000000100270001000000640062006F00000046004B005F005400720069007000440065007400610069006C0073005F0054006F0075007200690073007400530070006F00740000000000000000000000C402000000003F0000003F0000003E0000000800000001E9C511E8E9C5110000000000000000AD070000000000400000004000000000000000380000000100000001000000640062006F00000046004B005F005400720069007000440065007400610069006C0073005F00540072006900700000000000000000000000C402000000004100000041000000400000000800000001F0C51168F0C5110000000000000000AD070000000000420000004200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000430000004300000000000000460000000100270001000000640062006F00000046004B005F00560065006800690063006C0065005F005400720061006E00730070006F00720074006100740069006F006E00730000000000000000000000C402000000004400000044000000430000000800000001EEC511A8EEC5110000000000000000AD070000000000450000004500000000000000460000000100270001000000640062006F00000046004B005F00520065007300740061007500720061006E00740073005F0054006F0075007200690073007400530070006F00740000000000000000000000C402000000004600000046000000450000000800000001E8C51128E8C5110000000000000000AD0700000000004700000047000000000000004E000000013FC11B01000000640062006F00000046004B005F005400720061006E00730070006F00720074006100740069006F006E0073005F0054006F0075007200690073007400530070006F00740000000000000000000000C402000000004800000048000000470000000800000001E7C511E8E7C5110000000000000000AD070000000000500000003900000012000000380000007A0000007700000017000000140000001600000024000000250000001A0000001500000019000000240000002500000029000000150000002600000025000000240000002D0000001F0000002C00000024000000470000003B0000002000000038000000240000002500000022000000210000001C0000002500000024000000240000002100000014000000670000006600000027000000260000001D0000002500000024000000470000002C000000350000004400000045000000450000002C000000210000004100000024000000310000002C00000015000000B300000066000000330000002C0000001E000000B9000000600000003E0000002C0000003D000000B600000061000000430000003500000042000000440000002500000040000000380000003D00000024000000250000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B0043006F006E006E006500630074002000540069006D0065006F00750074003D00330030003B0045006E00630072007900700074003D0054007200750065003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500060000004400460000000002260010000000560065006800690063006C006500000008000000640062006F00000000022600180000005400720069007000440065007400610069006C007300000008000000640062006F000000000226000A0000005400720069007000000008000000640062006F00000000022600200000005400720061006E00730070006F00720074006100740069006F006E007300000008000000640062006F000000000226001800000054006F0075007200690073007400530070006F007400000008000000640062006F00000000022600180000007300790073006400690061006700720061006D007300000008000000640062006F000000000226000C00000052006F006F006D007300000008000000640062006F0000000002260018000000520065007300740061007500720061006E0074007300000008000000640062006F000000000226001C0000005000610079006D0065006E0074004D006500740068006F006400000008000000640062006F00000000022600120000004C006F0063006100740069006F006E00000008000000640062006F000000000226001E00000049006D00670054006F0075007200690073007400530070006F007400000008000000640062006F000000000226001200000049006D00670052006F006F006D007300000008000000640062006F000000000226001E00000049006D006700520065007300740061007500720061006E0074007300000008000000640062006F000000000226001400000049006D00670048006F00740065006C007300000008000000640062006F000000000226001200000049006D00670046006F006F0064007300000008000000640062006F000000000226000E00000048006F00740065006C007300000008000000640062006F000000000226000C00000046006F006F0064007300000008000000640062006F000000000226001200000046006500650064006200610063006B00000008000000640062006F000000000226001200000043007500730074006F006D0065007200000008000000640062006F000000000226000C000000410064006D0069006E00000008000000640062006F000000000224000E000000410062006F00750074007300000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D0000000000000000000000000000000000010003000000000000000C0000000B0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS1', N'Mekong Delta River', 10, CAST(20 AS Decimal(12, 0)), N'Private 3-Day', 1, N'LC1', CAST(N'2018-09-30' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS10', N'Can Tho', 80, CAST(100 AS Decimal(12, 0)), N'Ninh Kieu District', 1, N'LC1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS11', N'Ho Chi Minh', 60, CAST(80 AS Decimal(12, 0)), N'Dam Sen Park', 1, N'LC1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS12', N'Phu Quoc', 90, CAST(150 AS Decimal(12, 0)), N'Phu Quoc 
Island', 1, N'LC1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS13', N'Da Lat', 100, CAST(170 AS Decimal(12, 0)), N'Da Lat', 1, N'LC1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS14', N'Sa Pa', 100, CAST(200 AS Decimal(12, 0)), N'Sa Pa', 1, N'LC2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS15', N'Ha Noi', 100, CAST(180 AS Decimal(12, 0)), N'Hoan Kiem Lake', 1, N'LC2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS16', N'Moc Chau', 90, CAST(170 AS Decimal(12, 0)), N'Tea Hill', 1, N'LC2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS17', N'Tam Dao', 80, CAST(100 AS Decimal(12, 0)), N'Tam Dao', 1, N'LC2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS18', N'Mai Chau', 70, CAST(150 AS Decimal(12, 0)), N'Mai Chau', 1, N'LC2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS19', N'Nha Trang', 50, CAST(80 AS Decimal(12, 0)), N'Vinpearl Land', 1, N'LC3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS2', N'Quang Ngai', 60, CAST(160 AS Decimal(12, 0)), N'Ly Son Island', 1, N'LC3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS20', N'Binh Dinh', 50, CAST(200 AS Decimal(12, 0)), N'Thien Hung Pagoda', 1, N'LC3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS21', N'Quang Nam', 60, CAST(190 AS Decimal(12, 0)), N'Cu Lao Cham', 1, N'LC3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS22', N'Da Nang', 99, CAST(160 AS Decimal(12, 0)), N'Hoi An Ancient Town', 1, N'LC3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS23', N'Thanh Hoa', 40, CAST(190 AS Decimal(12, 0)), N'Sam Son Beach', 1, N'LC4', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS24', N'Binh Thuan', 50, CAST(50 AS Decimal(12, 0)), N'Phan Thiet Beach', 1, N'LC4', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS25', N'Vung Tau', 60, CAST(60 AS Decimal(12, 0)), N'Vung Tau Beach', 1, N'LC4', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS26', N'Quang Ninh ', 80, CAST(90 AS Decimal(12, 0)), N'Co To Beach', 1, N'LC4', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS27', N'Nghe An', 100, CAST(100 AS Decimal(12, 0)), N'Cua Lo Beach', 1, N'LC4', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS28', N'Da Nang', 99, CAST(88 AS Decimal(12, 0)), N'Ba Na Hill', 1, N'LC5', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS29', N'Son La', 80, CAST(110 AS Decimal(12, 0)), N'Moc Chau', 1, N'LC5', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS3', N'Lao Cai', 50, CAST(190 AS Decimal(12, 0)), N'Phanxipang', 1, N'LC5', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS30', N'Ninh Binh', 60, CAST(180 AS Decimal(12, 0)), N'Trang An', 1, N'LC5', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[TouristSpot] ([TouristSpot_Id], [TouristSpot_Name], [TouristSpot_Limit], [TouristSpot_Price], [TouristSpot_Specific], [TouristSpot_Status], [Location_Id], [TouristSpot_Create]) VALUES (N'TS31', N'Tay Ninh', 70, CAST(80 AS Decimal(12, 0)), N'Ba Den Moutain', 1, N'LC5', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT001', NULL, NULL, NULL, N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT002', N'Train', NULL, N'~/myImg/Transportations/TSTT002/LeftGrass.jpg', N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT003', N'Train', NULL, N'~/myImg/Transportations/TSTT003/Water.jpg', N'TS3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT004', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT005', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT006', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT007', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT008', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT009', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT010', N'Train', NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT011', N'Train', NULL, NULL, N'TS11', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT012', NULL, NULL, NULL, N'TS12', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT13', NULL, NULL, NULL, N'TS13', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT14', NULL, NULL, NULL, N'TS14', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT15', NULL, NULL, NULL, N'TS15', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT16', NULL, NULL, NULL, N'TS16', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT17', NULL, NULL, NULL, N'TS17', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT18', NULL, NULL, NULL, N'TS18', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT19', NULL, NULL, NULL, N'TS19', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT20', NULL, NULL, NULL, N'TS20', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT21', NULL, NULL, NULL, N'TS21', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT22', NULL, NULL, NULL, N'TS22', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT23', NULL, NULL, NULL, N'TS23', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT24', NULL, NULL, NULL, N'TS24', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT25', NULL, NULL, NULL, N'TS25', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT26', NULL, NULL, NULL, N'TS26', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT27', NULL, NULL, NULL, N'TS27', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT28', NULL, NULL, NULL, N'TS28', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT29', NULL, NULL, NULL, N'TS29', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT30', NULL, NULL, NULL, N'TS30', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT31', NULL, NULL, NULL, N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT32', NULL, NULL, NULL, N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT33', NULL, NULL, NULL, N'TS1', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT34', NULL, NULL, NULL, N'TS2', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT35', NULL, NULL, NULL, N'TS3', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT36', NULL, NULL, NULL, N'TS12', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT37', NULL, NULL, NULL, N'TS14', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT38', NULL, NULL, NULL, N'TS15', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT39', NULL, NULL, NULL, N'TS16', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT40', NULL, NULL, NULL, N'TS17', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT41', NULL, NULL, NULL, N'TS18', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT42', NULL, NULL, NULL, N'TS19', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT43', NULL, NULL, NULL, N'TS20', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT44', NULL, NULL, NULL, N'TS25', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT45', NULL, NULL, NULL, N'TS26', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT46', NULL, NULL, NULL, N'TS27', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT47', NULL, NULL, NULL, N'TS28', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT48', NULL, NULL, NULL, N'TS29', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT49', NULL, NULL, NULL, N'TS30', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Transportations] ([Transportation_Id], [Transportation_Name], [Transportation_Details], [Transportation_Img], [TouristSpot_Id], [Transportation_Create]) VALUES (N'TSTT50', NULL, NULL, NULL, N'TS31', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id], [Vehicle_Create]) VALUES (N'V001', N'Steam train 1', NULL, 500, N'~/myImg/Vehicle/V001/Train.jpg', N'TSTT011', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id], [Vehicle_Create]) VALUES (N'V002', N'Steam train', NULL, 500, NULL, N'TSTT011', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id], [Vehicle_Create]) VALUES (N'V003', N'Steam train', NULL, 500, NULL, N'TSTT011', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id], [Vehicle_Create]) VALUES (N'V004', N'Steam train', NULL, 500, NULL, N'TSTT011', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Name], [Vehicle_Price], [Vehicle_Weight], [Vehicle_Img], [Transportation_Id], [Vehicle_Create]) VALUES (N'V005', N'Steam train', NULL, 500, NULL, N'TSTT011', CAST(N'2018-09-29' AS Date))
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 10/6/2018 11:24:55 AM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Custom__4BAC3F29]  DEFAULT ((1)) FOR [Customer_Gender]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Feedback__State__160F4887]  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF__Feedback__Create__17036CC0]  DEFAULT (getdate()) FOR [Create_on]
GO
ALTER TABLE [dbo].[Hotels] ADD  CONSTRAINT [DF_Hotels_Hotel_Status]  DEFAULT ((1)) FOR [Hotel_Status]
GO
ALTER TABLE [dbo].[Hotels] ADD  CONSTRAINT [DF_Hotels_Hotel_Create]  DEFAULT (getdate()) FOR [Hotel_Create]
GO
ALTER TABLE [dbo].[Restaurants] ADD  CONSTRAINT [DF_Restaurants_Restaurant_Status]  DEFAULT ((1)) FOR [Restaurant_Status]
GO
ALTER TABLE [dbo].[Restaurants] ADD  CONSTRAINT [DF_Restaurants_Restaurant_Create]  DEFAULT (getdate()) FOR [Restaurant_Create]
GO
ALTER TABLE [dbo].[TouristSpot] ADD  CONSTRAINT [DF_TouristSpot_TouristSpot_Status]  DEFAULT ((0)) FOR [TouristSpot_Status]
GO
ALTER TABLE [dbo].[TouristSpot] ADD  CONSTRAINT [DF_TouristSpot_TouristSpot_Create]  DEFAULT (getdate()) FOR [TouristSpot_Create]
GO
ALTER TABLE [dbo].[Transportations] ADD  CONSTRAINT [DF_Transportations_Transportation_Create]  DEFAULT (getdate()) FOR [Transportation_Create]
GO
ALTER TABLE [dbo].[Trip] ADD  CONSTRAINT [DF_Trip_Trip_Date]  DEFAULT (getdate()) FOR [Trip_Date]
GO
ALTER TABLE [dbo].[Trip] ADD  CONSTRAINT [DF_Trip_Trip_Status]  DEFAULT ((0)) FOR [Trip_Status]
GO
ALTER TABLE [dbo].[Vehicle] ADD  CONSTRAINT [DF_Vehicle_Vehicle_Create]  DEFAULT (getdate()) FOR [Vehicle_Create]
GO
ALTER TABLE [dbo].[Foods]  WITH CHECK ADD  CONSTRAINT [FK__Foods__Restauran__59FA5E80] FOREIGN KEY([Restaurant_Code])
REFERENCES [dbo].[Restaurants] ([Restaurant_Code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Foods] CHECK CONSTRAINT [FK__Foods__Restauran__59FA5E80]
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
ALTER TABLE [dbo].[ImgRestaurants]  WITH CHECK ADD  CONSTRAINT [FK__ImgRestau__Resta__571DF1D5] FOREIGN KEY([Restaurant_Code])
REFERENCES [dbo].[Restaurants] ([Restaurant_Code])
GO
ALTER TABLE [dbo].[ImgRestaurants] CHECK CONSTRAINT [FK__ImgRestau__Resta__571DF1D5]
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
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD  CONSTRAINT [FK_Restaurants_TouristSpot] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Restaurants] CHECK CONSTRAINT [FK_Restaurants_TouristSpot]
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
ALTER TABLE [dbo].[Transportations]  WITH CHECK ADD  CONSTRAINT [FK_Transportations_TouristSpot] FOREIGN KEY([TouristSpot_Id])
REFERENCES [dbo].[TouristSpot] ([TouristSpot_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transportations] CHECK CONSTRAINT [FK_Transportations_TouristSpot]
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
GO
ALTER TABLE [dbo].[Vehicle] CHECK CONSTRAINT [FK_Vehicle_Transportations]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 10/6/2018 11:24:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 10/6/2018 11:24:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 10/6/2018 11:24:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 10/6/2018 11:24:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 10/6/2018 11:24:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 10/6/2018 11:24:55 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 10/6/2018 11:24:55 AM ******/
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
