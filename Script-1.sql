CREATE database QLBanSach;
use QLBanSach;
CREATE table KhachHang(
	MaKH bigint Auto_Increment,
	TaiKhoan varChar(255),
	MatKhau varChar(16),
	Email varChar(255),
	DiaChi varChar(255),
	DienThoai varChar(255),
	GioiTinh bool,
	NgaySinh date,
	HoTen varChar(50),
	
	primary key(MaKH)
);

CREATE table DonHang(
	MaDonHang bigint,
	DaThanhToan bool,
	NgayGiao datetime,
	NgayDat datetime,
	TinhTrangGiaoHang char(30),
	
	primary key(MaDonHang)
);

CREATE table Gom(
	MaSach bigint,
	MaDonHang bigint unique,
	SoLuong bigint,
	DonGia int,
	
	Primary key (MaSach)
);

CREATE table Sach(
	MaSach bigint,
	NgayCapNhat datetime,
	NgayDat datetime,
	TinhTrangGiaoHang char(30),
	
	primary key(MaSach)
);

CREATE table ChuDe(
	MaChuDe bigint,
	TenChuDe varchar(100),
	
	primary key(MaChuDe)
);

CREATE table TacGia(
	MaTacGia bigint,
	TenTacGia char(30),
	DiaChi char (255),
	TieuSu text,
	DienThoai char(13),
	
	primary key(MaTacGia)
);

CREATE table ThamGia(
	MaTacGia bigint,
	MaSach bigint unique,
	VaiTro varchar (100),
	ViTri char(50),
	
	primary key(MaTacGia)
);

CREATE table NhaXuatBan(
	MaNXS bigint,
	TenNSB varChar(50),
	DienThoai char(13),
	DiaChi varchar(255),
	
	primary key(MaNXS)
);

ALTER table KhachHang add constraint FK_KhachHang_MaKH_DonHang_MaDonHang foreign key(MaKH) references DonHang(MaDonHang);
ALTER table Gom  add constraint FK_Gom_MaDonHang_DonHang_MaDonHang foreign key(MaDonHang) references DonHang(MaDonHang);
ALTER table Sach add constraint FK_Sach_MaSach_Gom_MaSach foreign key(MaSach) references Gom(MaSach);
ALTER table ChuDe add constraint FK_ChuDe_MaChuDe_Sach_MaSach foreign key(MaChuDe) references Sach(MaSach);
ALTER table NhaXuatBan  add constraint FK_NhaXuatBan_MaNSB_Sach_MaSach foreign key(MaNXS) references Sach(MaSach);
ALTER table TacGia  add constraint FK_TacGia_MaTacGia_ThamGia_MaTacGia foreign key(MaTacGia) references ThamGia(MaTacGia);
ALTER table Sach  add constraint FK_Sach_MaSach_ThamGia_MaSach foreign key (MaSach) references ThamGia(MaSach);



