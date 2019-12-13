use Ass2
go

--Lấy danh sách các sản phẩm thuộc loại @lsp
drop function SanPhamThuocLoai
go

create function SanPhamThuocLoai (@lsp varchar(8))
RETURNS TABLE
AS
RETURN SELECT sp.* FROM SanPham as sp WHERE sp.MaLoai=@lsp
GO

SELECT *
FROM SanPhamThuocLoai('LSP00001')
ORDER BY GiaSP
GO


--Lấy danh sách các sản phẩm có giá nhỏ hơn @Gia
drop function SanPhamReHon
go

create function SanPhamReHon (@Gia int)
RETURNS TABLE
AS
RETURN
	SELECT * FROM SanPham WHERE GiaSP <= @Gia
GO

SELECT *
FROM SanPhamReHon(20000)
ORDER BY GiaSP
GO