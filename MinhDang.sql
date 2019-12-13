use Ass2
go


-----------------------Câu 1-------------------------------
drop proc DK_Email
go

CREATE PROC DK_Email 
@MasoKhachHang char(8) ,
@SoDonHangDaMua		int,
@MaTaiKhoanNganHang	char(16),
@Username	varchar(50) ,
@Pass		varchar(50) ,
@Ten			varchar(50) ,
@DiaChi		varchar(100)	,
@Email		varchar(50) ,
@NgaySinh	date ,
@SDT			char(10) ,
@GioiTinh char(1) 
AS 
BEGIN  
	if CHARINDEX('@',@Email)<=0
		begin
		raiserror(N'Email không hợp lệ',1,1)
		return -1
		end
	if	exists(select MasoKhachHang from KhachHang where MasoKhachHang=@MasoKhachHang)
		begin
		raiserror(N'Trùng mã Khách hàng: %d',1,1,@MasoKhachHang)
		return -1
		end
	if	exists(select Username from KhachHang where Username=@Username)
		begin
		raiserror(N'Trùng tên đăng nhập: %d',1,1,@Username)
		return -1
		end
INSERT INTO KhachHang VALUES (
@MasoKhachHang, 		
@SoDonHangDaMua,
@MaTaiKhoanNganHang,
@Username,
@Pass,
@Ten,
@DiaChi,
@Email,
@NgaySinh,
@SDT,
@GioiTinh
)
END

EXEC DK_Email @MasoKhachHang='KH000010', @SoDonHangDaMua=2, @MaTaiKhoanNganHang='4815791500755344', @Username='dang', 
@Pass='12345', @Ten=N'Huy',@DiaChi=N'An Giang',@Email='huygmail.com', @NgaySinh='2000-10-15', @SDT='0981348200',@GioiTinh='M'
GO


----Procedure 2
drop proc ShowEmail
go

CREATE PROC ShowEmail 
AS
begin
SELECT Email FROM dbo.KhachHang
end
GO

EXEC ShowEmail 

-----------------------Câu 2-------------------------
drop trigger KiemTraNamSinh
go
CREATE TRIGGER KiemTraNamSinh ON KhachHang INSTEAD OF INSERT 
AS
BEGIN 
	DECLARE @temp date
	select @temp=a.NgaySinh from inserted as a
	if ((YEAR(GETDATE())-YEAR(@temp))>=15)
		begin
			insert into KhachHang select * from inserted
		end
	else
		raiserror(N'Khách hàng dưới 15 tuổi',1,1)
END 
GO

INSERT INTO KhachHang VALUES ('KH000011',2,'4815791500755344','dang','12345','Đăng','An Giang','haha@gmail.com','2015-12-2','0981348200','M')

------Trigger 2
drop trigger NgayGiaoDich
go
CREATE TRIGGER NgayGiaoDich
ON LichSuGiaoDich
FOR INSERT 
AS
	IF((Select Ngay From Inserted)>getdate())
		BEGIN
			PRINT N'Lỗi ngày giao dịch trước ngày hiện tại'
			ROLLBACK TRAN
		END 

------------------------câu 3---------------------------------------
--hiển thị các email khách hàng có số lượng đơn hàng giảm dần
select a.MasoKhachHang,a.Email,count(a.MaHoaDon)
from (SELECT Email,MasoKhachHang,MaHoaDon from KhachHang,Dat where MasoKhachHang=MaKhachHang ) as a
group by a.MasoKhachHang,a.Email order by a.MasoKhachHang DESC 

--hiển thị email khách hàng có số đơn hàng lơn hơn 1
select Email,MasoKhachHang, count(MaHoaDon) as SLDH
from KhachHang,Dat where KhachHang.MasoKhachHang = Dat.MaKhachHang
group by KhachHang.Email,KhachHang.MasoKhachHang having count(MaHoaDon)>1

------------Câu 4-----------------
go
drop FUNCTION KhachHangNhoHon
go
CREATE FUNCTION KhachHangNhoHon( @a INT )
RETURNS int
AS
begin
	declare @temp int;
	set @temp=(select count(*) from (select NgaySinh from KhachHang where ((YEAR(GETDATE())-YEAR(NgaySinh))<@a)) as tabletemp)
	
	return @temp
end
go

---------Câu 2---------

drop FUNCTION KhachHangFunc
go

create function KhachHangFunc (@Ma char(8))
RETURNS TABLE
AS
RETURN
	SELECT * FROM KhachHang WHERE MasoKhachHang=@Ma

GO
select * from dbo.KhachHangFunc('KH000001') 
GO



