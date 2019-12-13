use Ass2
go

--Lấy sản phẩm được cung cấp tháng trước
select sp.MaSP, sp.TenSP from SanPham as sp,LichSuCungCap as ls
where sp.MaSP = ls.MaSP and datediff(MONTH,ls.Ngay,GETDATE()) = 1
order by sp.MaSP
go

--Lấy tổng giá trị mỗi loại hàng
select l.MaLoai,l.TenLoai,sum(sp.GiaSP)
from SanPham as sp,LoaiSanPham as l
where sp.MaLoai=l.MaLoai
group by l.MaLoai,l.TenLoai
having sum(sp.GiaSP) > 10000
go

--Lấy giá trị hàng mà doanh nghiệp cung cấp
select dn.MaDoanhNghiep,dn.Ten,sum(sp.GiaSP)
from SanPham as sp, DoanhNghiepCungCapSanPham as dncc,DoanhNghiep as dn
where sp.MaSP = dncc.MaSP and dncc.MaDoanhNghiep = dn.MaDoanhNghiep
group by dn.MaDoanhNghiep,dn.Ten
having sum(sp.GiaSP) > 100
go