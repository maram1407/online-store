create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(100)Null, 
Password nvarchar(100)Null,
Email nvarchar(100)Null,
Name nvarchar(100)Null,
Usertype nvarchar(50) default 'User'
)

create table ForgotPass
(
Id nvarchar (500)  not null,
Uid int null,
RequestDateTime DATETIME null,
Constraint [FK_ForgotPass_tblUsers] FOREIGN KEY ([Uid]) REFERENCES [tblUsers] ([Uid])

)

CREATE TABLE tblCategory(
	[CatID] [int] IDENTITY(1,1) NOT NULL primary key,
	[CatName] [nvarchar](max) NULL,
)


CREATE TABLE tblTypes(
	[TypeID] [int] IDENTITY(1,1) NOT NULL primary key,
	[Name] [nvarchar](500) NULL,
)


create table tblColors
(
ColorID int identity(1,1) primary key,
ColorName   nvarchar(500),
TypeID int,
CategoryID int,

Constraint [FK_tblSizes_ToBrand] FOREIGN KEY ([TypeID]) REFERENCES [tblTypes] ([TypeID]),
Constraint [FK_tblSizes_ToCat] FOREIGN KEY ([CategoryID]) REFERENCES [tblCategory] ([CatID]),


)


select A.*,B.*,C.* from tblColors A inner join tblCategory B on B.CatID =a.CategoryID  inner join tblTypes C on C.TypeID =A.TypeID 



create table tblProducts
(
PID int identity(1,1) primary key ,
PName   nvarchar(MAX),
PPrice money,
PTypeID int,
PCategoryID int,
PDescription nvarchar(MAX),

Constraint [FK_tblProducts_ToTable] FOREIGN KEY ([PTypeID]) REFERENCES [tblTypes] ([TypeID]),
Constraint [FK_tblProducts_ToTable1] FOREIGN KEY ([PCategoryID]) REFERENCES [tblCategory] ([CatID]),


)



create table tblProductColorQuantity
(
PrdColorQuantID int identity(1,1) primary key,
PID int,
ColorID int,
Quantity int,
Constraint [FK_tblProductColorQuantity_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID]),
Constraint [FK_tblProductColorQuantity_ToTable1] FOREIGN KEY ([ColorID]) REFERENCES [tblColors] ([ColorID])
)

CREATE TABLE tblProductImages(
	[PIMGID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL,
	Constraint [FK_tblProductImages_ToTable] FOREIGN KEY ([PID]) REFERENCES [tblProducts] ([PID])
	)


	CREATE TABLE tblCart(
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Qty]),
	[Qty] [int] NULL,
)





create table tblPurchase
(
PurchaseID int identity(1,1) primary key,
UserID int,
PIDColorID nvarchar(MAX),
CartAmount money,
PaymentType nvarchar(50),
PaymentStatus nvarchar(50),
DateOfPurchase datetime,
Name nvarchar(200),
Address nvarchar(MAX),
PinCode nvarchar(10),
MobileNumber nvarchar(50),
CONSTRAINT [FK_tblPurchase_ToUser] FOREIGN KEY ([UserID]) REFERENCES [tblUsers]([UID])

)



CREATE TABLE tblOrders(
	[OrderID] [int] IDENTITY(1,1) NOT NULL primary key,
	[UserID] [int] NULL,
	[EMail] [nvarchar](max) NULL,
	[CartAmount] [money] NULL,
	
	[PaymentType] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[DateOfPurchase] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL,
	Constraint [FK_tblOrders_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([uid])

)




CREATE TABLE tblOrderProducts(
	[OrderProID] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderID] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[PID] [int] NULL,
	[Products] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
Constraint [FK_tblOrderProducts_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([uid])
)





CREATE TABLE tblOrderProduct(
	[OrderProdID] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderID] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[PID] [int] NULL,
	[Products] [nvarchar](max) NULL,
	[PPrice] [money] NULL,
	[SubPAmount]  AS ([PPrice]*[Quantity]),
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
Constraint [FK_tblOrderProduct_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([uid])
)
	-------------------------- stored procedure ----------------

---1
  CREATE PROCEDURE sp_InsertProduct(
@PName nvarchar(MAX),
@PPrice money,
@PTypeID int,
@PCategoryID int,
@PDescription nvarchar(MAX)
)
AS

insert into tblProducts values(@PName,@PPrice,@PTypeID,@PCategoryID,@PDescription) 
select SCOPE_IDENTITY()
Return 0


 
      delete from tblProductColorQuantity  

	  delete from tblProductImages

	  delete from tblProducts


create procedure procBindAllProducts
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B
order by A.PID desc

Return 0



 CREATE PROCEDURE SP_BindAllProducts
AS
SELECT A.*, B.*, A.PPrice, B.Name AS ImageName FROM tblProducts A

CROSS APPLY(
SELECT TOP 1 * FROM tblProductImages B WHERE B.PID = A.PID ORDER BY B.PID DESC
)B
ORDER BY A.PID DESC


CREATE PROCEDURE SP_BindProductDetails
(
@PID int
)
AS
SELECT * FROM tblProducts where PID = @PID



create PROCEDURE SP_BindProductImages
(
@PID int
)
AS
SELECT * FROM tblProductImages where PID = @PID


create PROCEDURE SP_BindCartNumberz
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID


create PROCEDURE SP_BindUserCart
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UID = @UserID


CREATE PROCEDURE SP_getUserCartItem
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart WHERE PID = @PID AND UID = @UserID


CREATE PROCEDURE SP_UpdateCart
(
@UserID int,
@CartPID int,
@Quantity int
)
AS
BEGIN
SET NOCOUNT ON;
UPDATE tblCart SET Qty = @Quantity WHERE PID = @CartPID AND UID = @UserID
END

go



CREATE PROCEDURE SP_DeleteThisCartItem
@CartID int
AS
BEGIN
DELETE FROM tblCart WHERE CartID = @CartID
END


CREATE PROCEDURE SP_IsProductExistInCart
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblCart where PID = @PID and UID = @UserID


CREATE PROCEDURE SP_InsertCart
(
@UID int,
@PID int,
@PName nvarchar(MAX),
@PPrice money,

@Qty int
)
AS
INSERT INTO tblCart VALUES(@UID,@PID,@PName,@PPrice,@Qty)
SELECT SCOPE_IDENTITY()



create function getColorName
   
   (
   @ColorID int
   )
   RETURNS Nvarchar(10)
   as
   Begin
   Declare @ColorName nvarchar(10)
 select @ColorName=ColorName from tblColors where ColorID=@ColorID
 
   RETURN @ColorName
   
   End


   CREATE PROCEDURE SP_BindPriceData
(
@UserID int
)
AS
SELECT * FROM tblCart D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name where D.UID = @UserID


CREATE PROCEDURE SP_FindOrderNumber @FindOrderNumber nvarchar(100)
AS
SELECT * FROM tblOrders WHERE OrderNumber = @FindOrderNumber


create PROCEDURE SP_BindCartProducts
(
@UID int
)
AS
SELECT PID FROM tblCart WHERE UID = @UID


CREATE PROCEDURE SP_InsertOrder
(
@UserID int,
@Email nvarchar(MAX),
@CartAmount money,

@PaymentType nvarchar(50),
@PaymentStatus nvarchar(50),
@DateOfPurchase datetime,
@Name nvarchar(200),
@Address nvarchar(MAX),
@MobileNumber nvarchar(50),
@OrderStatus nvarchar(50),
@OrderNumber nvarchar(50)
)
AS
INSERT INTO tblOrders VALUES(@UserID,@Email,@CartAmount,@PaymentType,@PaymentStatus,@DateOfPurchase,@Name,@Address,@MobileNumber,@OrderStatus,@OrderNumber)
SELECT SCOPE_IDENTITY()




CREATE PROCEDURE SP_InsertOrderProducts
(
@OrderID nvarchar(50),
@UserID int,
@PID int,
@Products nvarchar(MAX),
@Quantity int,
@OrderDate datetime,
@Status nvarchar(100)
)
AS
INSERT INTO tblOrderProducts VALUES (@OrderID,@UserID,@PID,@Products,@Quantity,@OrderDate,@Status)
SELECT SCOPE_IDENTITY()


CREATE PROCEDURE SP_EmptyCart
@UserID int
AS
BEGIN
DELETE FROM tblCart WHERE UID = @UserID
END



CREATE PROCEDURE SP_InsertOrderProd
(
@OrderID nvarchar(50),
@UserID int,
@PID int,
@Products nvarchar(MAX),
@PPrice money,

@Quantity int,
@OrderDate datetime,
@Status nvarchar(100)
)
AS
INSERT INTO tblOrderProduct VALUES (@OrderID,@UserID,@PID,@Products,@PPrice,@Quantity,@OrderDate,@Status)
SELECT SCOPE_IDENTITY()








create procedure [dbo].[procBindAllProductsBusiness]
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Деловые Сумки' 
order by A.PID desc

Return 0



create procedure [dbo].[procBindAllProductsPurse]
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Клачи' 
order by A.PID desc

Return 0


create procedure [dbo].[procBindAllProductsClassicalBags]
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Классические Сумки' 
order by A.PID desc

Return 0




create procedure [dbo].[procBindAllProductsBackpacks]
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Рюкзаки' 
order by A.PID desc

Return 0


create procedure [dbo].[procBindAllProductsHandBags]
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Детские сумочки' 
order by A.PID desc

Return 0



create procedure [dbo].[procBindAllProductsSchoolBags]
AS
select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A

inner join tblCategory as t2 on t2.CatID=A.PCategoryID
cross apply(
select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc
)B where t2.CatName='Школьный ассортимент' 
order by A.PID desc

Return 0






create PROCEDURE SP_BindUserOrder
(
@UserID int
)
AS
SELECT * FROM tblOrderProducts D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UserID = @UserID


CREATE PROCEDURE SP_getUserOrderItem
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblOrderProducts WHERE PID = @PID AND UserID = @UserID


create PROCEDURE SP_BindUserOrders
(
@UserID int
)
AS
SELECT * FROM tblOrderProduct D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblProductImages E WHERE E.PID = D.PID) Name WHERE D.UserID = @UserID


CREATE PROCEDURE SP_getUserOrderItems
(
@PID int,
@UserID int
)
AS
SELECT * FROM tblOrderProduct WHERE PID = @PID AND UserID = @UserID