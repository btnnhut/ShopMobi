use ShopMobi
go
------------------------------------------------------------------------
Select IDProduct, IDType From dbo.ProductType Where IDType=1;
Go
Select IDProduct, IDType From dbo.ProductType Where IDProduct=51;
Go

------------------------------------------------------------------------
---Login.aspx.cs : clickLogin
SELECT
		count(*) as total 
FROM 
		dbo.Account x
WHERE
		x.NameID='nhut' and x.[Password]='123';
------------------------------------------------------------------------
---Home.aspx.cs : GetListData
Select dbo.[Type].ID,dbo.[Type].Name,dbo.[Type].[Description],count(dbo.ProductType.IDProduct) as countIDPro
From dbo.[Type],dbo.ProductType
Where dbo.[Type].ID=dbo.ProductType.IDType and
dbo.[Type].[Description]='product'
Group by dbo.[Type].ID,dbo.[Type].Name,dbo.[Type].[Description];
Go

Select dbo.[Type].ID,dbo.[Type].Name,dbo.[Type].[Description],count(dbo.ProductType.IDProduct) as countIDPro
From dbo.ProductType Left Join dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID
Where dbo.[Type].[Description]='product'
Group by dbo.[Type].ID,dbo.[Type].Name,dbo.[Type].[Description]
Order by dbo.[Type].ID ASC;
Go

Select dbo.ProductType.IDProduct
From dbo.ProductType
Where dbo.ProductType.IDType=1;
Go
------------------------------------------------------------------------
---Home.aspx.cs : GetListData
Select Top 5 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, 
dbo.Product.Sell, dbo.Product.PricePromotion, dbo.[Type].Name as NameType
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=1
Order by dbo.Product.ID ASC;
Go

Select Top 5 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, 
dbo.Product.Sell, dbo.Product.PricePromotion
From ((dbo.ProductType Left Join dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID)
Left Join dbo.Product On dbo.ProductType.IDProduct=dbo.Product.ID)
Where dbo.[Type].ID=1
Order by dbo.Product.ID ASC;
Go
------------------------------------------------------------------------
---Default.Master.cs : Page_Load
SELECT 
		t.ID, t.Name, t.[Description],count(p.IDProduct) as countIDPro
FROM 
		dbo.[Type]  t, ProductType p
WHERE 
		t.ID=p.IDType and t.[Description]='brand'
GROUP BY 
		t.ID, t.Name, t.[Description];
GO
---
SELECT 
		y.ID, y.Name, y.[Description], count(x.IDProduct) as countIDPro
FROM
		dbo.ProductType x Left Join dbo.[Type] y On x.IDType=y.ID
WHERE 
		y.[Description]='brand'
GROUP BY 
		y.ID, y.Name, y.[Description]
ORDER BY 
		y.ID ASC;
GO
select * from dbo.ProductType where dbo.ProductType.IDType=9;

------------------------------------------------------------------------
---DetailProduct.aspx.cs : Page_Load
Select dbo.Product.ID, dbo.[Type].Name as NameType,
dbo.Product.Name, dbo.Product.Model ,
dbo.Product.[Description], dbo.Product.Imge,
dbo.Product.Price, dbo.Product.Sell, dbo.Product.PricePromotion
From dbo.Product, dbo.ProductType, dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType=dbo.[Type].ID and 
dbo.Product.ID=1 and dbo.ProductType.IDType=2;
Go

Select dbo.Product.ID, dbo.[Type].Name as NameType,
dbo.Product.Name, dbo.Product.Model ,
dbo.Product.[Description], dbo.Product.Imge,
dbo.Product.Price, dbo.Product.Sell, dbo.Product.PricePromotion
From ((dbo.Product Left Join dbo.ProductType On dbo.Product.ID=dbo.ProductType.IDProduct) Left Join
dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID)
Where dbo.Product.ID=1 and dbo.ProductType.IDType=2;
Go

------------------------------------------------------------------------
---ListProduct.aspx.cs : Page_Load
Select Top 6 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, 
dbo.Product.Sell, dbo.Product.PricePromotion, dbo.[Type].Name as NameType
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=1 and dbo.Product.ID > 0
Order by dbo.Product.ID asc;
Go

Select Top 6 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, 
dbo.Product.Sell, dbo.Product.PricePromotion, dbo.[Type].Name as NameType
From ((dbo.Product Left Join dbo.ProductType On dbo.Product.ID=dbo.ProductType.IDProduct) Left Join 
dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID)
Where dbo.[Type].ID=1 and dbo.Product.ID > 0
Order by dbo.Product.ID ASC;
Go

------------------------------------------------------------------------
---AddCart.aspx (InserCart)  ---
Select dbo.Account.ID, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price,
dbo.Product.Sell, dbo.Product.PricePromotion
From dbo.Product, dbo.Account
Where dbo.Product.ID=3 and dbo.Account.NameID='nhut';
Go

------------------------------------------------------------------------
---AddCart.aspx : InsertCartTemp
Select dbo.Product.Name, dbo.Product.Imge, 
dbo.Product.Price, dbo.Product.Sell, dbo.Product.PricePromotion
From dbo.Product
Where dbo.Product.ID = 3;
Go

------------------------------------------------------------------------
---AddCart.aspx : InserCart
Insert into dbo.Cart(dbo.Cart.IDAccount, dbo.Cart.IDProduct,dbo.Cart.IDType, 
dbo.Cart.Name, dbo.Cart.[Image], dbo.Cart.Sell, dbo.Cart.Quantity)
Values(1,1,1,'iPhone 11 Pro Max 64GB','statics\img\product_new\iphone01.png',29100000.00,1);
Go

------------------------------------------------------------------------
---AddCart.aspx.cs : checkCart
Select dbo.Cart.Quantity 
From dbo.Cart, dbo.Account 
where dbo.Cart.IDAccount=dbo.Account.ID and dbo.Account.NameID='nhut' and dbo.Cart.IDProduct=1 and
dbo.Cart.IDType=1;
Go

------------------------------------------------------------------------
--AddCart.aspx : upCart
Update dbo.Cart set dbo.Cart.Quantity=12
Where dbo.Cart.IDProduct=1 and dbo.Cart.IDType=1 and
dbo.Cart.IDAccount=(select dbo.Account.ID From dbo.Account where dbo.Account.NameID='nhut');
Go
------------------------------------------------------------------------
--AddCart.aspx : deleCart
Delete dbo.Cart
Where dbo.Cart.IDProduct=1 and dbo.Cart.IDType=1 and
dbo.Cart.IDAccount=(select dbo.Account.ID From dbo.Account Where dbo.Account.NameID='nhut');
Go
----------------------
select * from dbo.Cart;
Go
Truncate Table dbo.Cart;
Go
------------------------------------------------------------------------
---Cart.aspx.cs : GetTotalcart
Select sum(dbo.Cart.Sell*dbo.Cart.Quantity) as sumTotal,
sum(dbo.Cart.Quantity) as sumQuantity
From dbo.Cart, dbo.Account
Where dbo.Cart.IDAccount=dbo.Account.ID and
dbo.Account.NameID='nhut';
Go

Select sum(dbo.Cart.Sell*dbo.Cart.Quantity) as sumTotal,
sum(dbo.Cart.Quantity) as sumQuantity
From dbo.Cart Left Join dbo.Account On dbo.Cart.IDAccount=dbo.Account.ID 
Where dbo.Account.NameID='nhut';
Go

---tes
select dbo.Cart.Quantity, * from dbo.Cart where dbo.Cart.IDAccount=1;
------------------------------------------------------------------------
---Cart.aspx.cs : btnPay_Click
Delete From dbo.Cart 
Where dbo.Cart.IDProduct=33 and dbo.Cart.IDType=3
and dbo.Cart.IDAccount=(
select dbo.Account.ID 
From dbo.Account 
Where dbo.Account.NameID='nhut');

------------------------------------------------------------------------
---Cart.aspx.cs : GetCart
Select dbo.Cart.IDProduct, dbo.Cart.IDType, dbo.Cart.Name, dbo.Cart.[Image], dbo.Cart.Sell,
dbo.Cart.Quantity
From dbo.Cart, dbo.Account
Where dbo.Cart.IDAccount=dbo.Account.ID and
dbo.Account.NameID='nhut';
Go

Select dbo.Cart.IDProduct ,dbo.Cart.Name, dbo.Cart.[Image], dbo.Cart.Sell,
dbo.Cart.Quantity
From dbo.Cart Left Join dbo.Account On dbo.Cart.IDAccount=dbo.Account.ID
Where dbo.Account.NameID='nhut';
Go

---Test
Select Top 6 dbo.Product.ID
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=1 and dbo.Product.ID > 7
Order by dbo.Product.ID ASC;
Go

Select Top 6 dbo.ProductType.IDProduct as ID
From dbo.ProductType Left Join dbo.[Type] On dbo.ProductType.IDType=dbo.[Type].ID
Where dbo.[Type].ID=1 and dbo.ProductType.IDProduct > 7
Order by dbo.ProductType.IDProduct ASC;
Go

--All ProductID is Type = 1
Select dbo.ProductType.IDProduct
From dbo.ProductType,dbo.Type
Where dbo.ProductType.IDType=dbo.[Type].ID
and dbo.[Type].ID=1
Order by dbo.ProductType.IDProduct ASC;
Go

Select dbo.Cart.Quantity
From dbo.Cart Left Join dbo.Account On dbo.Cart.IDAccount=dbo.Account.ID
Where dbo.Account.NameID='nhut1' and dbo.Cart.IDProduct=29;
Go

select * from dbo.Cart;
Go

Select dbo.ProductType.IDProduct 
From dbo.ProductType, dbo.[Type], dbo.Product
Where dbo.ProductType.IDType=dbo.[Type].ID and 
dbo.ProductType.IDProduct=dbo.Product.ID and 
dbo.[Type].[Description]= 'product' and dbo.[Type].ID=1;
Go
-----------------------------
----
select dbo.Product.ID, dbo.Product.Name, dbo.Product.[Description] 
FROM dbo.Product, dbo.ProductType
Where dbo.Product.ID=dbo.ProductType.IDProduct and
	dbo.ProductType.IDType=1
Go
-----Lay row theo trang (trang 2, moi trang 5 sp)
declare @offsetcount as int
--set @offsetcount=(@pageno-1)*@records
set @offsetcount=(2-1)*5
select dbo.Product.ID, dbo.Product.Name, dbo.Product.[Description] 
FROM dbo.Product, dbo.ProductType
Where dbo.Product.ID=dbo.ProductType.IDProduct and
	dbo.ProductType.IDType=1
order by id offset @offsetcount rows fetch Next 5 rows only
Go
-----------
select tblProduct.rowNumber,tblProduct.ID,tblProduct.Name
From ( Select ROW_NUMBER() over (order by dbo.Product.ID) as rowNumber, 
dbo.Product.ID, dbo.Product.Name,dbo.Product.[Description]
From dbo.Product) as tblProduct
Where rowNumber >1 and rowNumber<6;
Go
---------------
Select Top 6 dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, 
dbo.Product.Sell, dbo.Product.PricePromotion, dbo.[Type].Name as NameType
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=6 and dbo.Product.ID > 13
Order by dbo.Product.ID asc
Go
-----------
Select dbo.Product.ID, dbo.ProductType.IDType, dbo.Product.Name, dbo.Product.Imge, dbo.Product.Price, 
dbo.Product.Sell, dbo.Product.PricePromotion, dbo.[Type].Name as NameType
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=6
Go
-----------
Select dbo.Product.ID
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=6
--Order by dbo.Product.ID Offset 5 Rows
Order by dbo.Product.ID asc
Go
-----------
Select count(*) as Tong
From dbo.Product, dbo.ProductType,dbo.[Type]
Where dbo.Product.ID=dbo.ProductType.IDProduct and 
dbo.ProductType.IDType= dbo.[Type].ID and 
dbo.[Type].ID=6
Go
---------
