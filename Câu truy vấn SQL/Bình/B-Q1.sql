use Ass2
GO

-- Thêm sản phẩm
DROP PROC ThemSanPham
GO

CREATE PROC ThemSanPham @MaSP char(8),
						@TenSP varchar(100),
						@GiaSP int,
						@HDSD varchar(150),
						@TrongLuong varchar(100),
						@ThongTinMoTa varchar(150),
						@MaLoai char(8),
						@HanSuDung date
AS
BEGIN
IF cast(@HanSuDung as date) <= cast(GETDATE() as date)
	RAISERROR(N'Sản phẩm quá hạn sử dụng',15,1)

ELSE IF @MaSP is null or @TenSP is null or @GiaSP < 0 or @HDSD is null or @TrongLuong is null or @ThongTinMoTa is null or @MaLoai is null or @HanSuDung is null
raiserror('Thông tin nhập không hợp lệ',15,1)

ELSE
	INSERT INTO SanPham VALUES (
						@MaSP,
						@TenSP ,
						@GiaSP ,
						@HDSD ,
						@TrongLuong ,
						@ThongTinMoTa ,
						@MaLoai ,
						@HanSuDung
						)
END
GO

-- kiểm tra khi thêm sản phẩm quá hạn
exec ThemSanPham @MaSP ='SP000099',
						@TenSP ='12',
						@GiaSP = 125000,
						@HDSD = 'Bánh quy',
						@TrongLuong ='100g',
						@ThongTinMoTa ='Không',
						@MaLoai ='LSP00001',
						@HanSuDung= '2018-1-1';
Go

-- kiểm tra khi thêm sản phẩm sai cách
exec ThemSanPham @MaSP ='SP000099',
						@TenSP ='12',
						@GiaSP = 125000,
						@HDSD = 'Bánh quy',
						@TrongLuong = null,
						@ThongTinMoTa ='Không',
						@MaLoai ='LSP00001',
						@HanSuDung= '2020-1-1';
Go


-- Hiện sản phẩm có hạn sử dụng còn ít hơn @Songay
drop proc HienSanPhamConHanSuDungItHon
go

create proc HienSanPhamConHanSuDungItHon @SoNgay int
AS
IF @SoNgay < 0
raiserror('Số ngày không hợp lệ',15,1)

select * from SanPham As sp
where DATEDIFF(day,GETDATE(),sp.HanSuDung) < @SoNgay
go

-- Kiểm tra khi nhập số ngày sai
exec HienSanPhamConHanSuDungItHon @SoNgay = -1;
go

-- -- Kiểm tra khi nhập số ngày đúng
exec HienSanPhamConHanSuDungItHon @SoNgay = 100;
go