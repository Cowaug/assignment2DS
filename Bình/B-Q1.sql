use Ass2
GO

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
	raiserror(N'Sản phẩm quá hạn sử dụng',1,1)
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

exec ThemSanPham @MaSP ='SP000099',
						@TenSP ='12',
						@GiaSP = 125000,
						@HDSD = 'Bánh quy',
						@TrongLuong ='100g',
						@ThongTinMoTa ='Không',
						@MaLoai ='LSP00001',
						@HanSuDung= '2018-1-1';
Go



drop proc HienSanPhamConHanSuDungItHon
go

create proc HienSanPhamConHanSuDungItHon @SoNgay int
AS
select * from SanPham As sp
where DATEDIFF(day,GETDATE(),sp.HanSuDung) < @SoNgay and DATEDIFF(day,GETDATE(),sp.HanSuDung) > 0
go



exec HienSanPhamConHanSuDungItHon @SoNgay = 100;
go

















-- procedure cho câu 5 // ko phải câu 1
DROP PROC CapNhatSanPham
GO

CREATE PROC CapNhatSanPham @MaSP char(8),
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
	raiserror(N'Sản phẩm quá hạn sử dụng',1,1)
ELSE
	update SanPham
	set TenSP=@TenSP ,
		GiaSP=@GiaSP ,
		HDSD=@HDSD ,
		TrongLuong=@TrongLuong ,
		ThongTinMoTa=@ThongTinMoTa ,
		MaLoai=@MaLoai ,
		HanSuDung=@HanSuDung
	where MaSP=@MaSP
END
GO
