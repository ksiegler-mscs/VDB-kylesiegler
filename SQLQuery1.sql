USE [master]
GO
/****** Object:  Database [PropertyManager]    Script Date: 9/25/2021 4:57:49 PM ******/
CREATE DATABASE [PropertyManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyManager] SET RECOVERY FULL 
GO
ALTER DATABASE [PropertyManager] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PropertyManager] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PropertyManager', N'ON'
GO
ALTER DATABASE [PropertyManager] SET QUERY_STORE = OFF
GO
USE [PropertyManager]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street_1] [nchar](50) NOT NULL,
	[Street_2] [nchar](50) NULL,
	[City] [nchar](30) NOT NULL,
	[State] [nchar](10) NOT NULL,
	[Zip] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[Apartment_ID] [int] IDENTITY(1,1) NOT NULL,
	[Apt_Number] [nchar](10) NOT NULL,
	[Rent] [money] NOT NULL,
	[Beds] [int] NULL,
	[Baths] [int] NOT NULL,
	[Sq_Ft] [int] NOT NULL,
	[Building_ID] [int] NOT NULL,
	[Tenant_ID] [int] NULL,
	[Manager_ID] [int] NOT NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[Apartment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apartment_old]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment_old](
	[AptID] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[AptNumber] [nvarchar](5) NOT NULL,
	[SqFt] [int] NOT NULL,
	[Bathrooms] [int] NOT NULL,
	[Bedrooms] [int] NULL,
	[Rent] [smallmoney] NOT NULL,
	[TenantName] [nvarchar](50) NULL,
	[AdminName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[Building_ID] [int] IDENTITY(1,1) NOT NULL,
	[Building_Name] [nchar](50) NOT NULL,
	[Address_ID] [int] NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Building_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [date] NOT NULL,
	[DueDate] [date] NOT NULL,
	[Apartment_ID] [int] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[LineItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Invoice_ID] [int] NOT NULL,
 CONSTRAINT [PK_LineItem] PRIMARY KEY CLUSTERED 
(
	[LineItem_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Person_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](30) NOT NULL,
	[Last_Name] [nchar](30) NOT NULL,
	[Middle_Initial] [nchar](1) NULL,
	[Address_ID] [int] NULL,
	[Phone_Number] [nchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Person_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](30) NOT NULL,
	[Description] [nchar](100) NOT NULL,
	[Price] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 9/25/2021 4:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[Receipt_ID] [int] IDENTITY(1,1) NOT NULL,
	[Invoice_ID] [int] NOT NULL,
	[ReceiptDate] [date] NOT NULL,
	[ReceiptAmount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[Receipt_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (1, N'123 Main St                                       ', NULL, N'Winona                        ', N'MN        ', 55987)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (2, N'4123 Elm St                                       ', NULL, N'Winona                        ', N'MN        ', 55987)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (3, N'345 Mill St                                       ', NULL, N'Red Wing                      ', N'MN        ', 55432)
INSERT [dbo].[Address] ([Address_ID], [Street_1], [Street_2], [City], [State], [Zip]) VALUES (4, N'65 Loop                                           ', N'Hwy 22                                            ', N'Austin                        ', N'TX        ', 84444)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment] ON 

INSERT [dbo].[Apartment] ([Apartment_ID], [Apt_Number], [Rent], [Beds], [Baths], [Sq_Ft], [Building_ID], [Tenant_ID], [Manager_ID]) VALUES (1, N'101       ', 500.0000, 1, 1, 500, 1, 2, 3)
INSERT [dbo].[Apartment] ([Apartment_ID], [Apt_Number], [Rent], [Beds], [Baths], [Sq_Ft], [Building_ID], [Tenant_ID], [Manager_ID]) VALUES (2, N'102       ', 600.0000, 1, 1, 650, 1, 4, 3)
INSERT [dbo].[Apartment] ([Apartment_ID], [Apt_Number], [Rent], [Beds], [Baths], [Sq_Ft], [Building_ID], [Tenant_ID], [Manager_ID]) VALUES (3, N'202b      ', 750.0000, 2, 2, 1200, 2, 3, 1)
INSERT [dbo].[Apartment] ([Apartment_ID], [Apt_Number], [Rent], [Beds], [Baths], [Sq_Ft], [Building_ID], [Tenant_ID], [Manager_ID]) VALUES (4, N'303       ', 780.0000, 2, 1, 1000, 2, NULL, 1)
INSERT [dbo].[Apartment] ([Apartment_ID], [Apt_Number], [Rent], [Beds], [Baths], [Sq_Ft], [Building_ID], [Tenant_ID], [Manager_ID]) VALUES (5, N'401       ', 300.0000, NULL, 1, 300, 3, NULL, 1)
INSERT [dbo].[Apartment] ([Apartment_ID], [Apt_Number], [Rent], [Beds], [Baths], [Sq_Ft], [Building_ID], [Tenant_ID], [Manager_ID]) VALUES (7, N'444       ', 444.0000, 4, 4, 444, 4, NULL, 1)
SET IDENTITY_INSERT [dbo].[Apartment] OFF
GO
SET IDENTITY_INSERT [dbo].[Apartment_old] ON 

INSERT [dbo].[Apartment_old] ([AptID], [BuildingName], [Address], [AptNumber], [SqFt], [Bathrooms], [Bedrooms], [Rent], [TenantName], [AdminName]) VALUES (1, N'Lake View Apartments', N'123 Main St', N'101', 550, 1, 1, 750.0000, N'Joe Doe', N'Mark D')
INSERT [dbo].[Apartment_old] ([AptID], [BuildingName], [Address], [AptNumber], [SqFt], [Bathrooms], [Bedrooms], [Rent], [TenantName], [AdminName]) VALUES (2, N'Bluff View', N'234 Broadway', N'1a', 500, 1, NULL, 600.0000, N'Sally D', N'Mark D')
INSERT [dbo].[Apartment_old] ([AptID], [BuildingName], [Address], [AptNumber], [SqFt], [Bathrooms], [Bedrooms], [Rent], [TenantName], [AdminName]) VALUES (3, N'Village Aptartments', N'333 Third', N'201', 150, 1, NULL, 300.0000, N'George S', N'Bill S')
INSERT [dbo].[Apartment_old] ([AptID], [BuildingName], [Address], [AptNumber], [SqFt], [Bathrooms], [Bedrooms], [Rent], [TenantName], [AdminName]) VALUES (4, N'Village Aptmnts', N'333 Third', N'202', 200, 1, 1, 400.0000, N'Jane D', N'Jim H')
INSERT [dbo].[Apartment_old] ([AptID], [BuildingName], [Address], [AptNumber], [SqFt], [Bathrooms], [Bedrooms], [Rent], [TenantName], [AdminName]) VALUES (5, N'Lake View Apartments', N'123 Main Street', N'102', 550, 1, 1, 750.0000, N'Charlie', N'Janet J')
SET IDENTITY_INSERT [dbo].[Apartment_old] OFF
GO
SET IDENTITY_INSERT [dbo].[Building] ON 

INSERT [dbo].[Building] ([Building_ID], [Building_Name], [Address_ID]) VALUES (1, N'Terrace Apartments                                ', 1)
INSERT [dbo].[Building] ([Building_ID], [Building_Name], [Address_ID]) VALUES (2, N'Bluff View Apartments                             ', 2)
INSERT [dbo].[Building] ([Building_ID], [Building_Name], [Address_ID]) VALUES (3, N'Roach Motel                                       ', 3)
INSERT [dbo].[Building] ([Building_ID], [Building_Name], [Address_ID]) VALUES (4, N'TraDiDa Estates                                   ', 4)
SET IDENTITY_INSERT [dbo].[Building] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceID], [InvoiceDate], [DueDate], [Apartment_ID]) VALUES (1, CAST(N'2021-09-15' AS Date), CAST(N'2021-09-30' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[LineItem] ON 

INSERT [dbo].[LineItem] ([LineItem_ID], [Product_ID], [Qty], [Invoice_ID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[LineItem] ([LineItem_ID], [Product_ID], [Qty], [Invoice_ID]) VALUES (2, 2, 1, 1)
INSERT [dbo].[LineItem] ([LineItem_ID], [Product_ID], [Qty], [Invoice_ID]) VALUES (3, 3, 1, 1)
INSERT [dbo].[LineItem] ([LineItem_ID], [Product_ID], [Qty], [Invoice_ID]) VALUES (4, 5, 1, 1)
INSERT [dbo].[LineItem] ([LineItem_ID], [Product_ID], [Qty], [Invoice_ID]) VALUES (5, 6, 1, 1)
INSERT [dbo].[LineItem] ([LineItem_ID], [Product_ID], [Qty], [Invoice_ID]) VALUES (6, 7, 1, 1)
SET IDENTITY_INSERT [dbo].[LineItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Person_ID], [First_Name], [Last_Name], [Middle_Initial], [Address_ID], [Phone_Number]) VALUES (1, N'Mark                          ', N'Degallier                     ', N'J', 1, NULL)
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Last_Name], [Middle_Initial], [Address_ID], [Phone_Number]) VALUES (2, N'Joe                           ', N'Schmo                         ', NULL, 2, NULL)
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Last_Name], [Middle_Initial], [Address_ID], [Phone_Number]) VALUES (3, N'Sally                         ', N'Doe                           ', N'G', 3, NULL)
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Last_Name], [Middle_Initial], [Address_ID], [Phone_Number]) VALUES (4, N'George                        ', N'Castanza                      ', NULL, 4, NULL)
INSERT [dbo].[Person] ([Person_ID], [First_Name], [Last_Name], [Middle_Initial], [Address_ID], [Phone_Number]) VALUES (5, N'Billy                         ', N'Holiday                       ', NULL, 4, NULL)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (1, N'Electricity                   ', N'Electric Usage for 2 Bedroom Apt                                                                    ', 100.0000)
INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (2, N'Gas                           ', N'Heat / Hot water for 2 BR                                                                           ', 50.0000)
INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (3, N'Garbage                       ', N'Flat fee Garbage                                                                                    ', 10.0000)
INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (4, N'Parking                       ', N'1 Outdoor Stall                                                                                     ', 20.0000)
INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (5, N'Parking                       ', N'1 Garage Stall                                                                                      ', 50.0000)
INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (6, N'Rent                          ', N'2 BR, October 2021                                                                                  ', 500.0000)
INSERT [dbo].[Product] ([Product_ID], [Name], [Description], [Price]) VALUES (7, N'Internet                      ', N'100MB                                                                                               ', 60.0000)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([Receipt_ID], [Invoice_ID], [ReceiptDate], [ReceiptAmount]) VALUES (1, 1, CAST(N'2021-09-21' AS Date), 600.0000)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Building] FOREIGN KEY([Building_ID])
REFERENCES [dbo].[Building] ([Building_ID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Building]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Person] FOREIGN KEY([Tenant_ID])
REFERENCES [dbo].[Person] ([Person_ID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Person]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_Person1] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[Person] ([Person_ID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_Person1]
GO
ALTER TABLE [dbo].[Building]  WITH CHECK ADD  CONSTRAINT [FK_Building_Address] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Address] ([Address_ID])
GO
ALTER TABLE [dbo].[Building] CHECK CONSTRAINT [FK_Building_Address]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Apartment] FOREIGN KEY([Apartment_ID])
REFERENCES [dbo].[Apartment] ([Apartment_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Apartment]
GO
ALTER TABLE [dbo].[LineItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Invoice] FOREIGN KEY([Invoice_ID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[LineItem] CHECK CONSTRAINT [FK_LineItem_Invoice]
GO
ALTER TABLE [dbo].[LineItem]  WITH CHECK ADD  CONSTRAINT [FK_LineItem_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[LineItem] CHECK CONSTRAINT [FK_LineItem_Product]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([Address_ID])
REFERENCES [dbo].[Address] ([Address_ID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Invoice] FOREIGN KEY([Invoice_ID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Invoice]
GO
USE [master]
GO
ALTER DATABASE [PropertyManager] SET  READ_WRITE 
GO
