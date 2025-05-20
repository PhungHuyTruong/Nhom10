create database Nhom10ModuleDiemDanh
GO
USE Nhom10ModuleDiemDanh;
GO
CREATE TABLE LichHoc (
    IdLichHoc UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdNXCH UNIQUEIDENTIFIER NOT NULL,
    IdCaHoc UNIQUEIDENTIFIER NOT NULL,
    IdNhomXuong UNIQUEIDENTIFIER NOT NULL,
    IdDuAn UNIQUEIDENTIFIER NULL,
    DiaDiem NVARCHAR(100),
    TenGiangVien NVARCHAR(100),
    NgayTao DATETIME NOT NULL DEFAULT GETDATE(),
    NgayCapNhat DATETIME NULL,
    MoTa NVARCHAR(255),

    CONSTRAINT FK_LichHoc_NXCH FOREIGN KEY (IdNXCH) REFERENCES CoSo(IdCoSo),
    CONSTRAINT FK_LichHoc_CaHoc FOREIGN KEY (IdCaHoc) REFERENCES CaHoc(IdCaHoc),
    CONSTRAINT FK_LichHoc_NhomXuong FOREIGN KEY (IdNhomXuong) REFERENCES NhomXuong(IdNhomXuong),
    CONSTRAINT FK_LichHoc_DuAn FOREIGN KEY (IdDuAn) REFERENCES DuAn(IdDuAn)
);
GO
INSERT INTO LichHoc (IdNXCH, IdCaHoc, IdNhomXuong, IdDuAn, DiaDiem, TenGiangVien, MoTa)
VALUES
(NEWID(), NEWID(), NEWID(), NULL, N'Phòng A101', N'Nguyễn Văn A', N'Lập trình căn bản'),
(NEWID(), NEWID(), NEWID(), NULL, N'Phòng B202', N'Lê Thị B', N'Thiết kế CSDL'),
(NEWID(), NEWID(), NEWID(), NULL, N'Phòng C303', N'Trần Văn C', N'Thực hành ASP.NET');
GO
CREATE TABLE LichGiangDay (
    IdLichDay UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdNXCH UNIQUEIDENTIFIER NOT NULL,
    TTDiemDanhMuon BIT NOT NULL DEFAULT 0,
    IdNhomXuong UNIQUEIDENTIFIER NOT NULL,
    IdDuAn UNIQUEIDENTIFIER NULL,
    IdDiaDiem UNIQUEIDENTIFIER NOT NULL,
    HTGiangDay NVARCHAR(100) NOT NULL,
    TTDiemDanh BIT NOT NULL DEFAULT 0,
    NgayTao DATETIME NOT NULL DEFAULT GETDATE(),
    NgayCapNhat DATETIME NULL,
    TrangThai INT NOT NULL DEFAULT 1,

    CONSTRAINT FK_LGD_NXCH FOREIGN KEY (IdNXCH) REFERENCES CoSo(IdCoSo),
    CONSTRAINT FK_LGD_NhomXuong FOREIGN KEY (IdNhomXuong) REFERENCES NhomXuong(IdNhomXuong),
    CONSTRAINT FK_LGD_DuAn FOREIGN KEY (IdDuAn) REFERENCES DuAn(IdDuAn),
    CONSTRAINT FK_LGD_DiaDiem FOREIGN KEY (IdDiaDiem) REFERENCES DiaDiem(IdDiaDiem)
);

GO
INSERT INTO LichGiangDay (IdNXCH, TTDiemDanhMuon, IdNhomXuong, IdDuAn, IdDiaDiem, HTGiangDay, TTDiemDanh)
VALUES
(NEWID(), 1, NEWID(), NULL, (SELECT TOP 1 IdDiaDiem FROM DiaDiem), N'Offline', 1),
(NEWID(), 0, NEWID(), NULL, (SELECT TOP 1 IdDiaDiem FROM DiaDiem ORDER BY NEWID()), N'Online', 0),
(NEWID(), 1, NEWID(), NULL, (SELECT TOP 1 IdDiaDiem FROM DiaDiem ORDER BY NEWID()), N'Hybrid', 1);

GO
CREATE TABLE LichSuDiemDanh (
    IdLSDD UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
    IdDiemDanh UNIQUEIDENTIFIER NOT NULL,
    IdNXCH UNIQUEIDENTIFIER NOT NULL,
    ThoiGianDiemDanh DATETIME NOT NULL,
    NoiDungBuoiHoc NVARCHAR(255),
    HinhThuc NVARCHAR(100),
    DiaDiem NVARCHAR(100),
    GhiChu NVARCHAR(255),
    TrangThai INT NOT NULL DEFAULT 1,
    NgayTao DATETIME NOT NULL DEFAULT GETDATE(),
    NgayCapNhat DATETIME NULL,
    TrangThaiDuyet INT NOT NULL DEFAULT 1,

    CONSTRAINT FK_LSDD_DiemDanh FOREIGN KEY (IdDiemDanh) REFERENCES DiemDanh(IdDiemDanh),
    CONSTRAINT FK_LSDD_NXCH FOREIGN KEY (IdNXCH) REFERENCES CoSo(IdCoSo)
);

GO
INSERT INTO LichSuDiemDanh (IdDiemDanh, IdNXCH, ThoiGianDiemDanh, NoiDungBuoiHoc, HinhThuc, DiaDiem, GhiChu)
VALUES
(NEWID(), NEWID(), GETDATE(), N'Buổi 1 - Giới thiệu môn học', N'Offline', N'Phòng A101', N'Không có ghi chú'),
(NEWID(), NEWID(), GETDATE(), N'Buổi 2 - Thực hành', N'Online', N'Trên Zoom', N'Đăng nhập trễ'),
(NEWID(), NEWID(), GETDATE(), N'Buổi 3 - Ôn tập', N'Hybrid', N'Trực tiếp + Zoom', N'Đầy đủ');

