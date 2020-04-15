USE [master]
GO
/****** Object:  Database [ShopMobi]    Script Date: 15/04/2020 4:40:29 PM ******/
CREATE DATABASE [ShopMobi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopMobi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShopMobi.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopMobi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ShopMobi_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopMobi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopMobi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopMobi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopMobi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopMobi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopMobi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopMobi] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopMobi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopMobi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopMobi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopMobi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopMobi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopMobi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopMobi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopMobi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopMobi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopMobi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopMobi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopMobi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopMobi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopMobi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopMobi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopMobi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopMobi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopMobi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopMobi] SET  MULTI_USER 
GO
ALTER DATABASE [ShopMobi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopMobi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopMobi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopMobi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopMobi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShopMobi]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 15/04/2020 4:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NameID] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Account_CreatedDate]  DEFAULT (getdate()),
	[CreatedBy] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 15/04/2020 4:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[IDAccount] [varchar](50) NULL,
	[IDProduct] [bigint] NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Sell] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15/04/2020 4:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[CreateDate] [date] NULL CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/04/2020 4:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDTypeEvent] [bigint] NULL,
	[IDCategory] [bigint] NULL,
	[SKU] [varchar](20) NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Model] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Imge] [nvarchar](250) NULL,
	[Price] [decimal](18, 2) NULL,
	[Sell] [decimal](18, 2) NULL,
	[PricePromotion] [decimal](18, 2) NULL,
	[InducledVAT] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[QuantitySell] [int] NULL,
	[CreateDate] [date] NULL CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeEvent]    Script Date: 15/04/2020 4:40:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEvent](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [bit] NULL CONSTRAINT [DF_TypeEvent_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_TypeEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [NameID], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'nhut', N'123', NULL, NULL, NULL, NULL, CAST(N'2020-04-15 00:48:21.503' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [CreateDate]) VALUES (1, N'điện thoại', N'dien-thoai', CAST(N'2020-04-15' AS Date))
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (1, 4, 1, N'3333111', N'iPhone 11 Pro Max 64GB', N'iPhone-11-Pro-Max-64GB', N'iphone', N'Chiếc iPhone mạnh mẽ nhất, lớn nhất, thời lượng pin tốt nhất đã xuất hiện. iPhone 11 Pro Max chắc chắn là chiếc điện thoại mà ai cũng ao ước khi sở hữu những tính năng xuất sắc nhất, đặc biệt là camera và pin.', N'Areas\Client\statics\img\product_new\iphone01.png', CAST(33990000.00 AS Decimal(18, 2)), CAST(29100000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (2, 4, 1, N'3333112', N'iPhone 11 Pro Max 256GB', N'iPhone-11-Pro-Max-256GB', N'iphone', N'iPhone 11 Pro Max là sản phẩm dành cho những ai đang kiếm tìm sự hoàn hảo trong quá trình trải nghiệm điện thoại. Với chiếc iPhone này, Apple đã vươn tới đỉnh cao khi tinh chỉnh tối ưu mọi yếu tố bên trong như hiệu năng, camera, pin và thiết kế một cách tốt nhất.', N'Areas\Client\statics\img\product_new\iphone02.png', CAST(37990000.00 AS Decimal(18, 2)), CAST(33990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (3, 4, 1, N'3333113', N'iPhone 11 Pro Max 512GB', N'iPhone-11-Pro-Max-512GB', N'iphone', N'iPhone 11 Pro Max 512GB là phiên bản có bộ nhớ nhiều nhất, màn hình lớn nhất và thời lượng pin tuyệt vời nhất hiện nay. Bạn sẽ được cầm trên tay chiếc điện thoại đẳng cấp mà bất cứ ai cũng mơ ước.', N'Areas\Client\statics\img\product_new\iphone03.png', CAST(43990000.00 AS Decimal(18, 2)), CAST(40990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (4, 4, 1, N'3333114', N'iPhone 11 Pro 64GB', N'iPhone-11-Pro-64GB', N'iphone', N'Chào đón bạn đến với thế hệ iPhone Pro đầu tiên. iPhone 11 Pro sở hữu hệ thống 3 camera đẳng cấp, một bước nhảy vọt về thời lượng pin và con chip mới có hiệu năng mạnh mẽ chưa từng thấy. Mạnh mẽ, khác biệt và chuyên nghiệp, sản phẩm hoàn toàn xứng đáng với tên gọi.', N'Areas\Client\statics\img\product_new\iphone04.png', CAST(30990000.00 AS Decimal(18, 2)), CAST(28990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (5, 4, 1, N'3333115', N'iPhone 11 Pro 256GB', N'iPhone-11-Pro-256GB', N'iphone', N'Những cải tiến hiệu quả của Apple về khả năng chụp ảnh, trải nghiệm pin và sức mạnh hiệu năng biến iPhone 11 Pro thành công cụ hỗ trợ giải trí và phục vụ công việc xuất sắc. Trở thành chủ nhân của một chiếc iPhone 11 Pro 256GB, bạn chạm tay vào trải nghiệm chuyên nghiệp chưa từng có.', N'Areas\Client\statics\img\product_new\iphone05.png', CAST(34990000.00 AS Decimal(18, 2)), CAST(32990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (6, 4, 1, N'3333116', N'iPhone 11 Pro 512GB', N'iPhone-11-Pro-512GB', N'iphone', N'Phiên bản bộ nhớ lớn nhất iPhone 11 Pro 512GB cho bạn không gian lưu trữ thoải mái, tha hồ chụp ảnh và quay video bằng hệ thống 3 camera sau siêu đỉnh, thời lượng pin dài vô tận cùng sức mạnh khổng lồ từ bộ vi xử lý Apple A13 Bionic.', N'Areas\Client\statics\img\product_new\iphone06.png', CAST(40990000.00 AS Decimal(18, 2)), CAST(38990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (7, 4, 1, N'3333117', N'iPhone 11 64GB', N'iPhone 11 64GB', N'iphone', N'iPhone 11 với 6 phiên bản màu sắc, camera có khả năng chụp ảnh vượt trội, thời lượng pin cực dài và bộ vi xử lý mạnh nhất từ trước đến nay sẽ mang đến trải nghiệm tuyệt vời dành cho bạn.', N'Areas\Client\statics\img\product_new\iphone07.png', CAST(21990000.00 AS Decimal(18, 2)), CAST(20990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (8, 4, 1, N'3333118', N'iPhone 11 128GB', N'iPhone-11-128GB', N'iphone', N'Phiên bản iPhone 11 128GB được người dùng yêu thích bởi dung lượng bộ nhớ đủ dùng, camera kép cực đỉnh và những lựa chọn màu sắc vô cùng thời trang.', N'Areas\Client\statics\img\product_new\iphone08.png', CAST(23990000.00 AS Decimal(18, 2)), CAST(22990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (9, 4, 1, N'3333119', N'iPhone 11 256GB', N'iPhone-11-256GB', N'iphone', N'Với bộ nhớ trong lên tới 256GB, phiên bản iPhone 11 256GB thoải mái cho mọi nhu cầu của người dùng, đồng thời bạn sẽ được sở hữu chiếc điện thoai mạnh mẽ nhất, camera xuất sắc và nhiều lựa chọn màu hấp dẫn.', N'Areas\Client\statics\img\product_new\iphone09.png', CAST(25990000.00 AS Decimal(18, 2)), CAST(24990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (10, 4, 1, N'3333120', N'iPhone Xs Max 64GB', N'iPhone-Xs-Max-64GB', N'iphone', N'iPhone Xs Max 64GB là chiếc iPhone có màn hình lớn nhất từ trước đến nay, mang đến những trải nghiệm tuyệt vời về màn hình và thời lượng pin.', N'Areas\Client\statics\img\product_new\iphone10.png', CAST(26990000.00 AS Decimal(18, 2)), CAST(26590000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (11, 4, 1, N'3333121', N'iPhone Xs Max 256GB', N'iPhone-Xs-Max-256GB', N'iphone', N'iPhone Xs Max 256GB là chiếc iPhone có màn hình lớn nhất, bộ nhớ trong dồi dào, mang trên mình những công nghệ đỉnh cao hoàn hảo.', N'Areas\Client\statics\img\product_new\iphone11.png', CAST(32990000.00 AS Decimal(18, 2)), CAST(32790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (12, 4, 1, N'3333122', N'iPhone XR 64GB', N'iPhone-XR-64GB', N'iphone', N'Chiếc iPhone với màn hình Liquid Retina hoàn toàn mới, công nghệ màn hình LCD tiên tiến nhất đi cùng Face ID nhanh hơn, con chip mạnh mẽ và hệ thống camera xóa phông hoàn hảo. Đó chính là iPhone XR với nhiều màu sắc tuyệt vời đang chờ đón bạn.', N'Areas\Client\statics\img\product_new\iphone12.png', CAST(16990000.00 AS Decimal(18, 2)), CAST(16590000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(N'2020-04-15' AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[TypeEvent] ON 

INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (1, N'new', CAST(N'2020-04-15' AS Date), CAST(N'2020-12-28' AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (2, N'hot', CAST(N'2020-04-15' AS Date), CAST(N'2020-12-28' AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (3, N'save', CAST(N'2020-04-15' AS Date), CAST(N'2020-12-28' AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (4, N'điện thoại hot nhất', CAST(N'2020-04-16' AS Date), CAST(N'2020-12-28' AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (5, N'điện thoại mới ra mắt', CAST(N'2020-04-16' AS Date), CAST(N'2020-12-28' AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (6, N'điện thoại nhiếp ảnh', CAST(N'2020-04-16' AS Date), CAST(N'2020-12-28' AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (7, N'điện thoại chơi game', CAST(N'2020-04-16' AS Date), CAST(N'2020-12-28' AS Date), 1)
SET IDENTITY_INSERT [dbo].[TypeEvent] OFF
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
USE [master]
GO
ALTER DATABASE [ShopMobi] SET  READ_WRITE 
GO
