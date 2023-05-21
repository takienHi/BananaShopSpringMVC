USE master
GO
CREATE DATABASE bananaStore;
GO
USE bananaStore;
GO

CREATE TABLE [Role] (
  roleId int not null IDENTITY(1,1),
  roleName nvarchar(50),
  PRIMARY KEY (roleId)
);

CREATE TABLE Employee (
  employeeId int not null IDENTITY(1,1),
  roleId int,
  fullName nvarchar(80),
  [address] nvarchar(200),
  gender bit not null,
  dateOfBirth date,
  phoneNumber varchar(12),
  email varchar(50),
  userName varchar(50),
  [password] varchar(50),
  avatar nvarchar(50),
  [status] bit not null,
  PRIMARY KEY (employeeId),
  CONSTRAINT FK_ChucVu FOREIGN KEY (roleId) REFERENCES [Role] (roleId)
);

CREATE TABLE Customer (
  customerId int not null IDENTITY(1,1),
  fullName nvarchar(80),
  [address] nvarchar(200),
  gender nvarchar(50),
  dateOfBirth date,
  phoneNumber varchar(12),
  email varchar(50),
  userName varchar(50),
  [password] varchar(50),
  [status] bit not null,
  PRIMARY KEY (customerId),
);

CREATE TABLE Category (
  categoryId int not null IDENTITY(1,1),
  categoryName nvarchar(100),
  [status] bit not null,
  PRIMARY KEY (categoryId)
);

CREATE TABLE Brand (
  brandId int not null IDENTITY(1,1),
  brandName nvarchar(100),
  brandImage varchar(200),
  [status] bit not null,
  PRIMARY KEY (brandId)

);

CREATE TABLE Product (
  productId int not null IDENTITY(1,1),
  categoryId int,
  brandId int,
  productName nvarchar(250),
  price float,
  quantity int,
  addedDate date,
  updateDate date,
  [description] nvarchar(max),
  [status] bit not null,
  PRIMARY KEY (productId),
  CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (categoryId) REFERENCES Category (categoryId),
  CONSTRAINT FK_SanPham_NhanHang FOREIGN KEY (brandId) REFERENCES Brand (brandId)
);

CREATE TABLE ProductImage (
  imgId int not null IDENTITY(1,1),
  productId int,
  linkImage varchar(200),
  [isMain] bit not null,
  PRIMARY KEY (imgId),
  CONSTRAINT FK_AnhSP_SanPham FOREIGN KEY (productId) REFERENCES Product (productId)
);

CREATE TABLE Orderr (
  orderId int not null IDENTITY(1,1),
  customerId int,
  fullName nvarchar(50),
  phoneNumber varchar(12),
  shippingAddress nvarchar(200),
  totalPrice float,
  dateCreated date,
  note nvarchar(200),
  [status] int,
  CONSTRAINT FK_Cusorder FOREIGN KEY (customerId) REFERENCES Customer (customerId),
  PRIMARY KEY (orderId)
);

CREATE TABLE OrderDetail (
  orderDetailId int not null IDENTITY(1,1),
  orderId int,
  productId int,
  quantity int,
  price float,
  PRIMARY KEY (orderDetailId),
  CONSTRAINT FK_CTHD FOREIGN KEY (orderId) REFERENCES Orderr (orderId),
  CONSTRAINT FK_OrderDetail_SanPham FOREIGN KEY (productId) REFERENCES product (productId)
);

CREATE TABLE Banner (
  bannerId int not null IDENTITY(1,1),
  title nvarchar(200),
  subTitle nvarchar(200),
  linkTo nvarchar(200),
  price float,
  PRIMARY KEY (bannerId)
);