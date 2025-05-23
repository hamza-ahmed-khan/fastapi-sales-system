USE [Ecommerce_Task_Dev]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/14/2025 5:42:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[InStock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryHistory]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ChangeDate] [datetime] NULL,
	[ChangeType] [nvarchar](50) NULL,
	[StockBefore] [int] NULL,
	[StockAfter] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductDescription] [nvarchar](255) NULL,
	[CateID] [int] NULL,
	[VendorName] [nvarchar](50) NULL,
	[ProductPrice] [decimal](10, 2) NOT NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SoldDate] [datetime] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[TotalPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'Electronics')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'Sports')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'Arcade Games')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (4, N'Apple')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (5, N'Samsung')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (1, 1, 48)
INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (2, 2, 48)
INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (3, 6, 47)
INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (6, 5, 10)
INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (7, 4, 20)
INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (12, 10, 20)
INSERT [dbo].[Inventory] ([InventoryID], [ProductID], [InStock]) VALUES (15, 13, 19)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryHistory] ON 

INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (1, 6, CAST(N'2025-05-13T16:34:22.770' AS DateTime), N'Update', 40, 47)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (2, 9, CAST(N'2025-05-13T16:35:05.980' AS DateTime), N'Add', NULL, 10)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (3, 7, CAST(N'2025-05-13T16:35:31.560' AS DateTime), N'Add', NULL, 10)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (4, 5, CAST(N'2025-05-13T16:35:46.917' AS DateTime), N'Add', NULL, 10)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (5, 4, CAST(N'2025-05-13T16:38:39.567' AS DateTime), N'Add', 0, 10)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (6, 4, CAST(N'2025-05-13T16:38:48.547' AS DateTime), N'Update', 10, 20)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (11, 10, CAST(N'2025-05-14T16:39:39.810' AS DateTime), N'Add', 0, 20)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (14, 13, CAST(N'2025-05-14T16:43:15.067' AS DateTime), N'Add', 0, 17)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (15, 13, CAST(N'2025-05-14T16:43:25.777' AS DateTime), N'Update', 17, 20)
INSERT [dbo].[InventoryHistory] ([HistoryID], [ProductID], [ChangeDate], [ChangeType], [StockBefore], [StockAfter]) VALUES (17, 13, CAST(N'2025-05-14T16:54:44.160' AS DateTime), N'Remove', 20, 19)
SET IDENTITY_INSERT [dbo].[InventoryHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (1, N'HP Chrome Book', N'Core i7 11th Generation', 1, N'HP', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2025-05-12T15:02:58.680' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (2, N'Joggers', N'Comfortable sports shoes', 2, N'Addidas', CAST(150.00 AS Decimal(10, 2)), CAST(N'2025-05-12T15:02:58.680' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (3, N'iPhone 15', NULL, 4, N'Steve Jobs', CAST(700.00 AS Decimal(10, 2)), CAST(N'2024-02-12T15:02:58.680' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (4, N'S10 Lite', NULL, 5, N'Amazon', CAST(150.00 AS Decimal(10, 2)), CAST(N'2025-02-12T15:02:58.680' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (5, N'Fifa 19', NULL, 3, N'Sony', CAST(25.00 AS Decimal(10, 2)), CAST(N'2019-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (6, N'iPad 4', NULL, 4, N'Amazon', CAST(250.00 AS Decimal(10, 2)), CAST(N'2024-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (7, N'iPhone 15 Pro Max', N'Updated: Now with USB-C and better battery life', 4, N'Apple Inc.', CAST(1499.99 AS Decimal(10, 2)), CAST(N'2025-05-13T17:09:44.050' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (10, N'Cup', N'Coffee Cup Luxury', 4, N'Walmart', CAST(15.00 AS Decimal(10, 2)), CAST(N'2025-05-14T16:05:34.607' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [CateID], [VendorName], [ProductPrice], [CreatedDate]) VALUES (13, N'Air Conditioner', N'Heat and Cool both', 1, N'gree', CAST(120.00 AS Decimal(10, 2)), CAST(N'2025-05-14T16:37:40.223' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 

INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (2, 1, CAST(N'2025-05-12T15:46:45.257' AS DateTime), 5, CAST(2000.00 AS Decimal(10, 2)), CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (3, 2, CAST(N'2025-05-12T16:33:37.520' AS DateTime), 3, CAST(150.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (4, 2, CAST(N'2025-05-12T16:34:25.000' AS DateTime), 4, CAST(150.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (5, 1, CAST(N'2024-01-13T15:39:33.197' AS DateTime), 2, CAST(2000.00 AS Decimal(10, 2)), CAST(4000.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (6, 4, CAST(N'2025-05-13T15:39:18.993' AS DateTime), 3, CAST(150.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (7, 2, CAST(N'2023-05-13T15:39:33.197' AS DateTime), 3, CAST(150.00 AS Decimal(10, 2)), CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (8, 6, CAST(N'2024-05-13T15:39:33.197' AS DateTime), 2, CAST(250.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (9, 6, CAST(N'2025-05-13T16:22:27.573' AS DateTime), 2, CAST(250.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (10, 6, CAST(N'2025-05-13T16:23:25.183' AS DateTime), 8, CAST(250.00 AS Decimal(10, 2)), CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Sales] ([SaleID], [ProductID], [SoldDate], [Quantity], [Price], [TotalPrice]) VALUES (11, 13, CAST(N'2025-05-14T16:54:44.160' AS DateTime), 1, CAST(120.00 AS Decimal(10, 2)), CAST(120.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
ALTER TABLE [dbo].[InventoryHistory] ADD  DEFAULT (getdate()) FOR [ChangeDate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddProduct]
    @ProductID INT = NULL,  
    @ProductName NVARCHAR(100) = NULL,
    @ProductDescription NVARCHAR(100) = NULL,
    @ProductPrice MONEY = NULL,
    @VendorName NVARCHAR(100) = NULL,
    @CateID INT = NULL,
    @Action NVARCHAR(10),
    @Units INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'Add'
    BEGIN
        INSERT INTO Products (ProductName, ProductDescription, CateID , VendorName,ProductPrice, CreatedDate)
        VALUES (@ProductName, @ProductDescription, @CateID, @VendorName,@ProductPrice, GETDATE());
        SELECT 'Product added successfully.';
    END
    ELSE IF @Action = 'Update'
    BEGIN
        IF EXISTS (SELECT 1 FROM Products WHERE ProductID = @ProductID)
        BEGIN
            UPDATE Products
            SET ProductName = @ProductName,
				ProductDescription = @ProductDescription,
				CateID = @CateID,
				VendorName = @VendorName,
                ProductPrice = @ProductPrice,
                CreatedDate = GETDATE()
            WHERE ProductID = @ProductID;

            SELECT 'Product updated successfully.';
        END
        ELSE
        BEGIN
            SELECT 'Product not found for update.';
        END
    END
    ELSE
    BEGIN
        SELECT 'Invalid action name. Use "Add" or "Update".';
    END
END
GO
/****** Object:  StoredProcedure [dbo].[GetInvStatus]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetInvStatus]
    @LowStock INT = 10,
	@ProductID INT = NULL,
	@CateID INT = NULL
AS
BEGIN
    SELECT 
        P.ProductName,
        I.ProductID,
        I.InStock,
		C.CateName,
        CASE 
            WHEN I.InStock <= @LowStock THEN 'LOW STOCK'
            ELSE 'OK'
        END AS StockStatus
    FROM Inventory I
    JOIN Products P ON P.ProductID = I.ProductID
	JOIN Categories C ON C.CateID = P.CateID
	WHERE
	(@ProductID IS NULL OR P.ProductID = @ProductID)
    AND (@CateID IS NULL OR P.CateID = @CateID)
    ORDER BY I.InStock ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProducts] 
@ProductID INT = NULL,
@ProductName Nvarchar(100)= NULL,
@MinDate date = NULL,
@MaxDate date = NULL,
@CateID INT = NULL,
@VendorName Varchar(100) = NULL,
@ProductPrice Nvarchar(100) = NULL
AS
Declare @Price money,@TotalAmt money
BEGIN
	SELECT 
            P.ProductName AS 'Product Name',
			P.ProductDescription as 'Description',
			C.CateName as 'Category',
			P.VendorName as 'Vendor',
			P.ProductPrice as 'Price',
			P.CreatedDate as 'Launch Date',
			I.InStock as 'Units in Stocks'
        FROM Products P
        INNER JOIN Categories C ON P.CateID = C.CateID
		INNER JOIN Inventory I ON P.ProductID = I.ProductID
        WHERE (@ProductID IS NULL OR P.ProductID = @ProductID)
          AND (@CateID IS NULL OR P.CateID = @CateID)
		  AND (@ProductName IS NULL OR P.ProductName like '%' + @ProductName + '%')
		  AND (@VendorName IS NULL OR P.VendorName like '%' + @VendorName + '%')
		  AND (@MinDate IS NULL OR CAST(P.CreatedDate AS DATE) >= CAST(@MinDate AS DATE))
		  AND (@MaxDate IS NULL OR CAST(P.CreatedDate AS DATE) <= CAST(@MaxDate AS DATE))
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetRevenues]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create PROCEDURE [dbo].[GetRevenues]  
@ProductID INT = NULL,
@MinDate date = NULL,
@MaxDate date = NULL,
@CateID INT = NULL
AS
Declare @Price money,@TotalAmt money
BEGIN
	SELECT 
            SUM(S.TotalPrice) AS TotalRevenue
        FROM Sales S
        INNER JOIN Products P ON P.ProductID = S.ProductID
        WHERE (@ProductID IS NULL OR S.ProductID = @ProductID)
          AND (@CateID IS NULL OR P.CateID = @CateID)
		  AND (@MinDate IS NULL OR CAST(S.SoldDate AS DATE) >= CAST(@MinDate AS DATE))
		  AND (@MaxDate IS NULL OR CAST(S.SoldDate AS DATE) <= CAST(@MaxDate AS DATE))
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetSales]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetSales]  
@ProductID INT = NULL,
@MinDate date = NULL,
@MaxDate date = NULL,
@CateID INT = NULL
AS
Declare @Price money,@TotalAmt money
BEGIN
	Select P.ProductName as Name, C.CateName as Category, S.Quantity as Units, P.ProductPrice as 'Price/Unit', S.TotalPrice as Total
	from Products P inner join Sales S on P.ProductID = S.ProductID inner join Categories C on C.CateID = P.CateID
	WHERE
	(@ProductID IS NULL OR P.ProductID = @ProductID) 
	AND (@CateID IS NULL OR P.CateID = @CateID)
	AND (@MinDate IS NULL OR CAST(S.SoldDate AS DATE) >= CAST(@MinDate AS DATE))
	AND (@MaxDate IS NULL OR CAST(S.SoldDate AS DATE) <= CAST(@MaxDate AS DATE))
END
GO
/****** Object:  StoredProcedure [dbo].[OnSale]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OnSale]  
@ProductID int,
@Quantity int

AS
Declare @Price money,@TotalAmt money,@Stocks int
BEGIN
	SET NOCOUNT ON;
	Select @Price = ProductPrice from Products P where ProductID = @ProductID
	Select @TotalAmt = @Price * @Quantity
	Select @Stocks = Instock from Inventory where ProductID = @ProductID
	Update Inventory set InStock = @Stocks - @Quantity where ProductID = @ProductID
	Insert into InventoryHistory Values (@ProductID,GetDate(),'Remove',@Stocks,(Select Instock From Inventory where ProductID = @ProductID))
	Insert into Sales (ProductID,SoldDate, Quantity, Price,TotalPrice) values(@ProductID,GetDate(),@Quantity,@Price,@TotalAmt)
	Select 'Successful Sale'
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateInventory]    Script Date: 5/14/2025 5:42:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateInventory]
    @ProductID INT,
    @Stocks INT
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @CurrentStocks INT;
    SELECT @CurrentStocks = Instock FROM Inventory WHERE ProductID = @ProductID;

    IF @CurrentStocks IS NULL
    BEGIN
		Set @CurrentStocks = 0
        INSERT INTO Inventory (ProductID, Instock)
        VALUES (@ProductID, @Stocks);
		INSERT INTO InventoryHistory values (@ProductID,GetDate(),'Add',@CurrentStocks,@Stocks)

		SELECT 'INVENTORY ADDED';
    END
    ELSE
    BEGIN
        DECLARE @NewStock INT = @CurrentStocks + @Stocks;
        UPDATE Inventory
        SET Instock = @NewStock
        WHERE ProductID = @ProductID;
		INSERT INTO InventoryHistory values (@ProductID,GetDate(),'Update',@CurrentStocks,@NewStock)

		SELECT 'INVENTORY UPDATED';
    END
END
GO
