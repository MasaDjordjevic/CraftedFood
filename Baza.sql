USE [master]
GO
/****** Object:  Database [CraftedFood]    Script Date: 14-Sep-16 12:14:15 PM ******/
CREATE DATABASE [CraftedFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CraftedFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CraftedFood.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CraftedFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CraftedFood_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CraftedFood] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CraftedFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CraftedFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CraftedFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CraftedFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CraftedFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CraftedFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [CraftedFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CraftedFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CraftedFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CraftedFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CraftedFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CraftedFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CraftedFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CraftedFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CraftedFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CraftedFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CraftedFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CraftedFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CraftedFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CraftedFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CraftedFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CraftedFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CraftedFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CraftedFood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CraftedFood] SET  MULTI_USER 
GO
ALTER DATABASE [CraftedFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CraftedFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CraftedFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CraftedFood] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CraftedFood] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CraftedFood]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nchar](20) NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Meal]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[MealId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](300) NULL,
	[Image] [image] NULL,
	[Price] [real] NOT NULL,
	[Quantity] [real] NOT NULL,
	[UnitId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Meal] PRIMARY KEY CLUSTERED 
(
	[MealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rating]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[RatingId] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](300) NULL,
	[Rating] [real] NULL,
	[Date] [datetime] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[MealId] [int] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[RatingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [real] NOT NULL,
	[DateRequested] [datetime] NULL,
	[DateDelivered] [datetime] NOT NULL,
	[DateToDeliver] [datetime] NULL,
	[Note] [nvarchar](300) NOT NULL,
	[Comment] [nvarchar](300) NOT NULL,
	[EmployeeId] [int] NULL,
	[MealId] [int] NULL,
	[payedDate] [datetime] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 14-Sep-16 12:14:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'salad')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'sandwich')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'bakery')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'pasta')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (5, N'sweet')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (6, N'drink')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (7, N'cookedMeal')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Mobile], [Password], [RoleId], [IsActive]) VALUES (7, N'Marko Mihajlovic', N'markomihajlovicfm@gmail.com', NULL, N'+dmJrDyGh/yREv2CS4oba3etzSx8YYBFPYwA1GJOcER6eGZkWmvoL4NAZ7L7mO2M5d4Zjs0q1/ZYjtClXhWDSQ==', 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Mobile], [Password], [RoleId], [IsActive]) VALUES (9, N'Nikola Mitic', N'mitic.nikolca94@gmail.com', NULL, N'GQ8rBO3eM1qr5WtRy5sw2SoNIe5Rg03OX5zX3z+CdvvPTF70BY/O0aZ2vwau+yhT59NwoQ4JK64YjfXqbatfLQ==', 3, 1)
INSERT [dbo].[Employee] ([EmployeeId], [Name], [Email], [Mobile], [Password], [RoleId], [IsActive]) VALUES (10, N'Masa', N'masadordevic@gmail.com', NULL, N'KtjNkbj46j6CrsdAzldQyLAk3gNXaB3BLd4TVmwp1rfebr3EQlvetoU/vpNSl0A0Dx32FJyOJ2jahM1gvn7RUQ==', 1, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Meal] ON 

INSERT [dbo].[Meal] ([MealId], [Title], [Description], [Image], [Price], [Quantity], [UnitId], [CategoryId]) VALUES (1, N'Gurmanska pljeskavica', N'Pljeksavica sa komadicima kackavalja', NULL, 250, 300, 1, 7)
INSERT [dbo].[Meal] ([MealId], [Title], [Description], [Image], [Price], [Quantity], [UnitId], [CategoryId]) VALUES (2, N'Lazanja', N'Nema.', NULL, 300, 300, 1, 7)
SET IDENTITY_INSERT [dbo].[Meal] OFF
SET IDENTITY_INSERT [dbo].[Rating] ON 

INSERT [dbo].[Rating] ([RatingId], [Comment], [Rating], [Date], [EmployeeId], [MealId]) VALUES (1, NULL, 5, CAST(N'2016-09-14 11:48:51.697' AS DateTime), 10, 1)
INSERT [dbo].[Rating] ([RatingId], [Comment], [Rating], [Date], [EmployeeId], [MealId]) VALUES (2, NULL, 1, CAST(N'2016-09-14 12:02:39.680' AS DateTime), 10, 2)
SET IDENTITY_INSERT [dbo].[Rating] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (2, N'User')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (3, N'Client')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitId], [Name]) VALUES (1, N'grams')
INSERT [dbo].[Unit] ([UnitId], [Name]) VALUES (2, N'mililiters')
INSERT [dbo].[Unit] ([UnitId], [Name]) VALUES (3, N'piece')
SET IDENTITY_INSERT [dbo].[Unit] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Employee]    Script Date: 14-Sep-16 12:14:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Employee] ON [dbo].[Employee]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_Category]
GO
ALTER TABLE [dbo].[Meal]  WITH CHECK ADD  CONSTRAINT [FK_Meal_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[Meal] CHECK CONSTRAINT [FK_Meal_Unit]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Employee]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Meal] FOREIGN KEY([MealId])
REFERENCES [dbo].[Meal] ([MealId])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Meal]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Employee]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Meal] FOREIGN KEY([MealId])
REFERENCES [dbo].[Meal] ([MealId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Meal]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Permission] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permission] ([PermissionId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Permission]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Role]
GO
USE [master]
GO
ALTER DATABASE [CraftedFood] SET  READ_WRITE 
GO
