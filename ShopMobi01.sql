USE [master]
GO
/****** Object:  Database [ShopMobi]    Script Date: 15/04/2020 9:42:02 PM ******/
CREATE DATABASE [ShopMobi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopMobi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopMobi.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShopMobi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShopMobi_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShopMobi] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [ShopMobi] SET AUTO_CREATE_STATISTICS ON 
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
USE [ShopMobi]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 15/04/2020 9:42:02 PM ******/
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
	[CreatedDate] [datetime] NULL,
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
/****** Object:  Table [dbo].[Cart]    Script Date: 15/04/2020 9:42:02 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 15/04/2020 9:42:02 PM ******/
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
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15/04/2020 9:42:02 PM ******/
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
	[CreateDate] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypeEvent]    Script Date: 15/04/2020 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEvent](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_TypeEvent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [NameID], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'nhut', N'123', NULL, NULL, NULL, NULL, CAST(0x0000AB9E000D4833 AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [CreateDate]) VALUES (1, N'điện thoại', N'dien-thoai', CAST(0xF9400B00 AS Date))
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (1, 4, 1, N'3333111', N'iPhone 11 Pro Max 64GB', N'iPhone-11-Pro-Max-64GB', N'iphone', N'Chiếc iPhone mạnh mẽ nhất, lớn nhất, thời lượng pin tốt nhất đã xuất hiện. iPhone 11 Pro Max chắc chắn là chiếc điện thoại mà ai cũng ao ước khi sở hữu những tính năng xuất sắc nhất, đặc biệt là camera và pin.', N'Areas\Client\statics\img\product_new\iphone01.png', CAST(33990000.00 AS Decimal(18, 2)), CAST(29100000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (2, 4, 1, N'3333112', N'iPhone 11 Pro Max 256GB', N'iPhone-11-Pro-Max-256GB', N'iphone', N'iPhone 11 Pro Max là sản phẩm dành cho những ai đang kiếm tìm sự hoàn hảo trong quá trình trải nghiệm điện thoại. Với chiếc iPhone này, Apple đã vươn tới đỉnh cao khi tinh chỉnh tối ưu mọi yếu tố bên trong như hiệu năng, camera, pin và thiết kế một cách tốt nhất.', N'Areas\Client\statics\img\product_new\iphone02.png', CAST(37990000.00 AS Decimal(18, 2)), CAST(33990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (3, 4, 1, N'3333113', N'iPhone 11 Pro Max 512GB', N'iPhone-11-Pro-Max-512GB', N'iphone', N'iPhone 11 Pro Max 512GB là phiên bản có bộ nhớ nhiều nhất, màn hình lớn nhất và thời lượng pin tuyệt vời nhất hiện nay. Bạn sẽ được cầm trên tay chiếc điện thoại đẳng cấp mà bất cứ ai cũng mơ ước.', N'Areas\Client\statics\img\product_new\iphone03.png', CAST(43990000.00 AS Decimal(18, 2)), CAST(40990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (4, 4, 1, N'3333114', N'iPhone 11 Pro 64GB', N'iPhone-11-Pro-64GB', N'iphone', N'Chào đón bạn đến với thế hệ iPhone Pro đầu tiên. iPhone 11 Pro sở hữu hệ thống 3 camera đẳng cấp, một bước nhảy vọt về thời lượng pin và con chip mới có hiệu năng mạnh mẽ chưa từng thấy. Mạnh mẽ, khác biệt và chuyên nghiệp, sản phẩm hoàn toàn xứng đáng với tên gọi.', N'Areas\Client\statics\img\product_new\iphone04.png', CAST(30990000.00 AS Decimal(18, 2)), CAST(28990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (5, 4, 1, N'3333115', N'iPhone 11 Pro 256GB', N'iPhone-11-Pro-256GB', N'iphone', N'Những cải tiến hiệu quả của Apple về khả năng chụp ảnh, trải nghiệm pin và sức mạnh hiệu năng biến iPhone 11 Pro thành công cụ hỗ trợ giải trí và phục vụ công việc xuất sắc. Trở thành chủ nhân của một chiếc iPhone 11 Pro 256GB, bạn chạm tay vào trải nghiệm chuyên nghiệp chưa từng có.', N'Areas\Client\statics\img\product_new\iphone05.png', CAST(34990000.00 AS Decimal(18, 2)), CAST(32990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (6, 4, 1, N'3333116', N'iPhone 11 Pro 512GB', N'iPhone-11-Pro-512GB', N'iphone', N'Phiên bản bộ nhớ lớn nhất iPhone 11 Pro 512GB cho bạn không gian lưu trữ thoải mái, tha hồ chụp ảnh và quay video bằng hệ thống 3 camera sau siêu đỉnh, thời lượng pin dài vô tận cùng sức mạnh khổng lồ từ bộ vi xử lý Apple A13 Bionic.', N'Areas\Client\statics\img\product_new\iphone06.png', CAST(40990000.00 AS Decimal(18, 2)), CAST(38990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (7, 4, 1, N'3333117', N'iPhone 11 64GB', N'iPhone 11 64GB', N'iphone', N'iPhone 11 với 6 phiên bản màu sắc, camera có khả năng chụp ảnh vượt trội, thời lượng pin cực dài và bộ vi xử lý mạnh nhất từ trước đến nay sẽ mang đến trải nghiệm tuyệt vời dành cho bạn.', N'Areas\Client\statics\img\product_new\iphone07.png', CAST(21990000.00 AS Decimal(18, 2)), CAST(20990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (8, 4, 1, N'3333118', N'iPhone 11 128GB', N'iPhone-11-128GB', N'iphone', N'Phiên bản iPhone 11 128GB được người dùng yêu thích bởi dung lượng bộ nhớ đủ dùng, camera kép cực đỉnh và những lựa chọn màu sắc vô cùng thời trang.', N'Areas\Client\statics\img\product_new\iphone08.png', CAST(23990000.00 AS Decimal(18, 2)), CAST(22990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (9, 4, 1, N'3333119', N'iPhone 11 256GB', N'iPhone-11-256GB', N'iphone', N'Với bộ nhớ trong lên tới 256GB, phiên bản iPhone 11 256GB thoải mái cho mọi nhu cầu của người dùng, đồng thời bạn sẽ được sở hữu chiếc điện thoai mạnh mẽ nhất, camera xuất sắc và nhiều lựa chọn màu hấp dẫn.', N'Areas\Client\statics\img\product_new\iphone09.png', CAST(25990000.00 AS Decimal(18, 2)), CAST(24990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (10, 4, 1, N'3333120', N'iPhone Xs Max 64GB', N'iPhone-Xs-Max-64GB', N'iphone', N'iPhone Xs Max 64GB là chiếc iPhone có màn hình lớn nhất từ trước đến nay, mang đến những trải nghiệm tuyệt vời về màn hình và thời lượng pin.', N'Areas\Client\statics\img\product_new\iphone10.png', CAST(26990000.00 AS Decimal(18, 2)), CAST(26590000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (11, 4, 1, N'3333121', N'iPhone Xs Max 256GB', N'iPhone-Xs-Max-256GB', N'iphone', N'iPhone Xs Max 256GB là chiếc iPhone có màn hình lớn nhất, bộ nhớ trong dồi dào, mang trên mình những công nghệ đỉnh cao hoàn hảo.', N'Areas\Client\statics\img\product_new\iphone11.png', CAST(32990000.00 AS Decimal(18, 2)), CAST(32790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (12, 4, 1, N'3333122', N'iPhone XR 64GB', N'iPhone-XR-64GB', N'iphone', N'Chiếc iPhone với màn hình Liquid Retina hoàn toàn mới, công nghệ màn hình LCD tiên tiến nhất đi cùng Face ID nhanh hơn, con chip mạnh mẽ và hệ thống camera xóa phông hoàn hảo. Đó chính là iPhone XR với nhiều màu sắc tuyệt vời đang chờ đón bạn.', N'Areas\Client\statics\img\product_new\iphone12.png', CAST(16990000.00 AS Decimal(18, 2)), CAST(16590000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (13, 4, 1, N'3333123', N'Samsung Galaxy S20', N'Samsung-Galaxy-S20', N'samsung', N'Samsung Galaxy S20 mang trên mình những tính năng cao cấp đầu bảng, với 3 camera 64MP, khả năng quay video 8K, sức mạnh phần cứng mạnh mẽ bên trong một thiết kế vô cùng di động, nhỏ gọn trong lòng bàn tay.', N'Areas\Client\statics\img\product_new\samsung01.png', CAST(21490000.00 AS Decimal(18, 2)), CAST(19490000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (14, 4, 1, N'3333123', N'Samsung Galaxy S20+', N'Samsung-Galaxy-S20+', N'samsung', N'Siêu phẩm Samsung Galaxy S20+ đã xuất hiện. Thể hiện đẳng cấp đích thực với thiết kế cao cấp, màn hình lớn đẹp tuyệt mỹ, 5 camera chuyên nghiệp và hiệu suất đáng kinh ngạc.', N'Areas\Client\statics\img\product_new\samsung02.png', CAST(23990000.00 AS Decimal(18, 2)), CAST(20990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (15, 4, 1, N'3333124', N'Samsung Galaxy S20 Ultra', N'Samsung-Galaxy-S20-Ultra', N'samsung', N'Samsung Galaxy S20 Ultra là chiếc điện thoại sẽ thay đổi tương lai của nhiếp ảnh smartphone. Cùng khám phá bước tiến mang tính lịch sử với 5 ống kính camera 108MP siêu nét, quay phim chuẩn điện ảnh 8K trên S20 Ultra.', N'Areas\Client\statics\img\product_new\samsung03.png', CAST(29990000.00 AS Decimal(18, 2)), CAST(27990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (16, 4, 1, N'3333125', N'Samsung Galaxy Z Flip', N'Samsung-Galaxy-Z-Flip', N'samsung', N'Một chiếc điện thoại vừa nhỏ gọn đáng kinh ngạc, lại vừa mang đến trải nghiệm mãn nhãn trên màn hình lớn chuẩn điện ảnh 6,7 inch, những điều tưởng như nằm ngoài giới hạn đã thực sự xuất hiện trên Samsung Galaxy Z Flip với thiết kế gập độc đáo và sáng tạo chưa từng thấy.', N'Areas\Client\statics\img\product_new\samsung04.png', CAST(36000000.00 AS Decimal(18, 2)), CAST(34000000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (17, 4, 1, N'3333126', N'Samsung Galaxy M31', N'Samsung-Galaxy-M31', N'samsung', N'Dung lượng pin siêu khổng lồ 6000 mAh, 4 camera 64MP đẳng cấp và rất nhiều bất ngờ thú vị khác đang chờ đón bạn trên Samsung Galaxy M31, chiếc điện thoại giá tầm trung nhưng mang lại những trải nghiệm cao cấp.', N'Areas\Client\statics\img\product_new\samsung05.png', CAST(6190000.00 AS Decimal(18, 2)), CAST(5890000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (18, 4, 1, N'3333127', N'Samsung Galaxy Note 10 Lite', N'Samsung Galaxy-Note-10-Lite', N'samsung', N'Chiếc Galaxy Note mới đã quay trở lại, Samsung Galaxy Note10 Lite đưa bạn đến trải nghiệm tuyệt vời của màn hình vô cực Infinity-O, bút S Pen danh tiếng, camera chuyên nghiệp và thời lượng pin dài bất tận trong một mức giá dễ chịu.', N'Areas\Client\statics\img\product_new\samsung06.png', CAST(13990000.00 AS Decimal(18, 2)), CAST(11990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (19, 4, 1, N'3333128', N'Samsung Galaxy A71', N'Samsung-Galaxy-A71', N'samsung', N'Một sản phẩm thực sự đột phá, Samsung Galaxy A71 là tổng hòa của những công nghệ cao cấp nhất hiện nay với bộ 4 camera sau 64MP, màn hình 6,7 inch Full HD+ mãn nhãn và thời lượng pin trên cả tuyệt vời.', N'Areas\Client\statics\img\product_new\samsung07.png', CAST(10490000.00 AS Decimal(18, 2)), CAST(10190000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (20, 4, 1, N'3333129', N'Samsung Galaxy M30s', N'Samsung-Galaxy-M30s', N'samsung', N'Samsung M30s là chiếc điện thoại có dung lượng pin lớn nhất trên thị trường hiện nay. Không chỉ vậy, với màn hình tuyệt đẹp và bộ ba camera đỉnh cao, M30s mang đến trải nghiệm giải trí bất tận.', N'Areas\Client\statics\img\product_new\samsung08.png', CAST(6990000.00 AS Decimal(18, 2)), CAST(5990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (21, 4, 1, N'3333130', N'Samsung Galaxy M21', N'Samsung-Galaxy-M21', N'samsung', N'Đắm chìm trong màn hình tràn viền vô cực Infinity-U 6,4 inch rộng lớn, thỏa mãn niềm đam mê nhiếp ảnh với 3 camera sau ấn tượng, đặc biệt là viên pin dung lượng tới 6000 mAh cho 2 ngày sử dụng thoải mái, Samsung Galaxy M21 thực sự mang đến những giờ phút giải trí bất tận.', N'Areas\Client\statics\img\product_new\samsung09.png', CAST(5490000.00 AS Decimal(18, 2)), CAST(5490000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (27, 4, 1, N'3333131', N'Samsung Galaxy A51', N'Samsung-Galaxy-A51', N'samsung', N'Tự hào là smartphone đầu tiên trên thế giới được tích hợp camera Macro hỗ trợ chụp ảnh cận cảnh, Galaxy A51 đem tới trải nghiệm chụp hình vượt ngoài mong đợi với khả năng tái tạo đến từng chi tiết nhỏ nhất. Ngoài ra, sự ưu việt của màn hình vô cực kết hợp với cấu hình mạnh mẽ và viên pin lớn 4.000 mAh sạc siêu nhanh khiến Galaxy A51 có thể làm vừa lòng bất cứ ai ngay từ lần trải nghiệm đầu tiên.', N'Areas\Client\statics\img\product_new\samsung10.png', CAST(7990000.00 AS Decimal(18, 2)), CAST(7990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (28, 4, 1, N'3333132', N'Samsung Galaxy Note 10+', N'Samsung-Galaxy-Note-10+', N'samsung', N'Chiếc điện thoại cao cấp nhất, màn hình lớn nhất, mang trên mình sức mạnh đáng kinh ngạc của một chiếc máy tính và hệ thống 4 camera sau chuyên nghiệp, đó chính là Samsung Galaxy Note 10+, nơi quyền năng mới được thể hiện.', N'Areas\Client\statics\img\product_new\samsung11.png', CAST(26990000.00 AS Decimal(18, 2)), CAST(25990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (29, 4, 1, N'3333133', N'Samsung Galaxy Note 10', N'Samsung-Galaxy-Note-10', N'samsung', N'Quyền năng thế hệ mới đã xuất hiện, Samsung Galaxy Note 10 mang đến trải nghiệm tuyệt đỉnh như máy tính trong một thiết kế gọn gàng cùng bút S Pen thông minh, tất cả đều nằm trên tay bạn.', N'Areas\Client\statics\img\product_new\samsung12.png', CAST(22990000.00 AS Decimal(18, 2)), CAST(22990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (30, 4, 1, N'3333134', N'Vivo S1 Pro 8GB-128GB', N'Vivo-S1-Pro-8GB-128GB', N'vivo', N'Thể hiện đẳng cấp chuyên nghiệp với Vivo S1 Pro cực chất. Thiết kế phá cách, 4 camera sau AI 48MP, camera selfie 32MP và cấu hình cực đỉnh, Vivo S1 Pro khai phá chất riêng của bạn.', N'Areas\Client\statics\img\product_new\vivo01.png', CAST(6490000.00 AS Decimal(18, 2)), CAST(6090000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (31, 4, 1, N'3333135', N'Vivo S1 6GB-128GB', N'Vivo-S1-6GB-128GB', N'vivo', N'Chiếc điện thoại vô cùng phong cách, 3 camera đẳng cấp và thời lượng pin siêu khủng, Vivo S1 đã sẵn sàng đồng hành bên bạn trong cuộc sống năng động hiện đại.', N'Areas\Client\statics\img\product_new\vivo02.png', CAST(5490000.00 AS Decimal(18, 2)), CAST(5490000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (32, 4, 1, N'3333136', N'Vivo V15 6GB-64GB', N'Vivo-V15-6GB-64GB', N'vivo', N'Chiếc điện thoại màn hình tràn viền hoàn hảo với camera “tàng hình” độc đáo, Vivo V15 phá vỡ mọi giới hạn để mang đến cho bạn trải nghiệm tuyệt vời nhất.', N'Areas\Client\statics\img\product_new\vivo03.png', CAST(4990000.00 AS Decimal(18, 2)), CAST(4790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (33, 4, 1, N'3333137', N'Vivo Y19 6GB -128GB', N'Vivo-Y19-6GB-128GB', N'vivo', N'Vivo Y19 mang đến những công nghệ cao cấp nhất trong tầm giá đặc biệt hấp dẫn. Bạn sẽ được sở hữu một chiếc điện thoại màn hình lớn, 4 camera, bộ nhớ trong 128GB và viên pin “khủng” 5000 mAh.', N'Areas\Client\statics\img\product_new\vivo04.png', CAST(4690000.00 AS Decimal(18, 2)), CAST(4690000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (34, 4, 1, N'3333138', N'Vivo U10 4GB-64GB', N'Vivo-U10-4GB-64GB', N'vivo', N'Vivo U10 sở hữu hiệu năng và thời lượng pin đáng kinh ngạc ở phân khúc giá rẻ, mang đến cho bạn một chiếc điện thoại mạnh mẽ, bền bỉ, sẵn sàng đương đầu với mọi thử thách.', N'Areas\Client\statics\img\product_new\vivo05.png', CAST(3990000.00 AS Decimal(18, 2)), CAST(3790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (35, 4, 1, N'3333139', N'Vivo Y15 4-64GB', N'Vivo-Y15-4-64GB', N'vivo', N'Màn hình Halo 6,35 inch cực lớn, 3 camera sau đẳng cấp, viên pin dung lượng tới 5000 mAh và còn rất nhiều điều thú vị khác đang chờ đón bạn trên Vivo Y15.', N'Areas\Client\statics\img\product_new\vivo06.png', CAST(3790000.00 AS Decimal(18, 2)), CAST(3790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (36, 4, 1, N'3333140', N'Vivo Y12 3GB-64GB', N'Vivo-Y12-3GB-64GB', N'vivo', N'Trải nghiệm 3 camera chuyên nghiệp và viên pin dung lượng lên tới 5000 mAh trong tầm giá rẻ, Vivo Y12 là chiếc điện thoại màn hình lớn phù hợp cho mọi đối tượng sử dụng.', N'Areas\Client\statics\img\product_new\vivo07.png', CAST(3590000.00 AS Decimal(18, 2)), CAST(3590000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (37, 4, 1, N'3333141', N'Vivo Y93 3-32GB', N'Vivo-Y93-3-32GB', N'vivo', N'Chiếc điện thoại màn hình lớn tràn viền hấp dẫn, viên pin “cực khủng” và camera kép trong tầm giá cực yêu thương, Vivo Y93 sẽ mang cả thế giới vào trong tầm mắt bạn.', N'Areas\Client\statics\img\product_new\vivo08.png', CAST(2990000.00 AS Decimal(18, 2)), CAST(2790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (38, 4, 1, N'3333142', N'Vivo Y11', N'Vivo-Y11', N'vivo', N'Thiết kế tuyệt đẹp tràn đầy cảm hứng và viên pin dung lượng cao 5000 mAh, Vivo Y11 mang đến cho bạn những trải nghiệm tuyệt vời trong suốt cả ngày dài năng động.', N'Areas\Client\statics\img\product_new\vivo09.png', CAST(2990000.00 AS Decimal(18, 2)), CAST(2990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (39, 4, 1, N'3333143', N'Vivo Y91C 2GB-32GB', N'Vivo-Y91C-2GB-32GB', N'vivo', N'Màn hình lớn tràn viền, thời lượng pin cực khủng trong tầm giá rẻ, Vivo Y91C 2GB 32GB là chiếc điện thoại phù hợp để giải trí dành cho tất cả mọi người.', N'Areas\Client\statics\img\product_new\vivo10.png', CAST(2390000.00 AS Decimal(18, 2)), CAST(2390000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (40, 4, 1, N'3333144', N'Vivo V17 6GB-128GB', N'Vivo-V17-6GB-128GB', N'vivo', N'Phiên bản Vivo V17 này khác biệt so với sản phẩm cùng tên ra mắt tại Nga. Cụm camera phía sau có hình chữ nhật thay vì dạng kim cương như dự đoán. Ngoài ra, mặt trước của điện thoại cũng có màn hình đục lỗ thay vì notch giọt nước.', N'Areas\Client\statics\img\product_new\vivo11.png', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (41, 4, 1, N'3333145', N'Vivo Apex 2020', N'Vivo-Apex-2020', N'vivo', N'Vivo Apex 2020 là một điện thoai ý tưởng của công ty Trung Quốc. Máy mới ra mắt vào ngày hôm nay và đi kèm rất nhiều công nghệ ấn tượng thực sự trong ngành.', N'Areas\Client\statics\img\product_new\vivo12.png', NULL, NULL, NULL, NULL, NULL, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (42, 4, 1, N'3333146', N'OPPO Find X2', N'OPPO-Find-X2', N'oppo', N'Tiếp tục sứ mệnh mở ra tương lai bằng những công nghệ mới, OPPO Find X2 mang đến cho bạn trải nghiệm chưa từng có, để bạn được cảm nhận sự đẳng cấp và những bước tiến vượt bậc trong ngành smartphone.', N'Areas\Client\statics\img\product_new\oppo01.png', CAST(23990000.00 AS Decimal(18, 2)), CAST(23990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (43, 4, 1, N'3333147', N'OPPO Reno2', N'OPPO-Reno2', N'oppo', N'Hãy để OPPO Reno2 chắp cánh cho những ý tưởng của bạn. Camera trước vây cá mập độc đáo và 4 camera sau cao cấp mang đến khả năng chụp ảnh hoàn hảo, phóng to và mở rộng khung hình lớn bất tận.', N'Areas\Client\statics\img\product_new\oppo02.png', CAST(14990000.00 AS Decimal(18, 2)), CAST(12990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (44, 4, 1, N'3333148', N'Oppo Reno', N'Oppo-Reno', N'oppo', N'Với OPPO Reno, trải nghiệm smartphone của bạn sẽ được nâng lên một tầm cao mới. Thiết kế độc đáo đầy phong cách kết hợp với công nghệ nhiếp ảnh tối tân sẽ giúp người dùng có được cảm nhận hoàn toàn khác biệt khi sử dụng sản phẩm.', N'Areas\Client\statics\img\product_new\oppo03.png', CAST(12990000.00 AS Decimal(18, 2)), CAST(8790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (45, 4, 1, N'3333149', N'OPPO Reno2 F', N'OPPO-Reno2-F', N'oppo', N'Chụp ảnh đỉnh cao với 4 camera sau; thiết kế không viền tuyệt mỹ; cảm biến vân tay trong màn hình và camera trước “tàng hình” độc đáo, OPPO Reno2 F tập hợp tất cả những tinh hoa công nghệ trong một sản phẩm tuyệt đẹp.', N'Areas\Client\statics\img\product_new\oppo04.png', CAST(8990000.00 AS Decimal(18, 2)), CAST(7990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (46, 4, 1, N'3333150', N'Oppo A9 2020', N'Oppo-A9-2020', N'oppo', N'OPPO A9 2020 tập trung tối đa vào trải nghiệm người dùng với hiệu năng và thời lượng pin cực đỉnh. Chắc chắn bạn sẽ phải bất ngờ vì những gì OPPO A9 mang lại.', N'Areas\Client\statics\img\product_new\oppo05.png', CAST(6990000.00 AS Decimal(18, 2)), CAST(5990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (47, 4, 1, N'3333151', N'Oppo A5 2020 4GB-128GB', N'Oppo A5-2020-4GB-128GB', N'oppo', N'OPPO A5 2020 128GB là chiếc điện thoại có đầy đủ những tính năng người dùng mong đợi: nhiều bộ nhớ, pin dung lượng “khủng” 5000 mAh, 4 camera xuất sắc và hiệu năng mạnh mẽ ấn tượng.', N'Areas\Client\statics\img\product_new\oppo06.png', CAST(5290000.00 AS Decimal(18, 2)), CAST(4790000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (48, 4, 1, N'3333152', N'Oppo A31 6GB-128GB', N'Oppo-A31-6GB-128GB', N'oppo', N'Phiên bản OPPO A31 6GB không chỉ có sẵn nhiều bộ nhớ trong mà dung lượng RAM cũng được nâng cấp, để bạn có được trải nghiệm mượt mà hơn, thỏa sức giải trí trên màn hình lớn 6,5 inch tuyệt đẹp.', N'Areas\Client\statics\img\product_new\oppo07.png', CAST(5290000.00 AS Decimal(18, 2)), CAST(5290000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (49, 4, 1, N'3333153', N'Oppo A31 4GB-128GB', N'Oppo-A31-4GB-128GB', N'oppo', N'Với bộ nhớ trong cực lớn 128GB, viên pin dung lượng cao 4230 mAh và màn hình giọt nước 6,5 inch, OPPO A31 mang đến cho bạn những trải nghiệm lớn hơn, giúp cuộc sống trở nên dễ dàng hơn.', N'Areas\Client\statics\img\product_new\oppo08.png', CAST(4490000.00 AS Decimal(18, 2)), CAST(4490000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (50, 4, 1, N'3333154', N'Oppo A5 2020 3GB-64GB', N'Oppo-A5-2020-3GB-64GB', N'oppo', N'OPPO A5 2020 mang đến trải nghiệm trên cả mong đợi cho người dùng với 4 camera sau đẳng cấp, pin dung lượng “khủng” 5000 mAh, màn hình lớn cực đã cùng nhiều bất ngờ thú vị khác.', N'Areas\Client\statics\img\product_new\oppo09.png', CAST(4290000.00 AS Decimal(18, 2)), CAST(3990000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (51, 4, 1, N'3333155', N'OPPO A5s', N'OPPO-A5s', N'oppo', N'OPPO A5s chính hãng là một điện thoại thông minh tuyệt vời, được trang bị rất nhiều tính năng mạnh mẽ. Máy có một màn hình lớn, máy ảnh selfie và quay video sắc nét, dung lượng pin cao và giá bán phải chăng.', N'Areas\Client\statics\img\product_new\oppo10.png', CAST(3290000.00 AS Decimal(18, 2)), NULL, NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (52, 4, 1, N'3333156', N'OPPO A1k', N'OPPO-A1k', N'oppo', N'Chiếc điện thoại thời trang đầy phong cách nhưng lại sở hữu thời lượng pin đáng nể, OPPO A1K mang đến nguồn năng lượng bất tận cho giới trẻ, để bạn thoải mái sử dụng trong suốt cả ngày dài.', N'Areas\Client\statics\img\product_new\oppo11.png', CAST(2990000.00 AS Decimal(18, 2)), CAST(2690000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (53, 4, 1, N'3333157', N'Nokia 7.2', N'Nokia-7.2', N'nokia', N'Đỉnh cao của hoàn thiện và sáng tạo, Nokia 7.2 sở hữu bộ ba camera ZEISS hàng đầu, thiết kế phong cách Bắc Âu lịch lãm cùng màn hình tuyệt đẹp sẽ là sự lựa chọn mà bạn không phải hối hận.', N'Areas\Client\statics\img\product_new\nokia01.png', CAST(6190000.00 AS Decimal(18, 2)), CAST(4590000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (54, 4, 1, N'3333158', N'Nokia 6.1 Plus', N'Nokia-6.1-Plus', N'nokia', N'Nokia 6.1 Plus sẽ kể nên những câu chuyện trong cuộc sống của bạn với camera kép AI tuyệt vời, vi xử lý Snapdragon 636 mạnh mẽ và màn hình tràn viền kiểu mới.', N'Areas\Client\statics\img\product_new\nokia02.png', CAST(3690000.00 AS Decimal(18, 2)), NULL, NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (55, 4, 1, N'3333159', N'Nokia 5.1 Plus', N'Nokia-5.1-Plus', N'nokia', N'Nokia 5.1 Plus phù hợp cho những người yêu thích điện thoại nhỏ gọn, có camera kép xuất sắc và hiệu năng mượt mà với hệ điều hành Android One nguyên bản.', N'Areas\Client\statics\img\product_new\nokia03.png', CAST(2990000.00 AS Decimal(18, 2)), NULL, NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (56, 4, 1, N'3333160', N'Nokia 2.3', N'Nokia-2.3', N'nokia', N'Khám phá sức mạnh của trí tuệ nhân tạo AI cùng điện thoại Nokia 2.3 mới nhất. Thời lượng pin cả ngày, chụp ảnh chuyên nghiệp, màn hình lớn sẽ đưa bạn đến thế giới giải trí bất tận.', N'Areas\Client\statics\img\product_new\nokia04.png', CAST(2590000.00 AS Decimal(18, 2)), CAST(2090000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (57, 4, 1, N'3333161', N'Nokia 3.2 2GB-16GB', N'Nokia-3.2-2GB-16GB', N'nokia', N'Với Nokia 3.2, bạn có thể thỏa sức "phiêu" cùng các công nghệ hiện đại mà không cần bỏ ra quá nhiều chi phí.', N'Areas\Client\statics\img\product_new\nokia05.png', CAST(2490000.00 AS Decimal(18, 2)), CAST(2190000.00 AS Decimal(18, 2)), NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
INSERT [dbo].[Product] ([ID], [IDTypeEvent], [IDCategory], [SKU], [Name], [MetaTitle], [Model], [Description], [Imge], [Price], [Sell], [PricePromotion], [InducledVAT], [Quantity], [QuantitySell], [CreateDate]) VALUES (58, 4, 1, N'3333162', N'Nokia 800 Tough', N'Nokia-800-Tough', N'nokia', N'Thiết kế hầm hố, độ bền chuẩn quân đội, Nokia 800 Tough là sự lựa chọn tuyệt vời cho những ai đang tìm một chiếc điện thoại chắc chắn, siêu bền, đảm bảo nghe gọi tốt trong mọi hoàn cảnh.', N'Areas\Client\statics\img\product_new\nokia06.png', CAST(2490000.00 AS Decimal(18, 2)), NULL, NULL, NULL, 99, NULL, CAST(0xF9400B00 AS Date))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[TypeEvent] ON 

INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (1, N'new', CAST(0xF9400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (2, N'hot', CAST(0xF9400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (3, N'save', CAST(0xF9400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (4, N'điện thoại hot nhất', CAST(0xFA400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (5, N'điện thoại mới ra mắt', CAST(0xFA400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (6, N'điện thoại nhiếp ảnh', CAST(0xFA400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
INSERT [dbo].[TypeEvent] ([ID], [Name], [BeginDate], [EndDate], [Status]) VALUES (7, N'điện thoại chơi game', CAST(0xFA400B00 AS Date), CAST(0xFA410B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[TypeEvent] OFF
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[TypeEvent] ADD  CONSTRAINT [DF_TypeEvent_Status]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [ShopMobi] SET  READ_WRITE 
GO
