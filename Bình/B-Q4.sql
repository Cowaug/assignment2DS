use Ass2
go

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

--########################
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

--###################

drop function SoSanPhamReHon
go

create function SoSanPhamReHon (@Gia int)
RETURNS TABLE
AS
BEGIN
	Declare @n int
	SELECT @n = COUNT(*) FROM SanPham WHERE GiaSP <= @Gia

	if @n < 0
		raiserror(N'Không tồn tại sản phẩm nào',1,1)
RETURN @n	
END
GO

SELECT *
FROM SanPhamReHon(20000)
ORDER BY GiaSP
GO
