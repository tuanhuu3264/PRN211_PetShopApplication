USE [master]
GO
/****** Object:  Database [PetShopp]    Script Date: 11/6/2021 9:53:22 PM ******/
CREATE DATABASE [PetShopp]
GO 
USE PetShopp
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
	)
GO
/****** Object:  Table [dbo].[CustomerTbl]    Script Date: 11/6/2021 9:53:23 PM ******/
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) PrIMARY KEY,
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](50) NULL

)
GO
/****** Object:  Table [dbo].[BillTbl]    Script Date: 11/6/2021 9:53:23 PM ******/

CREATE TABLE [dbo].[Bill](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Date] [date] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[Total] [Money] NULL,
	CONSTRAINT [FK_Bill_Customer] Foreign key(CustomerId) References Customer(Id),
	COnstraint [FK_Bill_Employee] foreign key(EmployeeId) References Employee(Id)
	)


/****** Object:  Table [dbo].[ProductTbl]    Script Date: 11/6/2021 9:53:23 PM ******/
GO
CREATE TABLE [dbo].[Category] (
    [Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NOT NULL
);
GO 
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
	[CategoryId] [int] foreign key references Category(Id),
	[Quantity] [int] NOT NULL,
	[Price] [Money] NOT NULL,
	[Description] [varchar](max) 
)
GO
-- Employee table
INSERT INTO [dbo].[Employee] ([Name], [Address], [Phone], [Password])
VALUES
    (N'Đình Tuấn', N'123 Main St', N'0983147689', N'123456'),
    (N'Cảnh Tuấn', N'456 Oak St', N'0905164896', N'123456')
    -- Add more records as needed

-- Customer table
INSERT INTO [Customer] ([Name], [Address], [Phone])
VALUES
    (N'Customer1', N'Address1', N'0987111321'),
    (N'Customer2', N'Address2', N'0365223544')
    -- Add more records as needed

-- Category table 
INSERT INTO [dbo].Category([Name])
VALUES ('Dog'), 
 ('Cat'),
 ( 'Food for dog'),
 (' Food for cat')
-- Product table
INSERT INTO [dbo].[Product] ([Name], [CategoryId], [Quantity], [Price], [Description])
VALUES
    (N'Product1', 1, 10, 2000000, N'Description1'),
    (N'Product2', 2, 65, 1000000, N'Description2')
    -- Add more records as needed

-- Bill table
INSERT INTO [dbo].[Bill] ([Date], [CustomerId], [EmployeeId], [Total])
VALUES
    (CAST('2021-11-06' AS Date), 1, 1, 1500000),
    (CAST('2021-11-07' AS Date), 2, 2, 1000000)

Create table Bill_Detail (
BillId int foreign key references Bill(Id),
ProductId int foreign key references Product(Id),
Quantity int, 
Price Money,
Total Money
Constraint PK_Bill_Detail Primary key (BillId,ProductId)
);