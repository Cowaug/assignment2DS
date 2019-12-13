use Ass2
go

--1.

--------PROCEDURE 01------------
DROP PROC DANG_KY_NHAN_VIEN
Go

CREATE PROC DANG_KY_NHAN_VIEN
(
	@MaNhanVien		int,
	@BangCap			varchar(50),
	@NgaySinh		date,
	@CMND			int,
	@Luong			int,
	@Ho				varchar(50),
	@TenDem			varchar(50),
	@Ten				varchar(50),
	@SDT				char(10),
	@QueQuan			varchar(100),
	@GioiTinh		char(1),
	@HinhAnh			varchar(100),
	@DiaChi			varchar(100),
	@Username		varchar(50),
	@Pass			varchar(50),
	@DiaChiEmail	varchar(50),
	@LOAI			varchar(50)
)
AS
BEGIN
	if exists(SELECT CMND from NhanVien Where CMND = @CMND)
		BEGIN
			raiserror('Trung ma so CMND: %d',11,1,@CMND)
			return -1
		END

	if (@Luong < 0 )
		BEGIN
			raiserror('Nhap sai muc luong toi thieu: %d',11,1,@Luong)
			return -1
		END

	if CHARINDEX('@',@DiaChiEmail) <=0
		BEGIN
			raiserror('Email nhap vao khong hop le',11,1)
			return -1
		END

	if LEN(@Pass) < 6
		BEGIN
			raiserror('PassWord khong du dai',11,1)
			return -1
		END

	if LEN(@Pass) < 6
		BEGIN
			raiserror('PassWord khong du dai',11,1)
			return -1
		END

	else
	insert into NhanVien values (@MaNhanVien,@BangCap,@NgaySinh,@CMND,@Luong,@Ho,@TenDem,@Ten,@SDT,@QueQuan,@GioiTinh,@HinhAnh,@DiaChi,@Username,@Pass,@DiaChiEmail,@LOAI)
END
go

--------PROCEDURE 02------------
DROP PROC HIEN_THI_NHAN_VIEN_KETOAN
Go
CREATE PROCEDURE HIEN_THI_NHAN_VIEN_KETOAN
AS
BEGIN
	select * from NhanVien where LOAI = 'KT'
END
go

--2.

----TRIGGER 01--------
DROP TRIGGER them_nhan_vien
Go
CREATE TRIGGER them_nhan_vien ON NhanVien AFTER INSERT AS
BEGIN
	--DECLARE @temp varchar(50)
	--select @temp = a.lOAI from inserted AS a
	--IF(@temp = 'Ke Toan')
	BEGIN
		INSERT INTO KeToan (MaNhanVien) SELECT (a.MaNhanVien) from (select MaNhanVien from inserted where lOAI = 'Ke Toan') AS a
	END
	--IF(@temp = 'Quan Kho')
	BEGIN
		INSERT INTO QuanKho (MaNhanVien) SELECT (a.MaNhanVien) from (select MaNhanVien from inserted where lOAI = 'Quan Kho') AS a
	END
	--IF(@temp = 'Nguoi Van Chuyen')
	BEGIN
		INSERT INTO NguoiVanChuyen (MaNhanVien) SELECT (a.MaNhanVien) from (select MaNhanVien from inserted where lOAI = 'Nguoi Van Chuyen') AS a
	END
END


--------TRIGGER 02----------------
GO
DROP TRIGGER t_them_don_hang
Go
CREATE TRIGGER t_them_don_hang 
ON DonHang 
FOR INSERT 
AS
	IF((Select NgayXuatHoaDon From Inserted)<getdate())
		BEGIN
			PRINT 'Ngay xuat hoa don khong the truoc ngay hien tai'
			ROLLBACK TRAN
		END
--------------------------------


--3.
--a. 
SELECT dh.MaHoaDon, dh.TongGiaTien,vc.MaNhanVienVanChuyen
from DonHang dh, VanChuyen vc
where dh.MaHoaDon = vc.MaHoaDon
Order BY dh.MaHoaDon DESC, dh.TongGiaTien DESC, vc.MaNhanVienVanChuyen ASC


--b.
SELECT DoanhNghiep.Ten, COUNT(GiaoDich.MaDoanhNghiep) As SoLanGiaoDich 
from DoanhNghiep INNER JOIN GiaoDich ON DoanhNghiep.MaDoanhNghiep = GiaoDich.MaDoanhNghiep
Where Ten = 'PepsiCo'
Group BY Ten
Having COUNT(GiaoDich.MaDoanhNghiep) >0 
ORDER BY Ten DESC


SELECT TEMP_TABLE.MaLoai,COUNT(TEMP_TABLE.MaSanPham) As LuotBan
from (SELECT SanPham.MaLoai,SanPham.TenSP, DonHangCoSanPham.MaSanPham from DonHangCoSanPham left outer join SanPham ON DonHangCoSanPham.MaSanPham = SanPham.MaSP) AS TEMP_TABLE
Where TEMP_TABLE.MaLoai = 'LSP00001' OR TEMP_TABLE.MaLoai = 'LSP00002'
GROUP BY TEMP_TABLE.MaLoai
HAVING COUNT(MaSanPham) > 0
ORDER BY LuotBan ASC


--4.
go
--------FUNCTION 01--------------
DROP FUNCTION DEM_SL_DON_HANG
Go
CREATE FUNCTION DEM_SL_DON_HANG
(
@MasoKhachHang		char(8)
)
RETURNS INT AS
BEGIN
	IF EXISTS (select * from KhachHang where MasoKhachHang = @MasoKhachHang)
		BEGIN 
			declare @cnt INT
			select @cnt = KH.SoDonHangDaMua
			from KhachHang KH
			where KH.MasoKhachHang = @MasoKhachHang
			return @cnt
		END
	else
	BEGIN
	declare @cntt INT = -1
	END
	return @cntt
END
---------------------------------


go
--------FUNCTION 02--------------
DROP FUNCTION KIEM_TRA_TIEN_THEO_NGAY
Go
CREATE FUNCTION KIEM_TRA_TIEN_THEO_NGAY
(
@CHECK int
)
RETURNS @temp TABLE
(
	NgayDat date,
	Tien_Trong_Ngay int
)
AS
BEGIN
	IF(@CHECK > 0)
	insert into @temp select * from 
	(
	select Bang_Tam.NgayDat, SUM(Bang_Tam.TongGiaTien) as Tien_Trong_Ngay
	from
	(select Dat.NgayDat,DonHang.TongGiaTien 
	from DonHang 
	inner join Dat on DonHang.MaHoaDon = Dat.MaHoaDon) AS Bang_Tam
	GROUP BY Bang_Tam.NgayDat
	HAVING SUM(Bang_Tam.TongGiaTien) >= @CHECK
	) as e

 return 

END


go

DROP PROC HIEN_THI_TAT_CA_NV
Go
CREATE PROCEDURE HIEN_THI_TAT_CA_NV
AS
BEGIN
	select * from NhanVien
END