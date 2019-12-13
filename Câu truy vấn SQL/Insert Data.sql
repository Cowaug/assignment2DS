use Ass2
go

INSERT INTO KhachHang VALUES ('KH000001',2,'4815791500755344','dang','12345','Đăng','An Giang','haha@gmail.com','2000-12-2','0981348200','M')
INSERT INTO KhachHang VALUES ('KH000002',0,null,'bao','10208','Bảo','Bến Tre','roymoore69@gmail.com','1975-3-9','0985154341','M')
INSERT INTO KhachHang VALUES ('KH000003',10,'4029581361209214','dung','60453','Dung','Hậu Giang','emmyurick12@gmail.com','1980-8-8','0986116800','F')

INSERT INTO NhanVien VALUES ('NV000001','Ke Toan','1986-1-1','945815364034','5000000','Trần','Thị','Dung','0339125641','Đà Nẵng','F','Hinh 1','61 Ung Văn Khiêm, p25, Bình Thạnh, TPHCM','dung.tran','pass1','dung.tran@assignment.com','KT')
INSERT INTO NhanVien VALUES ('NV000002','Quan Li','1991-5-6','401048117116','4000000','Lê','Văn','Tới','0369366644','Hà Nội','M','Hinh 2','180 Ung Văn Khiêm, p25, Bình Thạnh, TPHCM','toi.le','pass1','toi.le@assignment.com','QK')
INSERT INTO NhanVien VALUES ('NV000003','Ship','1996-12-12','599714905574','4000000','Nguyễn','Thanh','Liêm','0365082479','Cần Thơ','M','Hinh 3','180 Nguyễn Gia Trí, p25, Bình Thạnh, TPHCM','liem.nguyen','pass1','liem.nguyen@assignment.com','VC')
INSERT INTO NhanVien VALUES ('NV000004','Ship','1986-1-1','945862664034','5000000','Trần','Van','Dao','0339174841','Binh Thuan','M',null,'61 Ung Văn Khiêm, p25, Bình Thạnh, TPHCM','duduadi','pass1','dung.tran@assignment.com','VC')
INSERT INTO NhanVien VALUES ('NV000005','Ship','1981-3-6','402527117116','4000000','Lê','Hanh','Thong','0829363644','Phu Yen','M',null,'182 Ung Văn Khiêm, p25, Bình Thạnh, TPHCM','todihoc','pass1','toi.le@assignment.com','VC')
INSERT INTO NhanVien VALUES ('NV000006','Ship','1997-12-18','597295648574','4000000','Nguyễn','Thi','Ngoc','0849262479','Vung Tau','F',null,'180 Nguyễn Van Trí, p25, Tan Binh, TPHCM','liem.nguyenn2','pass1','liem.nguyen@assignment.com','VC')
INSERT INTO NhanVien VALUES ('NV000007','Ke Toan','1986-1-1','945862664034','5000000','Trần','Van','Dang','0332574841','Binh Thuan','M',null,'61 Ung Văn Khiêm, p25, Bình Thạnh, TPHCM','hihihi','pass1','dung.tran@assignment.com','KT')
INSERT INTO NhanVien VALUES ('NV000008','Ke Toan','1981-3-6','483648117116','7000000','Lê','Van','Teo','0949363644','Phu Yen','M',null,'182 Ung Văn Khiêm, p25, Bình Thạnh, TPHCM','hahaha','pass1','toi.le@assignment.com','KT')
INSERT INTO NhanVien VALUES ('NV000009','Ke Toan','1997-12-18','936275648574','8070000','Nguyễn','Hanh','Thao','0843572479','Gia Lai','F',null,'180 Nguyễn Van Trí, p25, Tan Binh, TPHCM','tennguoidung','pass1','liem.nguyen@assignment.com','KT')


INSERT INTO DoanhNghiep VALUES ('DN000000','Chưa có','','','', '','','')
INSERT INTO DoanhNghiep VALUES ('DN000001','PepsiCo','sales@pepsi.com','0970847831','Block 1, KCN Sóng Thần','Ngan hang OCB','Lớn','7139703561')
INSERT INTO DoanhNghiep VALUES ('DN000002','CoopMart','sales@coopamart.com','0984454760','199-205 Nguyễn Thái Học, Phường Phạm Ngũ Lão, Quận 1, Tp.HCM','Ngân hàng Vietcombank','Lớn','0846603013')
INSERT INTO DoanhNghiep VALUES ('DN000003','BigC','sales@BigC.com','0984446260','7 Nguyễn Thái Học, Phường Phạm Ngũ Lão, Quận 9, Tp.HCM','Ngân hàng Techcombank','Nho','0825793013')
INSERT INTO DoanhNghiep VALUES ('DN000004','Unilever','sales@Unilever.com','0726454760','112 Nguyễn Dinh Chieu, Quận 1, Tp.HCM','Ngân hàng OCB','Nho','0127403013')

INSERT INTO LoaiSanPham VALUES ('LSP00000','Khác',null)
INSERT INTO LoaiSanPham VALUES ('LSP00011','Bánh kẹo',null)
INSERT INTO LoaiSanPham VALUES ('LSP00012','Đồ hộp',null)
INSERT INTO LoaiSanPham VALUES ('LSP00013','Nước uống',null)
INSERT INTO LoaiSanPham VALUES ('LSP00001',N'Đồ chơi',null)
INSERT INTO LoaiSanPham VALUES ('LSP00002',N'thiết bị điện tử',null)
INSERT INTO LoaiSanPham VALUES ('LSP00003',N'Đồ gia dụng',null)

INSERT INTO DonHang VALUES ('HD000001',1,'2019-12-2',N'Hà Nội',500000)
INSERT INTO DonHang VALUES ('HD000002',0,'2019-10-9',N'Long An',300000)
INSERT INTO DonHang VALUES ('HD000003',1,'2017-1-11',N'Đồng Nai',600000)
INSERT INTO DonHang VALUES ('HD000004',0,'2008-1-11',N'Hoi An',700000)
INSERT INTO DonHang VALUES ('HD000005',1,'2018-9-11',N'Bien Hoa',860000)
INSERT INTO DonHang VALUES ('HD000006',1,'2019-12-16',N'Vung Tau',9070000)

INSERT INTO KhoHang VALUES ('KH000001','Kho 1','0726454761',N'50 kiện hàng','Block 2, KCN Sóng Thần')

INSERT INTO KeToan VALUES ('NV000001')
INSERT INTO KeToan VALUES ('NV000007')
INSERT INTO KeToan VALUES ('NV000008')
INSERT INTO KeToan VALUES ('NV000009')

INSERT INTO NguoiVanChuyen VALUES ('NV000003','A123')
INSERT INTO NguoiVanChuyen VALUES ('NV000004','A124')
INSERT INTO NguoiVanChuyen VALUES ('NV000005','A125')
INSERT INTO NguoiVanChuyen VALUES ('NV000006','A126')

INSERT INTO QuanKho VALUES ('NV000001','2019-1-1','KH000001',null)

INSERT INTO SanPham VALUES ('SP000011','Bánh Oreo',18000,'Ngon hơn khi dùng lạnh','80g','Sản xuất tại Việt Nam','LSP00001','2020-12-12')
INSERT INTO SanPham VALUES ('SP000012','Heo 2 lát',26000,'Dùng ngay hoặc hâm nóng bằng lo vi sóng','160g','Sản xuất tại Việt Nam','LSP00002','2021-6-6')
INSERT INTO SanPham VALUES ('SP000013','Pepsi',10000,'Ngon hơn khi ướp lạnh','500ml','Sản xuất bởi Pepsi Việt Nam','LSP00003','2019-12-31')
INSERT INTO SanPham VALUES ('SP000001',N'Robo biến hình',300000,N'Ấn nút dưới thân robo','1 Kg',N'Sản xuất tại Nhật Bản','LSP00001','2050-1-1')
INSERT INTO SanPham VALUES ('SP000002',N'Quạt trần Senko',500000,N'Sạc trước khi sử dụng','10 Kg',N'Sản xuất tại Nhật Bản','LSP00002','2099-1-1')
INSERT INTO SanPham VALUES ('SP000003',N'Bộ nồi Inox',100000,N'Rửa sau khi dùng','5 Kg',N'Sản xuất tại Việt Nam','LSP00003','2060-1-1')


INSERT INTO Dat VALUES ('KH000001','HD000001','2019-12-12')
INSERT INTO Dat VALUES ('KH000002','HD000002','2019-10-9')
INSERT INTO Dat VALUES ('KH000002','HD000003','2019-1-11')
INSERT INTO Dat VALUES ('KH000001','HD000004','2019-1-11')
INSERT INTO Dat VALUES ('KH000001','HD000005','2019-1-11')
INSERT INTO Dat VALUES ('KH000002','HD000006','2019-12-12')

INSERT INTO DonHangCoSanPham VALUES ('HD000001','SP000011')
INSERT INTO DonHangCoSanPham VALUES ('HD000001','SP000012')
INSERT INTO DonHangCoSanPham VALUES ('HD000002','SP000011')
INSERT INTO DonHangCoSanPham VALUES ('HD000003','SP000012')
INSERT INTO DonHangCoSanPham VALUES ('HD000002','SP000003')
INSERT INTO DonHangCoSanPham VALUES ('HD000003','SP000011')

INSERT INTO VanChuyen VALUES ('HD000001','NV000003')
INSERT INTO VanChuyen VALUES ('HD000002','NV000004')
INSERT INTO VanChuyen VALUES ('HD000003','NV000005')
INSERT INTO VanChuyen VALUES ('HD000004','NV000005')

INSERT INTO GiaoDich VALUES ('NV000001','DN000001')
INSERT INTO GiaoDich VALUES ('NV000001','DN000002')
INSERT INTO GiaoDich VALUES ('NV000007','DN000004')

INSERT INTO LichSuGiaoDich VALUES ('NV000001','DN000001','2019-6-11',2000000,N'Mua Hàng')
INSERT INTO LichSuGiaoDich VALUES ('NV000001','DN000002','2019-6-12',8000000,N'Mua Hàng')
INSERT INTO LichSuGiaoDich VALUES ('NV000007','DN000004','2019-6-12',26000000,N'Mua Hàng')

INSERT INTO DoanhNghiepCungCapSanPham VALUES ('SP000013','DN000001')
INSERT INTO DoanhNghiepCungCapSanPham VALUES ('SP000011','DN000002')
INSERT INTO DoanhNghiepCungCapSanPham VALUES ('SP000012','DN000002')
INSERT INTO DoanhNghiepCungCapSanPham VALUES ('SP000001','DN000002')
INSERT INTO DoanhNghiepCungCapSanPham VALUES ('SP000002','DN000002')
INSERT INTO DoanhNghiepCungCapSanPham VALUES ('SP000003','DN000002')

INSERT INTO LichSuCungCap VALUES ('SP000013','DN000001','2019-11-12')
INSERT INTO LichSuCungCap VALUES ('SP000011','DN000002','2019-12-12')
INSERT INTO LichSuCungCap VALUES ('SP000012','DN000002','2019-12-12')
INSERT INTO LichSuCungCap VALUES ('SP000001','DN000002','2019-11-12')
INSERT INTO LichSuCungCap VALUES ('SP000002','DN000002','2019-12-12')
INSERT INTO LichSuCungCap VALUES ('SP000003','DN000002','2019-11-12')

INSERT INTO KhoHangChuaSP VALUES ('SP000011','KH000001')
INSERT INTO KhoHangChuaSP VALUES ('SP000012','KH000001')
INSERT INTO KhoHangChuaSP VALUES ('SP000013','KH000001')
INSERT INTO KhoHangChuaSP VALUES ('SP000001','KH000001')
INSERT INTO KhoHangChuaSP VALUES ('SP000002','KH000001')
INSERT INTO KhoHangChuaSP VALUES ('SP000003','KH000001')

INSERT INTO LichSuKho VALUES ('SP000011','KH000001','2019-3-3','N')
INSERT INTO LichSuKho VALUES ('SP000012','KH000001','2019-3-3','N')
INSERT INTO LichSuKho VALUES ('SP000013','KH000001','2019-3-3','N')
INSERT INTO LichSuKho VALUES ('SP000001','KH000001','2019-3-3','N')
INSERT INTO LichSuKho VALUES ('SP000002','KH000001','2019-3-3','N')
INSERT INTO LichSuKho VALUES ('SP000003','KH000001','2019-3-3','N')