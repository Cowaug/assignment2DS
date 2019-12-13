use Ass2
go

-- Gán doanh nghiệp cung cấp sản phẩm mặc định khi thêm sản phẩm
drop trigger DoanhNghiepCungCapMacDinhKhiThemSanPham
go

create TRIGGER DoanhNghiepCungCapMacDinhKhiThemSanPham on SanPham for insert
as
			DECLARE @i VARCHAR(8)

			select @i = MaSP
			from inserted

			INSERT INTO DoanhNghiepCungCapSanPham VALUES (@i,'DN000000')
go

-- Kiểm tra bảng DoanhNghiepCungCapSanPham
INSERT INTO SanPham VALUES ('SP000092',N'Bò 2 lát',30000,'Dùng ngay hoặc hâm nóng bằng lo vi sóng','160g','Sản xuất tại Việt Nam','LSP00002','2021-6-6')
SELECT * FROM DoanhNghiepCungCapSanPham WHERE MaSP = 'SP000092'
go

-- Gán loại sản phẩm mặc định khi xóa loại sản phẩm
drop trigger XoaLoaiSanPham
go

create trigger XoaLoaiSanPham on LoaiSanPham
instead of delete
as
begin
	update SanPham
	set MaLoai = 'LSP00000'
	where MaLoai in (select d.MaLoai from deleted as d)
	delete from LoaiSanPham
	where MaLoai in (select d.MaLoai from deleted as d) and MaLoai <> 'LSP00000'
end;
go

-- Kiểm tra loại sản phẩm trên bảng SanPham
INSERT INTO SanPham VALUES ('SP000093',N'Bò 2 lát',30000,'Dùng ngay hoặc hâm nóng bằng lo vi sóng','160g','Sản xuất tại Việt Nam','LSP00002','2021-6-6')
delete from LoaiSanPham where MaLoai = 'LSP00002'
SELECT * FROM SanPham WHERE MaSP = 'SP000093'
go