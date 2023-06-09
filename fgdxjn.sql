USE [master]
GO
/****** Object:  Database [Chancellery]    Script Date: 10.04.2023 18:40:33 ******/
CREATE DATABASE [Chancellery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chancellery', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Chancellery.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chancellery_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Chancellery_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chancellery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chancellery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chancellery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chancellery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chancellery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chancellery] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chancellery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chancellery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chancellery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chancellery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chancellery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chancellery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chancellery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chancellery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chancellery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chancellery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chancellery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chancellery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chancellery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chancellery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chancellery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chancellery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chancellery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chancellery] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chancellery] SET  MULTI_USER 
GO
ALTER DATABASE [Chancellery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chancellery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chancellery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chancellery] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chancellery] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chancellery] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chancellery] SET QUERY_STORE = ON
GO
ALTER DATABASE [Chancellery] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Chancellery]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID_Category] [int] NOT NULL,
	[Category] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaxDiscount]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaxDiscount](
	[MaxDiscount] [decimal](9, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaxDiscount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_Product] [int] NOT NULL,
	[Articul] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Unit] [varchar](10) NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
	[MaxDiscount] [decimal](9, 2) NOT NULL,
	[Producter] [int] NOT NULL,
	[Supplier] [int] NOT NULL,
	[Category] [int] NOT NULL,
	[Discount] [decimal](9, 2) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[Description] [varchar](max) NULL,
	[Image] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producter]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producter](
	[ID_Producter] [int] NOT NULL,
	[Producter] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [int] NOT NULL,
	[Role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID_Supplier] [int] NOT NULL,
	[Supplier] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.04.2023 18:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID_User] [int] NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[FCs] [varchar](100) NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (1, N'Школьные пренадлежности')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (2, N'Школьные принадлежности')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (3, N'Для офиса')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (4, N'Бумага офисная')
INSERT [dbo].[Category] ([ID_Category], [Category]) VALUES (5, N'Тетради школьные')
GO
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(8.00 AS Decimal(9, 2)))
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(10.00 AS Decimal(9, 2)))
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(15.00 AS Decimal(9, 2)))
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(18.00 AS Decimal(9, 2)))
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(20.00 AS Decimal(9, 2)))
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(25.00 AS Decimal(9, 2)))
INSERT [dbo].[MaxDiscount] ([MaxDiscount]) VALUES (CAST(30.00 AS Decimal(9, 2)))
GO
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (1, N'А112Т4', N'Ручка шариковая', N'шт.', CAST(12.00 AS Decimal(9, 2)), CAST(30.00 AS Decimal(9, 2)), 2, 1, 5, CAST(2.30 AS Decimal(9, 2)), 6, N'Ручка шариковая с синими чернилами,толщина стержня 7 мм', N'/Image/А112Т4.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (2, N'A346R4', N'Ручка шариковая автоматическая', N'шт.', CAST(35.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 1, 5, CAST(0.00 AS Decimal(9, 2)), 23, N'Ручка шариковая автоматическая с синими чернилами, диаметр шарика 0,9 мм', N'/Image/A346R4.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (3, N'T564P5', N'Набор шариковых ручек одноразовых', N'уп.', CAST(50.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 1, 5, CAST(16.00 AS Decimal(9, 2)), 5, N'Набор шариковых ручек одноразовых Attache Economy Spinner 10 цветов (толщина линии 0.5 мм)', N'/Image/T564P5.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (4, N'B730E2', N'Ручка шариковая', N'шт.', CAST(41.00 AS Decimal(9, 2)), CAST(10.00 AS Decimal(9, 2)), 7, 1, 5, CAST(3.00 AS Decimal(9, 2)), 45, N'Ручка шариковая одноразовая автоматическая Unimax Fab GP синяя (толщина линии 0.5 мм)', N'/Image/B730E2.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (5, N'G278R6', N'Ручка шариковая', N'шт.', CAST(15.00 AS Decimal(9, 2)), CAST(30.00 AS Decimal(9, 2)), 2, 2, 3, CAST(7.00 AS Decimal(9, 2)), 23, N'Ручка шариковая FLEXOFFICE CANDEE 0,6 мм, синяя', N'/Image/G278R6.png')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (6, N'R259E6', N'Бумага офисная', N'уп.', CAST(299.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), 5, 2, 4, CAST(4.00 AS Decimal(9, 2)), 32, N'Бумага офисная Svetocopy NEW A4 80г 500л', N'/Image/R259E6.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (7, N'H452A3', N'Тетрадь', N'шт.', CAST(10.00 AS Decimal(9, 2)), CAST(8.00 AS Decimal(9, 2)), 2, 2, 5, CAST(3.00 AS Decimal(9, 2)), 25, N'Тетрадь, 24 листа, Зелёная обложка Hatber/Хатбер, офсет, клетка с полями', N'/Image/H452A3.png')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (8, N'A543T6', N'Ручка шариковая', N'шт.', CAST(13.00 AS Decimal(9, 2)), CAST(30.00 AS Decimal(9, 2)), 2, 2, 3, CAST(6.00 AS Decimal(9, 2)), 12, N'Ручка шариковая Erich Krause, R-301 ORANGE 0.7 Stick, синий', N'/Image/A543T6.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (9, N'F719R5', N'Папка-скоросшиватель', N'шт.', CAST(18.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 2, 3, CAST(3.00 AS Decimal(9, 2)), 8, N'Папка-скоросшиватель, А4 Hatber/Хатбер 140/180мкм АССОРТИ, пластиковая с перфорацией прозрачный верх', N'/Image/F719R5.jpg')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (10, N'D419T7', N'Клей-карандаш', N'шт.', CAST(61.00 AS Decimal(9, 2)), CAST(18.00 AS Decimal(9, 2)), 2, 2, 3, CAST(4.00 AS Decimal(9, 2)), 26, N'Клей-карандаш Erich Krause 15 гр.', N'/Image/D419T7.png')
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (11, N'N592T4', N'Стикеры', N'уп.', CAST(34.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 1, 3, CAST(2.00 AS Decimal(9, 2)), 17, N'Стикеры Attache 76x76 мм пастельные желтые (1 блок, 100 листов)', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (12, N'N459R6', N'Стикеры', N'уп.', CAST(194.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), 2, 1, 3, CAST(3.00 AS Decimal(9, 2)), 9, N'Стикеры Attache Selection 51х51 мм неоновые 5 цветов (1 блок, 250 листов)', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (13, N'S276E6', N'Скрепки', N'уп.', CAST(46.00 AS Decimal(9, 2)), CAST(30.00 AS Decimal(9, 2)), 8, 1, 3, CAST(2.00 AS Decimal(9, 2)), 14, N'Скрепки 1 металлические никелированные 33 мм (100 штук в упаковке)', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (14, N'S453G7', N'Скрепки', N'уп.', CAST(21.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 1, 3, CAST(4.00 AS Decimal(9, 2)), 20, N'Скрепки 28 мм Attache металлические (100 штук в упаковке)', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (15, N'J539R3', N'Кнопки', N'уп.', CAST(96.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 8, 1, 3, CAST(3.00 AS Decimal(9, 2)), 24, N'Кнопки канцелярские 1 металлические цветные (50 штук в упаковке)', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (16, N'Z539E3', N'Лента клейкая', N'шт.', CAST(16.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 2, 3, CAST(2.00 AS Decimal(9, 2)), 14, N'Лента клейкая 12мм*33м прозрачная, Hatber/Хатбер', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (17, N'A297U6', N'Ручка гелевая', N'шт.', CAST(52.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 2, 5, CAST(4.00 AS Decimal(9, 2)), 18, N'Ручка гелевая ErichKrause® G-Cube®, цвет чернил черный', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (18, N'A567R4', N'Ручка шариковая', N'шт.', CAST(64.00 AS Decimal(9, 2)), CAST(30.00 AS Decimal(9, 2)), 2, 2, 5, CAST(2.00 AS Decimal(9, 2)), 32, N'Шариковая ручка PILOT SuperGrip 0,7 мм синяя BPGP-10R-F-L', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (19, N'K932R4', N'Корректирующая лента', N'шт.', CAST(70.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), 2, 2, 3, CAST(3.00 AS Decimal(9, 2)), 16, N'Корректор лента 5мм*4м, блистер, GoodMark', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (20, N'K345R5', N'Корректирующая лента', N'шт.', CAST(87.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 1, 3, CAST(3.00 AS Decimal(9, 2)), 12, N'Корректирующая лента Attache Economy 5 мм x 5 м', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (21, N'K753R3', N'Корректирующая жидкость', N'шт.', CAST(50.00 AS Decimal(9, 2)), CAST(30.00 AS Decimal(9, 2)), 2, 1, 5, CAST(2.00 AS Decimal(9, 2)), 5, N'Корректирующая жидкость (штрих) Attache быстросохнущая 20 мл', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (22, N'S563T6', N'Степлер', N'шт.', CAST(231.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), 2, 1, 3, CAST(4.00 AS Decimal(9, 2)), 17, N'Степлер Attache 8215 до 25 листов черный', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (23, N'S425T6', N'Скобы', N'уп.', CAST(25.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 1, 3, CAST(2.00 AS Decimal(9, 2)), 16, N'Скобы для степлера №24/6 Attache оцинкованные (1000 штук в упаковке)', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (24, N'A340R5', N'Маркер', N'шт.', CAST(66.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 2, 3, CAST(4.00 AS Decimal(9, 2)), 27, N'Маркер перманентный GoodMark 2-х сторонний.для СD/DVD черный', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (25, N'A384T5', N'Тетрадь', N'уп.', CAST(87.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 2, 5, CAST(3.00 AS Decimal(9, 2)), 23, N'Тетрадь, 18 листов, А5 линейка Hatber/Хатбер Серия Зеленая 10шт в блистере', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (26, N'K502T9', N'Карандаш-корректор', N'шт.', CAST(70.00 AS Decimal(9, 2)), CAST(25.00 AS Decimal(9, 2)), 2, 2, 3, CAST(2.00 AS Decimal(9, 2)), 7, N'Карандаш-корректор GoodMark, морозостойкий, 8мл, металлический наконечник', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (27, N'S512T7', N'Скобы', N'уп.', CAST(25.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 2, 3, CAST(3.00 AS Decimal(9, 2)), 32, N'Скобы №10 1000шт, к/к, GoodMark', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (28, N'D367R4', N'Клей ПВА', N'шт.', CAST(26.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 2, 2, 5, CAST(4.00 AS Decimal(9, 2)), 16, N'Клей ПВА 85г Hatber/Хатбер', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (29, N'M892R4', N'Ножницы', N'шт.', CAST(209.00 AS Decimal(9, 2)), CAST(15.00 AS Decimal(9, 2)), 2, 1, 5, CAST(5.00 AS Decimal(9, 2)), 13, N'Ножницы 195 мм Attache с пластиковыми прорезиненными анатомическими ручками бирюзового/черного цвета', NULL)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [Unit], [Price], [MaxDiscount], [Producter], [Supplier], [Category], [Discount], [QuantityInStock], [Description], [Image]) VALUES (30, N'Z390R4', N'Лента клейкая', N'шт.', CAST(195.00 AS Decimal(9, 2)), CAST(20.00 AS Decimal(9, 2)), 8, 1, 3, CAST(2.00 AS Decimal(9, 2)), 9, N'Клейкая лента упаковочная 1 50 мм x 100 м 50 мкм прозрачная', NULL)
GO
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (1, N'Pilot')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (2, N'Attache')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (3, N'Unimax')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (4, N'FLEXOFFICE CANDEE')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (5, N'Svetocopy')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (6, N'Hatber')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (7, N'Erich Krause')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (8, N'Комус')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (9, N'GoodMark')
INSERT [dbo].[Producter] ([ID_Producter], [Producter]) VALUES (10, N' GoodMark')
GO
INSERT [dbo].[Role] ([ID_Role], [Role]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([ID_Role], [Role]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([ID_Role], [Role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Supplier] ([ID_Supplier], [Supplier]) VALUES (1, N'Комус')
INSERT [dbo].[Supplier] ([ID_Supplier], [Supplier]) VALUES (2, N'Буквоед')
GO
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (1, N'Никифоров ', N'Всеволод Иванович', N'loginDEjrm2018', N'Cpb+Im', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (2, N'Воронов ', N'Донат Никитевич', N'loginDEpxl2018', N'P6h4Jq', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (3, N'Игнатьева ', N'Евгения Валентиновна', N'loginDEwgk2018', N'&mfI9l', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (4, N'Буров ', N'Федот Егорович', N'loginDEpou2018', N'gX3f5Z', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (5, N'Иван ', N'Семёновна', N'loginDEjwl2018', N'D4ZYHt', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (6, N'Денисов ', N'Дамир Филатович', N'loginDEabf2018', N'*Tasm+', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (7, N'Ершов ', N'Максим Геласьевич', N'loginDEwjm2018', N'k}DJKo', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (8, N'Копылов ', N'Куприян Пётрович', N'loginDEjvz2018', N'&|bGTy', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (9, N'Носов ', N'Валерьян Дмитрьевич', N'loginDEuyv2018', N'8hhrZ}', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (10, N'Силин ', N'Игорь Авдеевич', N'loginDExdm2018', N'DH68L9', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (11, N'Дроздова ', N'Александра Мартыновна', N'loginDEeiv2018', N'H*BxlS', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (12, N'Дроздов ', N'Аркадий Геласьевич', N'loginDEfuc2018', N'VuM+QT', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (13, N'Боброва ', N'Варвара Евсеевна', N'loginDEoot2018', N'usi{aT', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (14, N'Чернова ', N'Агата Данииловна', N'loginDElhk2018', N'Okk0jY', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (15, N'Лыткина ', N'Ульяна Станиславовна', N'loginDEazg2018', N's3bb|V', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (16, N'Лаврентьев ', N'Леонид Игнатьевич', N'loginDEaba2018', N'#ИМЯ?', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (17, N'Кулаков ', N'Юрий Владленович', N'loginDEtco2018', N'tTKDJB', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (18, N'Соловьёв ', N'Андрей Александрович', N'loginDEsyq2018', N'2QbpBN', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (19, N'Корнилова ', N'Марфа Макаровна', N'loginDEpxi2018', N'+5X&hy', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (20, N'Белоусова ', N'Любовь Георгьевна', N'loginDEicr2018', N'3+|Sn{', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (21, N'Анисимов ', N'Никита Гордеевич', N'loginDEcui2018', N'Zi1Tth', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (22, N'Стрелкова ', N'Фаина Федосеевна', N'loginDEpxc2018', N'G+nFsv', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (23, N'Осипов ', N'Евгений Иванович', N'loginDEqrd2018', N'sApUbt', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (24, N'Владимирова ', N'Иванна Павловна', N'loginDEsso2018', N'#ИМЯ?', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (25, N'Кудрявцева ', N'Жанна Демьяновна', N'loginDErsy2018', N'{Aa6nS', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (26, N'Матвиенко ', N'Яков Брониславович', N'loginDEvpz2018', N'mS0UxK', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (27, N'Селезнёв ', N'Егор Артёмович', N'loginDEfog2018', N'glICay', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (28, N'Брагин ', N'Куприян Митрофанович', N'loginDEpii2018', N'Ob}RZB', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (29, N'Гордеев ', N'Виктор Эдуардович', N'loginDEhyk2018', N'*gN}Tc', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (30, N'Мартынов ', N'Онисим Брониславович', N'loginDEdxi2018', N'ywLUbA', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (31, N'Никонова ', N'Евгения Павловна', N'loginDEzro2018', N'B24s6o', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (32, N'Полякова ', N'Анна Денисовна', N'loginDEuxg2018', N'K8jui7', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (33, N'Макарова ', N'Пелагея Антониновна', N'loginDEllw2018', N'jNtNUr', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (34, N'Андреева ', N'Анна Вячеславовна', N'loginDEddg2018', N'gGGhvD', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (35, N'Кудрявцева ', N'Кира Ефимовна', N'loginDEpdz2018', N'#ИМЯ?', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (36, N'Шилова ', N'Кира Егоровна', N'loginDEyiw2018', N'cnj3QR', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (37, N'Ситников ', N'Игорь Борисович', N'loginDEqup2018', N'95AU|R', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (38, N'Русаков ', N'Борис Христофорович', N'loginDExil2018', N'w+++Ht', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (39, N'Капустина ', N'Ульяна Игоревна', N'loginDEkuv2018', N'Ade++|', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (40, N'Беляков ', N'Семён Германнович', N'loginDEmox2018', N'Je}9e7', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (41, N'Гурьев ', N'Ириней Игнатьевич', N'loginDEvug2018', N'lEa{Cn', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (42, N'Мишин ', N'Христофор Леонидович', N'loginDEzre2018', N'N*VX+G', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (43, N'Лазарева ', N'Антонина Христофоровна', N'loginDEbes2018', N'NaVtyH', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (44, N'Маркова ', N'Ираида Сергеевна', N'loginDEkfg2018', N'r1060q', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (45, N'Носкова ', N'Пелагея Валерьевна', N'loginDEyek2018', N'KY2BL4', 1)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (46, N'Баранов ', N'Станислав Дмитрьевич', N'loginDEloq2018', N'NZV5WR', 2)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (47, N'Ефремов ', N'Демьян Артёмович', N'loginDEjfb2018', N'TNT+}h', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (48, N'Константинов ', N'Всеволод Мэлсович', N'loginDEueq2018', N'GqAUZ6', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (49, N'Ситникова ', N'Ираида Андреевна', N'loginDEpqz2018', N'F0Bp7F', 3)
INSERT [dbo].[User] ([ID_User], [Surname], [FCs], [Login], [Password], [Role]) VALUES (50, N'Матвеев ', N'Кондрат Иванович', N'loginDEovk2018', N'JyJM{A', 2)
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([ID_Category])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_MaxDiscount] FOREIGN KEY([MaxDiscount])
REFERENCES [dbo].[MaxDiscount] ([MaxDiscount])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_MaxDiscount]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producter] FOREIGN KEY([Producter])
REFERENCES [dbo].[Producter] ([ID_Producter])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producter]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Supplier] ([ID_Supplier])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Chancellery] SET  READ_WRITE 
GO
