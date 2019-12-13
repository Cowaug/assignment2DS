--CREATE DATABASE Ass2
--GO

DROP TABLE LichSuCungCap
DROP TABLE DoanhNghiepCungCapSanPham
DROP TABLE LichSuKho
DROP TABLE KhoHangChuaSP
DROP TABLE LichSuGiaoDich
DROP TABLE GiaoDich
DROP TABLE DonHangCoSanPham
DROP TABLE Dat
DROP TABLE VanChuyen
DROP TABLE SanPham
DROP TABLE NguoiVanChuyen
DROP TABLE QuanKho
DROP TABLE KeToan

DROP TABLE DoanhNghiep
DROP TABLE LoaiSanPham
DROP TABLE NhanVien
DROP TABLE KhachHang
DROP TABLE DonHang
DROP TABLE KhoHang
GO

USE Ass2
GO

CREATE TABLE KhachHang(
	MasoKhachHang char(8) not null	primary key,
	SoDonHangDaMua int,
	MaTaiKhoanNganHang	char(16),
	Username varchar(50) not null,
	Pass varchar(50) not null,
	Ten varchar(50) not null,
	DiaChi varchar(100)	not null,
	Email varchar(50) not null,
	NgaySinh date not null,
	SDT char(10) not null,
	GioiTinh char(1) not null	CHECK (GioiTinh IN('M','F'))
)
GO

CREATE TABLE DonHang(
	MaHoaDon char(20) not null	primary key,
	TinhTrangThanhToan	varchar(3) not null,
	NgayXuatHoaDon date not null,
	DiaChi varchar(100)	not null,
	TongGiaTien int not null
)
GO

CREATE TABLE VanChuyen(
	MaHoaDon char(20) not null	primary key,
	MaNhanVienVanChuyen	char(8) not null,
	FOREIGN KEY(MaHoaDon) REFERENCES dbo.DONHANG(MaHoaDon)
)
GO

CREATE TABLE NhanVien(
	MaNhanVien char(8) not null	primary key,
	BangCap varchar(50),
	NgaySinh date not null,
	CMND varchar(12) not null,
	Luong int not null,
	Ho varchar(50) not null,
	TenDem varchar(50) not null,
	Ten varchar(50) not null,
	SDT char(10) not null,
	QueQuan varchar(100) not null,
	GioiTinh char(1) not null	CHECK (GioiTinh IN('M','F')),
	HinhAnh varchar(100) ,
	DiaChi varchar(100)	not null,
	Username varchar(50) unique not null,
	Pass varchar(50) not null,
	Email varchar(50) not null,
	Loai char(2) not null	CHECK (Loai IN('KT','QK','VC'))
)	
GO

CREATE TABLE LoaiSanPham(
	MaLoai char(8) not null	primary key,
	TenLoai varchar(50) not null,
	MaGiamGia varchar(50),
	
)
GO

CREATE TABLE SanPham(
	MaSP char(8) not null	primary key,
	TenSP varchar(100)	not null,
	GiaSP int not null,
	HDSD varchar(150)	not null,
	TrongLuong varchar(100)	not null,
	ThongTinMoTa	varchar(150)	not null,
	MaLoai char(8) not null,
	HanSuDung date not null,
	FOREIGN KEY(MaLoai) REFERENCES dbo.LoaiSanPham(MaLoai)
)
GO

CREATE TABLE KhoHang(
	MaKho char(8) not null	primary key,
	TenKho varchar(50) not null,
	SDTKho varchar(10) not null,
	SucChua		varchar(50) not null,
	DiaChiKho	varchar(100)	not null
)
GO

CREATE TABLE DoanhNghiep(
	MaDoanhNghiep char(8) not null primary key,
	Ten varchar(50)		not null,
	Email varchar(50)		not null,
	SDTBanHang varchar(10)		not null,
	DiaChi varchar(100)	not null,
	ThongTinNganHang	varchar(150)	not null,
	LoaiHinhDoanhNghiep	varchar(100)	not null,
	MaSoThue char(10)		not null
)
GO

CREATE TABLE KeToan(
	MaNhanVien	char(8)		not null	primary key,
	FOREIGN KEY(MaNhanVien) REFERENCES dbo.NhanVien(MaNhanVien)
)
GO

CREATE TABLE QuanKho(
	MaNhanVien	char(8) not null primary key,
	NgayBatDau	date,
	MaKhoHang	char(8),
	MaNVQuanLy	char(8),
	constraint NVQuanLy foreign key (MaNVQuanLy) references QuanKho(MaNhanVien) on delete no action
)
GO

CREATE TABLE NguoiVanChuyen(
	MaNhanVien	char(8) not null primary key,
	MaBangLai	char(8),
	FOREIGN KEY(MaNhanVien) REFERENCES dbo.NhanVien(MaNhanVien)
)
GO

CREATE TABLE Dat(
	MaKhachHang	char(8)		not null, 
	MaHoaDon	char(20)		not null,
	NgayDat		date	not null,
	primary key (MaKhachHang,MaHoaDon),
	constraint fk_dat_maKhach foreign key (MaKhachHang) references KhachHang(MasoKhachHang) on delete no action,
	constraint fk_dat_MaHoaDon foreign key (MaHoaDon) references DonHang(MaHoaDon) on delete no action
)
GO

CREATE TABLE DonHangCoSanPham(
	MaHoaDon	char(20) not null,
	MaSanPham	char(8) not null,
	primary key (MaHoaDon,MaSanPham),
	constraint fk_oderProduct_MaHoadon foreign key (MaHoaDon) references DonHang(MaHoaDon) on delete no action,
	constraint fk_oderProduct_MaSanPham foreign key (MaSanPHam) references SanPham(MaSP) on delete no action
)
GO

CREATE TABLE GiaoDich(
	MaNhanVienKeToan	char(8) not null, 
	MaDoanhNghiep		char(8) not null,
	constraint fk_GiaoDich_NV foreign key (MaNhanVienKeToan) references KeToan(MaNhanVien) on delete no action,
	constraint fk_GiaoDich_DoanhNghiep foreign key (MaDoanhNghiep) references DoanhNghiep(MaDoanhNghiep) on delete no action
)
GO

CREATE TABLE LichSuGiaoDich(
	MaNhanVienKeToan	char(8)				not null,
	MaDoanhNghiep		char(8)				not null,
	Ngay date			not null,
	SoTien int not null,
	NoiDung varchar(150)	not null,
	primary key (MaNhanVienKetoan,MaDoanhNghiep,Ngay,SoTien,NoiDung),
	constraint fk_LichSuGiaoDich_KeToan foreign key (MaNhanVienKeToan) references KeToan(MaNhanVien) on delete no action,
	constraint fk_LichSuGiaoDich_DN foreign key (MaDoanhNghiep) references DoanhNghiep(MaDoanhNghiep) on delete no action,
)
GO

CREATE TABLE KhoHangChuaSP(
	MaSP		char(8) not null,
	MaKhoHang	char(8) not null,
	constraint fk_KhoChuaSP_SP foreign key (MaSP) references SanPham(MaSP) on delete no action,
	constraint fk_KhoChuaSP_Kho foreign key (MaKhoHang) references KhoHang(MaKho) on delete no action,
)
GO

CREATE TABLE LichSuKho(
	MaSP char(8) not null,
	MaKhoHang	char(8)		not null,
	Ngay date	not null,
	NhapXuat	char(1)			not null	CHECK (NhapXuat IN('N','X')),
	primary key (MaSP, MaKhoHang, Ngay,NhapXuat),
	constraint fk_LichSuKho_SP foreign key (MaSP) references SanPham(MaSP) on delete no action,
	constraint fk_LichSuKho_Kho foreign key (MaKhoHang) references KhoHang(MaKho) on delete no action,
)
GO

CREATE TABLE DoanhNghiepCungCapSanPham(
	MaSP char(8) not null,
	MaDoanhNghiep	char(8)		not null,
	constraint fk_DoanhNghiepCungCap_SP foreign key (MaSP) references SanPham(MaSP) on delete no action,
	constraint fk_DoanhNghiepCungCap_DN foreign key (MaDoanhNghiep) references DoanhNghiep(MaDoanhNghiep) on delete no action
)
GO

CREATE TABLE LichSuCungCap(
	MaSP char(8) not null,
	MaDoanhNghiep	char(8)		not null,
	Ngay date	not null,
	primary key (MaSP, MaDoanhNghiep, Ngay),
	constraint fk_LichSuCungCap_SP foreign key (MaSP) references SanPham(MaSP) on delete no action,
	constraint fk_LichSuCungCap_DN foreign key (MaDoanhNghiep) references DoanhNghiep(MaDoanhNghiep) on delete no action,
)
GO

