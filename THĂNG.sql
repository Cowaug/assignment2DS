use Ass2
go

--1.

------------PROCEDURE 01----------------
DROP PROC them_don_Hang
Go
CREATE PROCEDURE them_don_Hang
(
	@MaHoaDon			char(20),
	@TinhTrangThanhToan	varchar(3),
	@NgayXuatHoaDon		date,
	@DiaChi				varchar(100),
	@TongGiaTien		int
)
AS 
BEGIN
	if (@TongGiaTien < 0 )
		BEGIN
			raiserror('Sai Tong gia tien toi thieu: %d',16,1,@TongGiaTien)
			return -1
		END

	if (@TinhTrangThanhToan != 'Yes' AND @TinhTrangThanhToan != 'No')
		BEGIN
			raiserror('Tinh trang thanh toan phai la Yes hoac No',16,1)
			return -1
		END

	if (@NgayXuatHoaDon < GETDATE())
		BEGIN
			raiserror('Hoa Don Phai Xuat Trong Khi Hoac Sau Khi Nhap Don Hang',16,1)
			return -1
		END
	else
	insert into DonHang values (@MaHoaDon,@TinhTrangThanhToan,@NgayXuatHoaDon,@DiaChi,@TongGiaTien)
END

----------------------------------------
go
DROP PROC HIEN_THI_HOA_DON_TU_NGAY
Go
------------PROCEDURE 02----------------
CREATE PROCEDURE HIEN_THI_HOA_DON_TU_NGAY
(@day date)
AS
BEGIN
	select * from DonHang where NgayXuatHoaDon > @day
END

----------------------------------------

go
DROP TRIGGER xoa_nhan_vien
Go
--2.
----TRIGGER 01--------
CREATE TRIGGER xoa_nhan_vien ON NhanVien INSTEAD OF DELETE AS
BEGIN
	
	--if((select x.lOAI from deleted AS x) = 'Ke Toan')
	BEGIN
		DELETE FROM KeToan 
		WHERE MaNhanVien IN 
		(SELECT MaNhanVien from deleted where lOAI = 'Ke toan')
	END

	--if((select x.lOAI from deleted AS x) = 'Quan Kho')
	BEGIN
		DELETE FROM QuanKho 
		WHERE MaNhanVien IN 
		(SELECT MaNhanVien from deleted where lOAI = 'Quan Kho')
	END

	--if((select x.lOAI from deleted AS x) = 'Nguoi Van Chuyen')
	BEGIN
		DELETE FROM NguoiVanChuyen 
		WHERE MaNhanVien IN 
		(SELECT MaNhanVien from deleted where lOAI = 'Nguoi Van Chuyen')
	END

	DELETE FROM NhanVien 
	WHERE MaNhanVien IN (SELECT MaNhanVien from deleted)
END
----------------------
go
DROP TRIGGER KIEM_TRA_TUOI_NV
Go
--------TRIGGER 02----------------
CREATE TRIGGER KIEM_TRA_TUOI_NV
ON NhanVien after insert
as
begin
 declare @tuoi_nvmoi int
 set @tuoi_nvmoi = ( select year(getdate())-year(NgaySinh) as tuoi_nv from inserted)
 if (@tuoi_nvmoi > 45)
     begin 
            print (' Canh bao nhan vien > 45 tuoi')
     end
end
------------------------------


--3.
--a.

SELECT dn.Ten,dn.DiaChi,dn.LoaiHinhDoanhNghiep,lscc.Ngay
from DoanhNghiep dn, LichSuCungCap lscc
where dn.MaDoanhNghiep = lscc.MaDoanhNghiep
Order BY dn.Ten ASC ,dn.DiaChi ASC ,dn.LoaiHinhDoanhNghiep DESC ,lscc.Ngay DESC



--b.

select temp.Ho,temp.TenDem,temp.Ten, COUNT(temp.MaNhanVienVanChuyen) as So_Lan_Ship_Hang
from
(select NhanVien.Ho,NhanVien.TenDem,NhanVien.Ten,VanChuyen.MaNhanVienVanChuyen,NhanVien.Luong from NhanVien,VanChuyen where NhanVien.MaNhanVien = VanChuyen.MaNhanVienVanChuyen) as temp
GROUP by temp.Ho,temp.TenDem,temp.Ten
HAVING COUNT(MaNhanVienVanChuyen) > 1
ORDER BY So_Lan_Ship_Hang ASC


select Bang_Tam.NgayDat, SUM(Bang_Tam.TongGiaTien) as Tong_Tien
from
(select Dat.NgayDat,DonHang.TongGiaTien 
from DonHang,Dat where DonHang.MaHoaDon = Dat.MaHoaDon) AS Bang_Tam
GROUP BY Bang_Tam.NgayDat
HAVING SUM(Bang_Tam.TongGiaTien) > 5
ORDER BY Tong_Tien DESC

go
--4.
--------FUNCTION 01--------------
DROP FUNCTION TIM_THEO_TUOI
Go
CREATE FUNCTION TIM_THEO_TUOI
( 
@age int
)
returns @temp TABLE
(
	MaNhanVien char(8),
	Ten			varchar(50)
)
AS
BEGIN
	IF(@age > 0)
	BEGIN 
	declare @a int = YEAR(GETDATE()) - @age
	insert into @temp select MaNhanVien,Ten from NhanVien where YEAR(NhanVien.NgaySinh) = @a
	END
	else insert into @temp values('Error','Error')
	return
END

---------------------------------
go
--------FUNCTION 02--------------
DROP FUNCTION PHAN_LOAI_NGHE
GO
CREATE FUNCTION PHAN_LOAI_NGHE
(
@NGANH varchar(50)  
)
returns @temp TABLE
(
	MaNhanVien char(8),
	Ho			varchar(50),
	TenDem			varchar(50),
	Ten			varchar(50)
)
AS
BEGIN
	if(@NGANH = 'KT')
	BEGIN
	insert into @temp select MaNhanVien,Ho,TenDem,Ten from NhanVien where Loai = 'KT'
	return
	END
	
	if(@NGANH = 'QK')
	BEGIN
	insert into @temp select MaNhanVien,Ho,TenDem,Ten from NhanVien where Loai = 'QK'
	return 
	END

	if(@NGANH = 'VC')
	BEGIN
	insert into @temp select MaNhanVien,Ho,TenDem,Ten from NhanVien where Loai = 'VC'
	return
	END
	insert into @temp values('Error','Error','Error','Error')
	return
END
