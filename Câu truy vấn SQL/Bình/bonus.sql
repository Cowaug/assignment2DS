



drop trigger XoaSanPham
go

create trigger XoaSanPham on SanPham
instead of delete
as
begin
	delete from KhoHangChuaSP
	where MaSP in (select d.MaSP from deleted as d)

	delete from LichSuKho
	where MaSP in (select d.MaSP from deleted as d)

	delete from DoanhNghiepCungCapSanPham
	where MaSP in (select d.MaSP from deleted as d)

	delete from LichSuCungCap
	where MaSP in (select d.MaSP from deleted as d)

	delete from SanPham
	where MaSP in (select d.MaSP from deleted as d)
end;
go



---- procedure cho câu 5 // ko phải câu 1
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
	raiserror(N'Sản phẩm quá hạn sử dụng',15,1)

ELSE IF @MaSP is null or @TenSP is null or @GiaSP < 0 or @HDSD is null or @TrongLuong is null or @ThongTinMoTa is null or @MaLoai is null or @HanSuDung is null
raiserror('Thông tin nhập không hợp lệ',15,1)

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
