USE [master]
GO
/****** Object:  Database [company sales]    Script Date: 6/3/2022 3:28:36 PM ******/
CREATE DATABASE [company sales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'company sales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\company sales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'company sales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\company sales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [company sales] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [company sales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [company sales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [company sales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [company sales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [company sales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [company sales] SET ARITHABORT OFF 
GO
ALTER DATABASE [company sales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [company sales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [company sales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [company sales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [company sales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [company sales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [company sales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [company sales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [company sales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [company sales] SET  DISABLE_BROKER 
GO
ALTER DATABASE [company sales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [company sales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [company sales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [company sales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [company sales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [company sales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [company sales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [company sales] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [company sales] SET  MULTI_USER 
GO
ALTER DATABASE [company sales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [company sales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [company sales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [company sales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [company sales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [company sales] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [company sales] SET QUERY_STORE = OFF
GO
USE [company sales]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] NOT NULL,
	[phone_no] [int] NULL,
	[E_MAIL] [varchar](25) NULL,
	[int_wep] [varchar](25) NULL,
	[c_name] [varchar](25) NULL,
	[street] [varchar](25) NULL,
	[city] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items](
	[items_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[measuring unit] [varchar](15) NOT NULL,
	[unit price] [money] NOT NULL,
 CONSTRAINT [item_id] PRIMARY KEY CLUSTERED 
(
	[items_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marketing]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marketing](
	[id] [int] NOT NULL,
	[items_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[phone]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phone](
	[supplier_id] [int] NOT NULL,
	[s_phone] [varchar](15) NOT NULL,
	[sale_rep_id] [int] NOT NULL,
	[sale_rep_phone] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pruchases]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruchases](
	[pruchases_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[invoice_id] [int] NOT NULL,
	[items_id] [int] NOT NULL,
 CONSTRAINT [prichases_id] PRIMARY KEY CLUSTERED 
(
	[pruchases_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pruchases_invoices]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pruchases_invoices](
	[invoice_id] [int] NOT NULL,
	[invoice type] [varchar](50) NOT NULL,
	[suppliers discounts] [int] NULL,
	[date] [varchar](50) NULL,
	[notes] [varchar](50) NULL,
 CONSTRAINT [invice_id] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[records]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[records](
	[invoice_id] [int] NOT NULL,
	[sales_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[sales_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[invoice_id] [int] NULL,
	[items_id] [int] NULL,
 CONSTRAINT [sales_id_pk] PRIMARY KEY CLUSTERED 
(
	[sales_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_invoices]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_invoices](
	[invoice_id] [int] NOT NULL,
	[inoice_type] [nchar](10) NULL,
	[discounts] [nchar](10) NULL,
	[date] [nchar](10) NULL,
	[notes] [nchar](10) NULL,
	[id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
 CONSTRAINT [invice_id_pk] PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales_representatives]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales_representatives](
	[id] [int] NOT NULL,
	[name] [varchar](15) NULL,
	[work hours] [int] NULL,
 CONSTRAINT [id_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[storage]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storage](
	[pruchases_id] [int] NOT NULL,
	[stores_id] [int] NOT NULL,
 CONSTRAINT [store_id] PRIMARY KEY CLUSTERED 
(
	[stores_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[stores_id] [int] NOT NULL,
	[s_address] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[stores_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[suppliers_id] [int] NOT NULL,
	[internet website] [nchar](10) NULL,
	[e-mail] [nchar](10) NULL,
	[street] [nchar](10) NULL,
	[city] [nchar](10) NULL,
 CONSTRAINT [suppliers_id] PRIMARY KEY CLUSTERED 
(
	[suppliers_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[troped]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[troped](
	[pruchases_id] [int] NOT NULL,
	[suppliers_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[withdrawal]    Script Date: 6/3/2022 3:28:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[withdrawal](
	[id] [int] NOT NULL,
	[stores_id] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[customers] ([customer_id], [phone_no], [E_MAIL], [int_wep], [c_name], [street], [city]) VALUES (1234, 1065850173, N'eslam@gmail.com', N'www.eslam.net', N'eslam', N'elahrar', N'zagazik')
INSERT [dbo].[customers] ([customer_id], [phone_no], [E_MAIL], [int_wep], [c_name], [street], [city]) VALUES (1235, 1115716359, N'mohamed@gmail.com', N'www.mohamed.com', N'mohamed', N'talaat harb', N'cairo')
INSERT [dbo].[customers] ([customer_id], [phone_no], [E_MAIL], [int_wep], [c_name], [street], [city]) VALUES (1333, 101516266, N'sayed@gmail.com', N'sayed@yahoo.com', N'sayed', N'ekhoria', N'cairo')
GO
INSERT [dbo].[items] ([items_id], [name], [measuring unit], [unit price]) VALUES (2132, N'chiken', N'kg', 50.0000)
INSERT [dbo].[items] ([items_id], [name], [measuring unit], [unit price]) VALUES (2323, N'meet', N'kg', 150.0000)
INSERT [dbo].[items] ([items_id], [name], [measuring unit], [unit price]) VALUES (2456, N'fish', N'kg', 40.0000)
GO
INSERT [dbo].[pruchases] ([pruchases_id], [quantity], [invoice_id], [items_id]) VALUES (66677, 10, 1234, 2132)
GO
INSERT [dbo].[pruchases_invoices] ([invoice_id], [invoice type], [suppliers discounts], [date], [notes]) VALUES (1234, N'meet', 4444, N'12/5/2022', NULL)
INSERT [dbo].[pruchases_invoices] ([invoice_id], [invoice type], [suppliers discounts], [date], [notes]) VALUES (2323, N'fish', 6666, N'13/5/2022', NULL)
INSERT [dbo].[pruchases_invoices] ([invoice_id], [invoice type], [suppliers discounts], [date], [notes]) VALUES (2456, N'c', NULL, NULL, NULL)
GO
INSERT [dbo].[suppliers] ([suppliers_id], [internet website], [e-mail], [street], [city]) VALUES (4444, NULL, NULL, NULL, NULL)
INSERT [dbo].[suppliers] ([suppliers_id], [internet website], [e-mail], [street], [city]) VALUES (6666, NULL, NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[marketing]  WITH CHECK ADD  CONSTRAINT [id_fk] FOREIGN KEY([id])
REFERENCES [dbo].[sales_representatives] ([id])
GO
ALTER TABLE [dbo].[marketing] CHECK CONSTRAINT [id_fk]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [sale_rep_id_fk] FOREIGN KEY([sale_rep_id])
REFERENCES [dbo].[sales_representatives] ([id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [sale_rep_id_fk]
GO
ALTER TABLE [dbo].[phone]  WITH CHECK ADD  CONSTRAINT [supplier_id_fk] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[suppliers] ([suppliers_id])
GO
ALTER TABLE [dbo].[phone] CHECK CONSTRAINT [supplier_id_fk]
GO
ALTER TABLE [dbo].[pruchases]  WITH CHECK ADD  CONSTRAINT [invoice_id_fk] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[pruchases_invoices] ([invoice_id])
GO
ALTER TABLE [dbo].[pruchases] CHECK CONSTRAINT [invoice_id_fk]
GO
ALTER TABLE [dbo].[pruchases]  WITH CHECK ADD  CONSTRAINT [item_id_fk] FOREIGN KEY([items_id])
REFERENCES [dbo].[items] ([items_id])
GO
ALTER TABLE [dbo].[pruchases] CHECK CONSTRAINT [item_id_fk]
GO
ALTER TABLE [dbo].[records]  WITH CHECK ADD  CONSTRAINT [invoice_id] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[sales_invoices] ([invoice_id])
GO
ALTER TABLE [dbo].[records] CHECK CONSTRAINT [invoice_id]
GO
ALTER TABLE [dbo].[records]  WITH CHECK ADD  CONSTRAINT [sales_id] FOREIGN KEY([sales_id])
REFERENCES [dbo].[sales] ([sales_id])
GO
ALTER TABLE [dbo].[records] CHECK CONSTRAINT [sales_id]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [invice_no_fk] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[sales_invoices] ([invoice_id])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [invice_no_fk]
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [items_no_fk] FOREIGN KEY([items_id])
REFERENCES [dbo].[items] ([items_id])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [items_no_fk]
GO
ALTER TABLE [dbo].[sales_invoices]  WITH CHECK ADD  CONSTRAINT [customer_id] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[sales_invoices] CHECK CONSTRAINT [customer_id]
GO
ALTER TABLE [dbo].[sales_invoices]  WITH CHECK ADD  CONSTRAINT [sales_reprecintative_id] FOREIGN KEY([id])
REFERENCES [dbo].[sales_representatives] ([id])
GO
ALTER TABLE [dbo].[sales_invoices] CHECK CONSTRAINT [sales_reprecintative_id]
GO
ALTER TABLE [dbo].[storage]  WITH CHECK ADD  CONSTRAINT [purchases_id_fk] FOREIGN KEY([pruchases_id])
REFERENCES [dbo].[stores] ([stores_id])
GO
ALTER TABLE [dbo].[storage] CHECK CONSTRAINT [purchases_id_fk]
GO
ALTER TABLE [dbo].[storage]  WITH CHECK ADD  CONSTRAINT [store_id_fk] FOREIGN KEY([stores_id])
REFERENCES [dbo].[stores] ([stores_id])
GO
ALTER TABLE [dbo].[storage] CHECK CONSTRAINT [store_id_fk]
GO
ALTER TABLE [dbo].[withdrawal]  WITH CHECK ADD  CONSTRAINT [s_id] FOREIGN KEY([id])
REFERENCES [dbo].[sales_representatives] ([id])
GO
ALTER TABLE [dbo].[withdrawal] CHECK CONSTRAINT [s_id]
GO
ALTER TABLE [dbo].[withdrawal]  WITH CHECK ADD  CONSTRAINT [store_no_fk] FOREIGN KEY([stores_id])
REFERENCES [dbo].[stores] ([stores_id])
GO
ALTER TABLE [dbo].[withdrawal] CHECK CONSTRAINT [store_no_fk]
GO
USE [master]
GO
ALTER DATABASE [company sales] SET  READ_WRITE 
GO
