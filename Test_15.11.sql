create database CT_LuongTuong
go
use CT_LuongTuong
go
--
create table TAIKHOAN ( username varchar(20) primary key not null,
						pass varchar(20) not null
						)
--
create table NHACUNGCAP (MaNCC varchar(10) not null, 
						 TenNCC nvarchar(200) not null,
						 NCC_MaThue char(30) not null,
						 NCC_DiaChi nvarchar(200) not null,
						 NCC_SDT varchar(10) not null, 
						 NCC_STK varchar(20),
						 NCC_TenNH nvarchar (20),
						 primary key (MaNCC))
go
--
create table HANGHOA (MaHang varchar(20) not null,
					  TenHang nvarchar(50) not null,
					  SoLuongHH int default 0,
					  DVT varchar(20) not null,
					  DonGiaBan numeric(15) not null,
					  primary key (MaHang))
go
--
create table CUAHANG (MaNV varchar(20) not null,
					  TenNV nvarchar(50) not null,
					  CH_MaThue char(30) not null,
					  CH_SDT varchar(15) not null,
					  CH_DiaChi nvarchar(200) not null,
					  CH_SoTK varchar(20),
					  CH_TenNH nvarchar (20),
					  primary key (MaNV))
go
--
go
create table KHACHHANG(MaKH varchar(20) not null,
					   TenKH nvarchar(50) not null,
					   KH_GioiTinh nvarchar(5), -- (0 : nữ) -- (1 : nam)
					   KH_DiaChi nvarchar(200) not null,
					   KH_SDT varchar(10) not null,
					   primary key (MaKH))
go
--
create table HOADONBAN (MaDonBH varchar(20) not null,
						MaNV varchar(20) not null,
						MaKH varchar(20) not null,
						NgayBan date not null,
						primary key (MaDonBH),
						foreign key (MaKH) references KhachHang,
						foreign key (MaNV) references CuaHang)
go
--
create table HOADONBANCHITIET ( MaDonBH varchar(20) not null,
								MaHang varchar(20) not null,
								SoLuongBan int not null,
								primary key(MaDonBH,MaHang),
								foreign key (MaDonBH) references HOADONBAN,
								foreign key (MaHang) references HangHoa)
go
--
create table HOADONNHAP(MaDonNH varchar(20) not null,
						MaNCC varchar(10) not null,
						MaNV varchar(20) not null,
						TiSuatCK nvarchar(10),
						VAT nvarchar(10),
						NgayNhap date not null,
						primary key (MaDonNH),
						foreign key (MaNCC) references NhaCungCap,
						foreign key (MaNV) references CuaHang)
go
--
create table HOADONNHAPCHITIET(MaDonNH varchar(20) not null,
								MaHang varchar(20) not null,
								DonGiaNhap numeric(15) not null,
								SoLuongNhap int not null,
								--Tien_CK numeric(15),
								--Tien_VAT numeric(15),
								HinhThucTT nvarchar(20) not null,
								primary key(MaDonNH,MaHang),
								foreign key (MaDonNH) references HoaDonNhap,
								foreign key (MaHang) references HangHoa)
go
--

insert into NHACUNGCAP (MaNCC, TenNCC, NCC_MaThue, NCC_DiaChi, NCC_SDT, NCC_STK, NCC_TenNH)
values
('1001', N'Công ty TNHH MTV TM và XD Quang Vinh', '0600964334', N'Đường 10, xã Yên Bằng, huyện Ý Yên, tỉnh Nam Định', 
'0912563135', '2311100191008', N'Ngân hàng MB') 
go
--
insert into HANGHOA(MaHang, TenHang, DVT, DonGiaBan)
values
('G001', N'Gỗ Lim', 'm3', 24000000),
('G002', N'Gỗ Hương', 'm3', 21000000),
('G003', N'Gỗ Vàng Chăng', 'm3', 22000000),
('G004', N'Gỗ Dỗi', 'm3', 23000000),
('G005', N'Gỗ Mít', 'm3', 10000000),
('G006', N'Gỗ Trắc Lai', 'm3', 9000000),
('G007', N'Gỗ Tali', 'm3', 36000000),
('G008', N'Gỗ Đỏ', 'm3', 70000000)
--
insert into CUAHANG(MaNV, TenNV, CH_MaThue, CH_SDT, CH_DiaChi)
values
('NV001',N'Đặng Thị Mỹ Duyên','3100922966','0523514716',N'Thôn Phù Ninh, Xã Quảng Thanh, huyện Quảng Trạch, tỉnh Quảng Bình')
--
insert into KHACHHANG(MaKH, TenKH, KH_GioiTinh, KH_DiaChi, KH_SDT)
values
('KH2021',N'Bùi Xuân Yến',0,N'Ba Đồn, Quảng Bình','0905123456'),
('KH2022',N'Nguyễn Thành Đạt',1,N'Quảng Trạch, Quảng Bình','0905654321'),
('KH2023',N'Lê Thị Thu',0,N'Minh Hóa, Quảng Bình','0905477477'),
('KH2024',N'Trần Văn Đức',1,N'Đồng Hới, Quảng Bình','0905333555'),
('KH2025',N'Ngô Minh Huy',1,N'Lệ Thủy, Quảng Bình','0905424242')
--
insert into HOADONBAN(MaDonBH, MaKH, MaNV, NgayBan)
values
('HD001','KH2021','NV001','2021-01-06'),
('HD002','KH2022','NV001','2021-05-28'),
('HD003','KH2023','NV001','2021-08-11'),
('HD004','KH2024','NV001','2021-09-22'),
('HD005','KH2025','NV001','2021-10-23')
go
--
insert into HOADONBANCHITIET(MaDonBH, MaHang, SoLuongBan)
values
('HD001','G001', 8),
('HD002','G002', 7),
('HD003','G003', 3),
('HD004','G004', 10),
('HD005','G005', 5)
--
insert into HOADONNHAP(MaDonNH, MaNCC, MaNV, TiSuatCK, VAT, NgayNhap)
values
('MD001','1001','NV001',0.1 ,0.1,'2021-08-30'),
('MD002','1001','NV001',0.1 ,0.1,'2021-09-15'),
('MD003','1001','NV001',0.1 ,0.1,'2021-09-30'),
('MD004','1001','NV001',0.1 ,0.1,'2021-10-15'),
('MD005','1001','NV001',0.1 ,0.1,'2021-10-30')
--
insert into HOADONNHAPCHITIET(MaDonNH, MaHang, DonGiaNhap, SoLuongNhap, HinhThucTT)
values
('MD001', 'G001', 24000000, 20, 'CK'),
('MD002', 'G002', 21000000, 25, 'CK'),
('MD003', 'G003', 22000000, 20, 'CK'),
('MD004', 'G004', 23000000, 15, 'CK'),
('MD005', 'G005', 10000000, 10, 'CK')
--
alter table KHACHHANG
add KH_GC bit default 0
--
alter table CuaHang
add NV_GC bit default 0
--
alter table NhaCungCap
add NCC_GC bit default 0
--
--
--
select * from TAIKHOAN
select * from NHACUNGCAP
select * from HOADONNHAP
select * from CUAHANG
select * from HOADONBANCHITIET
select * from HANGHOA
select * from HOADONNHAPCHITIET
select * from HOADONBAN
select * from KHACHHANG
--
--
--
--
--
--1. Tính số lượng hàng hóa bảng HANGHOA của đơn nhập và bán
-- NHẬP
-- Nếu nhập thêm hàng hóa thì SoLuongHH = SoLuongHH + inserted.SoLuongNhap
-- Sửa thì SoLuongHH = SoLuongHH - deleted.SoLuongNhap + inserted.SoLuongNhap
-- Xóa thì SoLuongHH = SoLuongHH - deleted.SoLuongNhap
-- Bán
-- Nếu bán hàng hóa thì SoLuongHH = SoLuongHH - SoLuongBan
-- Sửa thì SoLuongHH = SoLuongHH + deleted.SoLuongNhap - inserted.SoLuongNhap
-- Xóa thì SoLuongHH = SoLuongHH + deleted.SoLuongNhap 
--
--------------------------------------------------|
--					HOADONNHAP					  |
--------------------------------------------------|
-- Thêm hóa đơn nhập ( nhập thêm )
go
create trigger tgNhapThemHH
on HOADONNHAPCHITIET 
after insert
as
begin
	declare @SoLuongHH int
	select @SoLuongHH = SoLuongHH from HANGHOA
	if @SoLuongHH is null
	begin
		set @SoLuongHH = 0 
	end
	update HANGHOA
	set SoLuongHH = @SoLuongHH + inserted.SoLuongNhap
	from HANGHOA join inserted on HANGHOA.MaHang = inserted.MaHang
	where HANGHOA.MaHang = inserted.MaHang
end
go
--
insert into HOADONNHAPCHITIET(MaDonNH, MaHang, DonGiaNhap, SoLuongNhap, HinhThucTT)
values
('MD004', 'G006', 9000000, 12,'CK')
--
select * from HOADONNHAPCHITIET
select * from HANGHOA 
--
alter table HOADONNHAPCHITIET
enable trigger tgNhapThemHH
--
update HANGHOA
set SoLuongHH = (select sum(SoLuongNhap) from HOADONNHAPCHITIET where HANGHOA.MaHang = HOADONNHAPCHITIET.MaHang)
--
-- Sửa SoLuongNhap
go
create trigger tgSuaSoLuongNhap
on HOADONNHAPCHITIET 
after update
as
begin
	update HANGHOA
	set SoLuongHH = SoLuongHH - deleted.SoLuongNhap + inserted.SoLuongNhap
	from HANGHOA join inserted on HANGHOA.MaHang = inserted.MaHang
				 join deleted on HANGHOA.MaHang = deleted.MaHang
	where HANGHOA.MaHang = inserted.MaHang and HANGHOA.MaHang = deleted.MaHang
end
go
--test
update HOADONNHAPCHITIET
set SoLuongNhap = '5' where MaHang = 'G003' and MaDonNH = 'MD001'
--
-- Xóa hóa đơn nhập
go
create trigger tgXoaSoLuongNhap
on HOADONNHAPCHITIET
after delete
as
begin
	update HANGHOA
	set SoLuongHH = SoLuongHH - deleted.SoLuongNhap
	from HANGHOA join deleted on HANGHOA.MaHang = deleted.MaHang
	where HANGHOA.MaHang = deleted.MaHang
end
go
--test
delete HOADONNHAPCHITIET where MaDonNH = 'MD001' and MaHang = 'G003'
--
select * from HOADONNHAPCHITIET
select * from HANGHOA 
--
--------------------------------------------------|
--					HOADONBAN					  |
--------------------------------------------------|
--Thêm hóa đơn bán
go
create trigger tgThemHoaDonBan
on HOADONBANCHITIET 
after insert
as
begin
	update HANGHOA
	set SoLuongHH = SoLuongHH - inserted.SoLuongBan
	from HANGHOA join inserted on HANGHOA.MaHang = inserted.MaHang
	where HANGHOA.MaHang = inserted.MaHang
end
go
--test
insert into HOADONBANCHITIET(MaDonBH, MaHang, SoLuongBan)
values
('HD001','G004', '100')
--
-- Sửa hóa đơn bán
go
create trigger tgSuaHoaDonBan
on HOADONBANCHITIET 
after update
as
begin
	update HANGHOA
	set SoLuongHH = SoLuongHH + deleted.SoLuongBan - inserted.SoLuongBan 
	from HANGHOA join inserted on HANGHOA.MaHang = inserted.MaHang
				 join deleted on HANGHOA.MaHang = deleted.MaHang
	where HANGHOA.MaHang = inserted.MaHang and HANGHOA.MaHang = deleted.MaHang
end
go
--test
update HOADONBANCHITIET
set SoLuongBan = '10' where MaDonBH = 'HD001' and MaHang = 'G003'
--
select * from HOADONBANCHITIET
select * from HANGHOA 
--
-- Xóa hóa đơn bán
go
create trigger tgXoaHoaDonBan
on HOADONBANCHITIET
after delete
as
begin
	update HANGHOA
	set SoLuongHH = SoLuongHH + deleted.SoLuongBan
	from HANGHOA join deleted on HANGHOA.MaHang = deleted.MaHang
	where HANGHOA.MaHang = deleted.MaHang
end
go
--test
delete HOADONBANCHITIET where MaDonBH = 'HD001' and MaHang = 'G003'
--
--
--------------------------------------------------|
--						TAIKHOAN				  |
--------------------------------------------------|
--2. Hiển thị, thêm, sửa, xóa bảng tài khoản
-- Hiển thị tất cả tài khoản
go
create function fShowTK()
returns @ShowTK table ( username varchar(30), pass varchar(20))
as
begin
	insert into @ShowTK
		select * from TAIKHOAN
	return
end
go
--test
select username as N'Tên đăng nhập', pass as N'Mật khẩu' from dbo.fShowTK()
--
select * from TAIKHOAN
--
-- Kiểm tra trùng tên tài khoản
go
create function fTestAddTK (@username varchar(20))
returns bit
as
begin
	declare @count int
	set @count = (select count(username) from TAIKHOAN where username = @username)

	if @count > 0
		return 1
	return 0
end
go
--
-- Thêm tài khoản
go
create proc spAddTK (@username varchar(20), @pass varchar(20))
as
begin
	insert into TAIKHOAN values (@username, @pass)
end
go
--
-- Đổi password
go
create proc spUpdatePassword (@username varchar(20), @pass varchar(20))
as
begin
	update TAIKHOAN
	set pass = @pass
	where username = @username
end
go
--
exec spUpdatePassword 'ahihi','2'
--
-- Xóa Tài khoản
go
create proc spDeleteTK (@username varchar(20))
as
begin
	delete TAIKHOAN where username = @username
end
go
--
insert into TAIKHOAN values ('admin', '123456')
--
select * from TAIKHOAN
--
--------------------------------------------------|
--					AUTO TĂNG MÃ				  |
--------------------------------------------------|
--
-- MÃ KHÁCH HÀNG
go
alter function fNewMaKH ()
returns varchar(20)
as
begin
	declare @NewMaKH varchar(15), @count int

	set @count = (select count(MaKH) from KHACHHANG)
	if @count < 1
	begin
		set @NewMaKH = 'KH' + '2001'
	end
	else
	begin
		set @NewMaKH = (select max(right(MaKH,4))+1 from KHACHHANG)
		set @NewMaKH = 'KH' + @NewMaKH
	end
	return @NewMaKH
end
go
--
select dbo.fNewMaKH()
--
select * from KHACHHANG
--
-- MÃ ĐƠN BÁN HÀNG
go
create function fNewMaDonBH ()
returns varchar(20)
as
begin
	declare @NewMaDonBH varchar(15), @count int

	set @count = (select count(MaDonBH) from HOADONBAN)
	if @count < 1
	begin
		set @NewMaDonBH = 'HD' + '001'
	end
	else
	begin
		set @NewMaDonBH = (select max(right(MaDonBH,3))+1 from HOADONBAN)
		set @NewMaDonBH = 'HD' + right(replicate('0',2) + @NewMaDonBH,3)
	end
	return @NewMaDonBH
end
go
--
select dbo.fNewMaDonBH()
--
select * from HOADONBAN
--
-- MÃ HÀNG
go
create function fNewMaHang ()
returns varchar(20)
as
begin
	declare @NewMaHang varchar(15), @count int

	set @count = (select count(MaHang) from HANGHOA)
	if @count < 1
	begin
		set @NewMaHang = 'G' + '001'
	end
	else
	begin
		set @NewMaHang = (select max(right(MaHang,3))+1 from HANGHOA)
		set @NewMaHang = 'G' + right(replicate('0',2) + @NewMaHang,3)
	end		
	return @NewMaHang
end
go
--
select dbo.fNewMaHang()
select * from HANGHOA 
--
-- MÃ ĐƠN NHẬP HÀNG
go
create function fNewMaDonNH ()
returns varchar(20)
as
begin
	declare @NewMaDonNH varchar(15), @count int

	set @count = (select count(MaDonNH) from HOADONNHAP)
	if @count < 1
	begin
		set @NewMaDonNH = 'MD' + '001'
	end
	else
	begin
		set @NewMaDonNH = (select max(right(MaDonNH,3))+1 from HOADONNHAP)
		set @NewMaDonNH = 'MD' + right(replicate('0',2) + @NewMaDonNH,3)
	end		
	return @NewMaDonNH
end
go
--
select dbo.fNewMaDonNH()
select * from HOADONNHAP 
--
-- MÃ NHÀ CUNG CẤP
go
create function fNewMaNCC ()
returns varchar(20)
as
begin
	declare @NewMaNCC varchar(15), @count int

	set @count = (select count(MaNCC) from NHACUNGCAP)
	if @count < 1
	begin
		set @NewMaNCC = '1001'
	end
	else
	begin
		set @NewMaNCC = (select max(MaNCC)+1 from NHACUNGCAP)
	end		
	return @NewMaNCC
end
go
--
select dbo.fNewMaNCC()
select * from NHACUNGCAP
--
-- MÃ NHÂN VIÊN
go
alter function fNewMaNV ()
returns varchar(20)
as
begin
	declare @NewMaNV varchar(15), @count int

	set @count = (select count(MaNV) from CUAHANG)
	if @count < 1
	begin
		set @NewMaNV = 'NV' + '001'
	end
	else
	begin
		set @NewMaNV = (select max(right(MaNV,3))+1 from CUAHANG)
		set @NewMaNV = 'NV' + right(replicate('0',2) + @NewMaNV,3)
	end		
	return @NewMaNV
end
go
--
select dbo.fNewMaNV()
select * from CUAHANG
--
--
--------------------------------------------------|
--					KHACHHANG					  |
--------------------------------------------------|
-- THÊM MỚI KHÁCH HÀNG	
go
alter proc spAddKhachHang(@TenKH nvarchar(50), @KH_GioiTinh bit = 0, @KH_DiaChi nvarchar(200), @KH_SDT varchar(12))
as
begin
	declare @count int = 0
	set @count = (select count(KH_SDT) from KHACHHANG where KH_SDT = @KH_SDT)
	if @count < 1
	begin
		insert into KHACHHANG(MaKH,TenKH,KH_GioiTinh,KH_DiaChi,KH_SDT) values (dbo.fNewMaKH(), @TenKH, @KH_GioiTinh, @KH_DiaChi, @KH_SDT) 
	end
end
go 
--
exec spAddKhachHang N'Nguyễn Đình Tín', 1, N'Đà Nẵng', '0905424249'
--
-- SỬA THÔNG TIN KHÁCH HÀNG
go
alter proc spUpdateKhachHang(@MaKH varchar(10), @TenKH nvarchar(50), @KH_GioiTinh bit = 0, @KH_DiaChi nvarchar(200), @KH_SDT varchar(12),@KH_GC bit =0)
as
begin
	update KHACHHANG
	set TenKH = @TenKH, KH_GioiTinh = @KH_GioiTinh, KH_DiaChi = @KH_DiaChi, KH_SDT = @KH_SDT, KH_GC = @KH_GC
	where MaKH = @MaKH
end
go
--
exec spUpdateKhachHang 'KH2026', N'Đặng Thị Mỹ Duyên', 0, N'Quảng Bình', '0367367367', '0'
--
-- XÓA THÔNG TIN KHÁCH HÀNG
go
create trigger tgDeleteKhachHang
on KhachHang
instead of delete
as
begin
	update KHACHHANG
	set KH_GC = 1 where MaKH = (select MaKH from deleted)
end
go
--
go
create proc spDeleteKhachHang(@MaKH varchar(10))
as
begin
	delete KHACHHANG where MaKH = @MaKH
end
go

exec spDeleteKhachHang 'KH2021'
--
-- HIỂN THỊ KHÁCH HÀNG
go
alter proc spShowKhachHang
as
begin
		select MaKH as N'Mã khách hàng', TenKH as N' Tên khách hàng', (case when KH_GioiTinh = 0 then N'Nữ'
																			when KH_GioiTinh = 1 then N'Nam'
																			else N'Khác'
																		end) as N'Giới tính',
																	 KH_DiaChi as N'Địa chỉ', KH_SDT as N'Số điện thoại',
																	 (case when KH_GC = 0 or KH_GC is null then N''
																		   when KH_GC = 1 then N'Đã xóa' end) as N'Tình trạng'
		from KHACHHANG
end
go
--
exec spShowKhachHang
--
select * from KHACHHANG
--
--
--------------------------------------------------|
--					HÓA ĐƠN BÁN					  |
--------------------------------------------------|
--
-- THÊM HÓA ĐƠN BÁN
go
alter proc spAddHoaDonBan (@MaNV varchar(10), @MaKH varchar(10), @NgayBan date)
as
begin
	declare @DemNV int = 0, @DemKH int = 0, @KH_GC bit, @NV_GC bit
	set @DemNV = (select count(MaNV) from CUAHANG where MaNV = @MaNV)
	set @DemKH = (select count(MaKH) from KHACHHANG where MaKH = @MaKH)
	set @KH_GC = (select KH_GC from KHACHHANG where MaKH = @MaKH) 
	set @NV_GC = (select NV_GC from CUAHANG where MaNV = @MaNV) 

	if @DemNV > 0 and @DemKH > 0 and @NgayBan < getdate() and (@KH_GC = 0 or @KH_GC is null) and (@NV_GC =0 or @NV_GC is null)
	begin 
		insert into HOADONBAN values ((select dbo.fNewMaDonBH()),@MaNV, @MaKH, @NgayBan)
	end
end
go
--
exec spAddHoaDonBan 'NV001', 'KH2021','2021-10-25'
--
-- SỬA HÓA ĐƠN BÁN
go
alter proc spUpdateHoaDonBan (@MaDonBH varchar(10), @MaNV varchar(10), @MaKH varchar(10), @NgayBan date)
as
begin
	declare @DemNV int = 0, @DemKH int = 0, @KH_GC bit, @NV_GC bit
	set @DemNV = (select count(MaNV) from CUAHANG where MaNV = @MaNV)
	set @DemKH = (select count(MaKH) from KHACHHANG where MaKH = @MaKH)
	set @KH_GC = (select KH_GC from KHACHHANG where MaKH = @MaKH) 
	set @NV_GC = (select NV_GC from CUAHANG where MaNV = @MaNV) 

	if @DemNV > 0 and @DemKH > 0 and @NgayBan < getdate() and (@KH_GC = 0 or @KH_GC is null) and (@NV_GC =0 or @NV_GC is null)
	begin 
		update HOADONBAN 
		set MaNV = @MaNV, MaKH = @MaKH, NgayBan = @NgayBan
		where MaDonBH = @MaDonBH
	end
end
go
--
select * from HOADONBAN
--
exec spUpdateHoaDonBan 'HD003', 'NV001', 'KH2025', '2021-10-30'
--
-- XÓA HÓA ĐƠN BÁN
go
create proc spDeleteHoaDonBan (@MaDonBH varchar(10))
as
begin
	begin transaction

	delete HOADONBANCHITIET where MaDonBH = @MaDonBH
	delete HOADONBAN where MaDonBH = @MaDonBH

	if @@ROWCOUNT > 0
	begin
		commit transaction
	end
	else
	begin
		rollback transaction
	end
end
go
--
exec spDeleteHoaDonBan 'HD005'
--
-- HIỂN THỊ HÓA ĐƠN BÁN
go
alter proc spShowHoaDonBan
as
begin
	select HOADONBAN.MaDonBH as N'Mã hóa đơn bán',MaNV as N'Mã nhân viên', MaKH as N'Mã khách hàng', NgayBan as N'Ngày bán hàng', sum(HOADONBANCHITIET.SoLuongBan * HANGHOA.DonGiaBan) as N'Tổng tiền bán'
	from HOADONBAN join HOADONBANCHITIET on HOADONBAN.MaDonBH = HOADONBANCHITIET.MaDonBH
					join HANGHOA on HOADONBANCHITIET.MaHang = HANGHOA.MaHang
	group by HOADONBAN.MaDonBH,MaNV,MaKH,NgayBan
end
go
--
exec spShowHoaDonBan
--
select * from HOADONBAN
--
--
--------------------------------------------------|
--			HÓA ĐƠN BÁN	CHI TIẾT				  |
--------------------------------------------------|
--
-- THÊM HÓA ĐƠN BÁN CHI TIẾT
go
alter proc spAddHoaDonBanChiTiet(@MaDonBH varchar(10), @MaHang varchar(10), @SoLuongBan int)
as
begin
	declare @SLHH int = 0
	set @SLHH = (select SoLuongHH from HANGHOA where MaHang = @MaHang)
	if @SoLuongBan <= @SLHH
	begin
		insert into HOADONBANCHITIET values (@MaDonBH, @MaHang, @SoLuongBan)
	end
end
go
--
exec spAddHoaDonBanChiTiet 'HD002','G001','1'
--
-- SỬA HÓA ĐƠN BÁN CHI TIẾT
go
alter proc spUpdateHoaDonBanChiTiet (@MaDonBH varchar(10), @MaHang varchar(10), @SoLuongBan int)
as
begin
	declare @SLHH int = 0
	set @SLHH = (select SoLuongHH from HANGHOA where MaHang = @MaHang)
	if @SoLuongBan <= @SLHH 
	begin
		update HOADONBANCHITIET
		set SoLuongBan = @SoLuongBan
		where MaHang = @MaHang and MaDonBH = @MaDonBH
	end	
end
go
--
exec spUpdateHoaDonBanChiTiet 'HD001' ,'G006','5'
--
-- XÓA HÓA ĐƠN BÁN CHI TIẾT
go
create proc spDeleteHoaDonBanChiTiet (@MaDonBH varchar(10), @MaHang varchar(10))
as
begin
	delete HOADONBANCHITIET where MaHang = @MaHang and MaDonBH = @MaDonBH 
end
go
--
exec spDeleteHoaDonBanChiTiet 'HD002','G001'
--
-- HIỂN THỊ HÓA ĐƠN BÁN CHI TIẾT
go
create proc spShowHoaDonBanChiTiet
as
begin
	select MaDonBH as N'Mã hóa đơn bán', HOADONBANCHITIET.MaHang as N'Mã hàng', SoLuongBan as N'Số lượng bán', (HOADONBANCHITIET.SoLuongBan * HANGHOA.DonGiaBan) as N'Thành tiền bán'
	from HOADONBANCHITIET join HANGHOA on HOADONBANCHITIET.MaHang = HANGHOA.MaHang
end
go
--
exec spShowHoaDonBanChiTiet
exec spShowHoaDonBan
--
select * from HOADONBAN
select * from HOADONBANCHITIET where MaDonBH = 'HD001'
select * from HANGHOA
--
--------------------------------------------------|
--						HÀNG HÓA				  |
--------------------------------------------------|
--
-- THÊM HÀNG HÓA
go
create proc spAddHangHoa(@TenHang nvarchar(50), @SoLuongHH int, @DVT varchar(10), @DonGiaBan numeric(18))
as
begin
	insert into HANGHOA values (dbo.fNewMaHang(), @TenHang, @SoLuongHH, @DVT, @DonGiaBan)
end
go
--
exec spAddHangHoa N'Gỗ Óc Chó','','m3','35000000'
--
--update HANGHOA set SoLuongHH = '0' where SoLuongHH is null
--
--SỬA HÀNG HÓA
go
create proc spUpdateHangHoa (@MaHang varchar(10), @TenHang nvarchar(50), @SoLuongHH int, @DVT varchar(10), @DonGiaBan numeric(18))
as
begin
	update HANGHOA
	set TenHang = @TenHang, SoLuongHH = @SoLuongHH, DVT = @DVT, DonGiaBan = @DonGiaBan
	where MaHang = @MaHang
end
go
--
exec spUpdateHangHoa 'G005', N'Gỗ Mít', '15','m3', '10000000'
--
--XÓA HÀNG HÓA
--go
--create proc spDeleteHangHoa (@MaHang varchar(10))
--as
--begin
--	delete HANGHOA where MaHang = @MaHang
--end
--go
--
go
create trigger tgDeleteHangHoa
on HANGHOA
instead of delete
as
begin
	update HANGHOA
	set SoLuongHH = 0 where MaHang = (select MaHang from deleted)
end
go
-- test
exec spDeleteHangHoa 'G008'
--
-- HIỂN THỊ HÀNG HÓA
go
create proc spShowHangHoa
as
begin
	select MaHang as N'Mã hàng', TenHang as N'Tên hàng', SoLuongHH as N'Số lượng hàng hóa', DVT as N'Đơn vị tính', DonGiaBan as N'Đơn giá bán'
	from HANGHOA
end
go
--
exec spShowHangHoa
--
select * from HANGHOA
--
--
--------------------------------------------------|
--					CỬA HÀNG					  |
--------------------------------------------------|
--
-- THÊM CỬA HÀNG
go
alter proc spAddCuaHang (@TenNV nvarchar(50))
as
begin
	declare @CH_MaThue char(30), @CH_SDT varchar(12), @CH_DiaChi nvarchar(200), @CH_SoTK varchar(20), @CH_TenNH nvarchar(100), @NV_GC bit = 0

	select @CH_MaThue = CH_MaThue, @CH_SDT = CH_SDT, @CH_DiaChi = CH_DiaChi, @CH_SoTK = CH_SoTK, @CH_TenNH = CH_TenNH
	from CUAHANG

	insert into CUAHANG values(dbo.fNewMaNV(), @TenNV, @CH_MaThue, @CH_SDT, @CH_DiaChi, @CH_SoTK, @CH_TenNH, @NV_GC)
end
go
--
Exec spAddCuaHang N'Nguyễn Đình Tín'
--
-- SỬA CỬA HÀNG
go
alter proc spUpdateCuaHang (@MaNV varchar(10),@TenNV nvarchar(50), @CH_MaThue char(30), @CH_SDT varchar(12), @CH_DiaChi nvarchar(200), @CH_SoTK varchar(20), @CH_TenNH nvarchar(100), @NV_GC bit = 0)
as
begin
	update CUAHANG
	set TenNV = @TenNV,
		CH_MaThue = @CH_MaThue,
		CH_SDT = @CH_SDT,
		CH_DiaChi = @CH_DiaChi,
		CH_SoTK = @CH_SoTK,
		CH_TenNH = @CH_TenNH,
		NV_GC = @NV_GC
	where MaNV = @MaNV
end
go
--
exec spUpdateCuaHang 'NV002',N'Ngô Thị Tú Trinh' , '3100922966', '0523514716', N'Thôn Phù Ninh, Xã Quảng Thanh, huyện Quảng Trạch, tỉnh Quảng Bình','0','',''
--
go
create trigger tgDeleteCuaHang
on CUAHANG
instead of delete
as
begin
	update CUAHANG
	set NV_GC = 1 where MaNV = (select MaNV from deleted)
end
go
-- XÓA CỬA HÀNG
go
create proc spDeleteCuaHang (@MaNV varchar(10))
as
begin
	delete CUAHANG where MaNV = @MaNV
end
go
--
exec spDeleteCuaHang 'NV002'
--
select * from CUAHANG
--
-- HIỂN THỊ CỬA HÀNG
go
alter proc spShowCuaHang
as
begin
	select MaNV as N'Mã nhân viên',
		   TenNV as N'Tên nhân viên',
		   CH_MaThue as N'Mã thuế cửa hàng',
		   CH_SDT as N'Số điện thoại cửa hàng',
		   CH_DiaChi as N'Địa chỉ cửa hàng',
		   CH_SoTK as N'Số tài khoản cửa hàng',
		   CH_TenNH as N'Tên ngân hàng',
		   (case when NV_GC = 0 or NV_GC is null then N''
				 when NV_GC = 1 then N'Đã xóa' end) as N'Tình trạng'
	from CUAHANG
end
go
--
exec spShowCuaHang
--
--------------------------------------------------|
--				NHÀ CUNG CẤP					  |
--------------------------------------------------|
--
-- THÊM NHÀ CUNG CẤP
go
alter proc spAddNCC (@TenNCC nvarchar(200), @NCC_MaThue varchar(20), @NCC_DiaChi nvarchar(200), @NCC_SDT varchar(12), @NCC_STK varchar(20), @NCC_TenNH nvarchar(100), @NCC_GC bit = 0)
as
begin
	insert into NHACUNGCAP values (dbo.fNewMaNCC(), @TenNCC, @NCC_MaThue, @NCC_DiaChi, @NCC_SDT, @NCC_STK, @NCC_TenNH, @NCC_GC)
end
go 
--
exec spAddNCC N'Công ty TNHH MTV TM và XD Phi Phai','0367123569', 'Lào Cai', '0367123567', '2311100191009', 'MB Bank',''
--
-- SỬA NHÀ CUNG CẤP
go
alter proc spUpdateNCC (@MaNCC varchar(10),@TenNCC nvarchar(200), @NCC_MaThue varchar(20), @NCC_DiaChi nvarchar(200), @NCC_SDT varchar(12), @NCC_STK varchar(20), @NCC_TenNH nvarchar(100), @NCC_GC bit =0)
as
begin
	update NHACUNGCAP 
	set TenNCC = @TenNCC,
		NCC_MaThue = @NCC_MaThue,
		NCC_DiaChi = @NCC_DiaChi,
		NCC_SDT = @NCC_SDT,
		NCC_STK = @NCC_STK,
		NCC_TenNH = @NCC_TenNH,
		NCC_GC = @NCC_GC
	where MaNCC = @MaNCC
end
go
--
exec spUpdateNCC '1002',N'Công ty TNHH MTV TM và XD Vissai Ninh Bình','0367123568', 'Ninh Bình', '0467123566', '2311100191010', 'MB Bank',''
--
--XÓA NHÀ CUNG CẤP
--
go
create trigger tgDeleteNCC
on NHACUNGCAP
instead of delete
as
begin
	update NHACUNGCAP
	set NCC_GC = 1 where MaNCC = (select MaNCC from deleted)
end
go
--
go
create proc spDeleteNCC(@MaNCC varchar(10))
as
begin
	delete NHACUNGCAP where MaNCC = @MaNCC
end
go
--
exec spDeleteNCC '1003'
--
-- HIỂN THỊ NHÀ CUNG CẤP
go
alter proc spShowNCC
as
begin
	select MaNCC as N'Mã nhà cung cấp', 
		   TenNCC as N'Tên nhà cung cấp', 
		   NCC_MaThue as N'Mã thuế nhà cung cấp', 
		   NCC_DiaChi as N'Địa chỉ nhà cung cấp', 
		   NCC_SDT as N'Số điện thoại nhà cung cấp', 
		   NCC_STK as N'Số tài khoản nhà cung cấp', 
		   NCC_TenNH as N'Tên ngân hàng',
		   (case when NCC_GC = 0 or NCC_GC is null then N''
				 when NCC_GC = 1 then N'Đã xóa' end) as N'Trạng thái'
	from NHACUNGCAP
end
go
--
exec spShowNCC
--
select * from NHACUNGCAP
--
select MaNCC from NhaCungCap
--
--------------------------------------------------|
--				HÓA ĐƠN NHẬP					  |
--------------------------------------------------|
--
-- THÊM HÓA ĐƠN NHẬP
go
create proc spAddHoaDonNhap (@MaNCC varchar(10), @MaNV varchar(10), @TiSuatCK varchar(10), @VAT varchar(10), @NgayNhap date)
as
begin
	declare @countMaNCC int = 0, @countMaNV int = 0, @NV_GC bit = 0, @NCC_GC bit = 0
	set @countMaNCC =  (select count(MaNCC) from NHACUNGCAP where MaNCC = @MaNCC)
	set @NCC_GC = (select NCC_GC from NHACUNGCAP where MaNCC = @MaNCC)
	set @countMaNV = (select count(MaNV) from CUAHANG where MaNV = @MaNV)
	set @NV_GC = (select NV_GC from CUAHANG where MaNV = @MaNV)

	if @countMaNCC > 0 and @countMaNV > 0 and (@NCC_GC = 0 or @NCC_GC is null) and (@NV_GC = 0 or @NV_GC is null) and @NgayNhap <= GETDATE()
	begin
		insert into HOADONNHAP values (dbo.fNewMaDonNH(), @MaNCC, @MaNV, @TiSuatCK, @VAT, @NgayNhap)
	end
end
go
--
exec spAddHoaDonNhap '1002', 'NV002','0.2','0.3','2021-11-11'
--
-- SỬA HÓA ĐƠN NHẬP
go
create proc spUpdateHoaDonNhap(@MaDonNH varchar(10),@MaNCC varchar(10), @MaNV varchar(10), @TiSuatCK varchar(10), @VAT varchar(10), @NgayNhap date)
as
begin
	declare @countMaNCC int = 0, @countMaNV int = 0, @NV_GC bit = 0, @NCC_GC bit = 0
	set @countMaNCC =  (select count(MaNCC) from NHACUNGCAP where MaNCC = @MaNCC)
	set @NCC_GC = (select NCC_GC from NHACUNGCAP where MaNCC = @MaNCC)
	set @countMaNV = (select count(MaNV) from CUAHANG where MaNV = @MaNV)
	set @NV_GC = (select NV_GC from CUAHANG where MaNV = @MaNV)

	if @countMaNCC > 0 and @countMaNV > 0 and (@NCC_GC = 0 or @NCC_GC is null) and (@NV_GC = 0 or @NV_GC is null) and @NgayNhap <= GETDATE()
	begin
		update HOADONNHAP 
		set MaNCC = @MaNCC,
			MaNV= @MaNV,
			TiSuatCK = @TiSuatCK,
			VAT = @VAT,
			NgayNhap = @NgayNhap
		where MaDonNH = @MaDonNH
	end
end
go
--
-- XÓA HÓA ĐƠN NHẬP
go
create proc spDeleteHoaDonNhap (@MaDonNH varchar(10))
as
begin
	begin transaction

	delete HOADONNHAPCHITIET where MaDonNH = @MaDonNH
	delete HOADONNHAP where MaDonNH = @MaDonNH

	if @@ROWCOUNT > 0
	begin
		commit transaction
	end
	else
	begin
		rollback transaction
	end
end
go
--
-- HIỂN THỊ HÓA ĐƠN NHẬP
go
create proc spShowHoaDonNhap
as
begin
	select HOADONNHAP.MaDonNH as N'Mã đơn nhập',
		   MaNCC as N'Mã nhà cung cấp',
		   MaNV as N'Mã nhân viên',
		   TiSuatCK as N'Tỉ suất chiết khấu',
		   VAT as N'VAT',
		   NgayNhap as N'Ngày nhập',
		   ((HOADONNHAPCHITIET.DonGiaNhap * HOADONNHAPCHITIET.SoLuongNhap) - (HOADONNHAPCHITIET.DonGiaNhap * HOADONNHAPCHITIET.SoLuongNhap) * TiSuatCK + (HOADONNHAPCHITIET.DonGiaNhap * HOADONNHAPCHITIET.SoLuongNhap) * VAT) as N'Tổng tiền nhập'
	from HOADONNHAP join HOADONNHAPCHITIET on HOADONNHAP.MaDonNH = HOADONNHAPCHITIET.MaDonNH
end
go
--
exec spShowHoaDonNhap
--
--------------------------------------------------|
--				HÓA ĐƠN NHẬP CHI TIẾT			  |
--------------------------------------------------|
--
-- THÊM HÓA ĐƠN NHẬP CHI TIẾT
go
alter proc spAddHoaDonNhapChiTiet (@MaDonNhap varchar(10), @MaHang varchar(10), @DonGiaNhap numeric(18), @SoLuong int, @HinhThuc varchar(10))
as
begin
	declare @countMaHang int =0
	set @countMaHang = (select count(MaHang) from HANGHOA where MaHang = @MaHang)
	if @countMaHang > 0
	begin
		insert into HOADONNHAPCHITIET values (@MaDonNhap, @MaHang, @DonGiaNhap, @SoLuong,@HinhThuc)
	end
end
go
--
exec spAddHoaDonNhapChiTiet 'MD005','G006','70000000','5','CK'
--
select * from HANGHOA
-- SỬA HÓA ĐƠN NHẬP CHI TIẾT
go
alter proc spUpdateHoaDonNhapChiTiet (@MaDonNhap varchar(10), @MaHang varchar(10), @DonGiaNhap numeric(18), @SoLuong int = 0, @HinhThuc varchar(10))
as
begin
	declare @countMaHang int =0
	set @countMaHang = (select count(MaHang) from HANGHOA where MaHang = @MaHang)
	if @countMaHang > 0
	begin
		update HOADONNHAPCHITIET
		set DonGiaNhap = @DonGiaNhap,
			SoLuongNhap = @SoLuong,
			HinhThucTT = @HinhThuc
		where MaDonNH = @MaDonNhap and MaHang = @MaHang
	end
end
go
--
exec spUpdateHoaDonNhapChiTiet 'MD005', 'G006','70000000', '15','CK'
--
-- XÓA HÓA ĐƠN NHẬP CHI TIẾT
go
alter proc spDeleteHoaDonNhapChiTiet (@MaDonNH varchar(10) , @MaHang varchar(10))
as
begin
	delete HOADONNHAPCHITIET where MaDonNH = @MaDonNH and MaHang = @MaHang
end
go
--
exec spDeleteHoaDonNhapChiTiet 'MD004'
--
-- HIỂN THỊ HÓA ĐƠN NHẬP CHI TIẾT
go
alter proc spShowHoaDonNhapChiTiet
as
begin
	select HOADONNHAPCHITIET.MaDonNH as N'Mã đơn nhập hàng',
		   MaHang as N'Mã hàng',
		   DonGiaNhap as N'Đơn giá nhập',
		   SoLuongNhap as N'Số lượng nhập',
		   (DonGiaNhap * SoLuongNhap) as N'Thành tiền nhập',
		   (sum(DonGiaNhap * SoLuongNhap)) as N'Tiền hàng',
		   (DonGiaNhap * SoLuongNhap * cast(HOADONNHAP.TiSuatCK as float)) as N'Tiền chiết khấu',
		   (DonGiaNhap * SoLuongNhap * cast(HOADONNHAP.VAT as float)) as N'Tiền VAT',
		   HinhThucTT as N'Hình thức thanh toán'
	from HOADONNHAPCHITIET join HOADONNHAP on HOADONNHAPCHITIET.MaDonNH = HOADONNHAP.MaDonNH
	where HOADONNHAPCHITIET.MaDonNH = HOADONNHAP.MaDonNH
	group by HOADONNHAPCHITIET.MaDonNH, MaHang,DonGiaNhap,SoLuongNhap,HOADONNHAP.TiSuatCK,HOADONNHAP.VAT,HinhThucTT
end
go
--
exec spShowHoaDonNhapChiTiet
--
select * from HOADONNHAPCHITIET
--
--
--
/*
#################################################################
#                             _`								#
#                          _ooOoo_								#
#                         o8888888o								#
#                         88" . "88								#
#                         (| -_- |)								#
#                         O\  =  /O								#
#                      ____/`---'\____							#
#                    .'  \\|     |//  `.						#
#                   /  \\|||  :  |||//  \						#
#                  /  _||||| -:- |||||_  \						#
#                  |   | \\\  -  /'| |   |						#
#                  | \_|  `\`---'//  |_/ |						#
#                  \  .-\__ `-. -'__/-.  /						#
#                ___`. .'  /--.--\  `. .'___					#
#             ."" '<  `.___\_<|>_/___.' _> \"".					#
#            | | :  `- \`. ;`. _/; .'/ /  .' ; |				#
#            \  \ `-.   \_\_`. _.'_/_/  -' _.' /				#
#=============`-.`___`-.__\ \___  /__.-'_.'_.-'=================#
#                           `=--=-'                             #
#################################################################

Nam mô A Di Đà Phật. Cầu cho file này chạy không bug ...
Khoan !!! Dừng khoảng chừng 2 giây để biết HUBO là ai đây!!!
          _.-/`)
         // / / )
      .=// / / / )
     //`/ / / / /
    // /     ` /
   ||         /
    \\       /
     ))    .'
    //    /
         /
*/