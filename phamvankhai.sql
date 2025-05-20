create database Nhom10ModuleDiemDanh
go

use Nhom10ModuleDiemDanh
go
--Bang KeHoach--
CREATE TABLE KeHoach (
    IdKeHoach UNIQUEIDENTIFIER PRIMARY KEY,
    TenKeHoach NVARCHAR(255),
    IdDuAn UNIQUEIDENTIFIER,
    NoiDung NVARCHAR(MAX),
    NgayDienRa DATE,
    TrangThai INT,
    NgayTao DATETIME,
    NgayCapNhat DATETIME
);

--Bảng KeHoachNhomXuong --
CREATE TABLE KeHoachNhomXuong (
    IdKHNX UNIQUEIDENTIFIER PRIMARY KEY,
    IdNhomXuong UNIQUEIDENTIFIER,
    IdKeHoach UNIQUEIDENTIFIER,
    ThoiGianThucTe NVARCHAR(100),
    SoBuoi INT,
    SoSinhVien INT,
    NgayTao DATETIME,
    NgayCapNhat DATETIME,
    TrangThai INT
);
--Bảng KHNXCaHoc--
CREATE TABLE KHNXCaHoc (
    IdNXCH UNIQUEIDENTIFIER PRIMARY KEY,
    Buoi INT,
    NgayHoc DATE,
    ThoiGian NVARCHAR(100),
    IdKHNX UNIQUEIDENTIFIER,
    IdCaHoc UNIQUEIDENTIFIER,
    NoiDung NVARCHAR(MAX),
    LinkOnline NVARCHAR(500),
    DiemDanhTre BIT,
    NgayTao DATETIME,
    NgayCapNhat DATETIME,
    TrangThai INT
);

INSERT INTO KeHoach (IdKeHoach, TenKeHoach, IdDuAn, NoiDung, NgayDienRa, TrangThai, NgayTao, NgayCapNhat)
VALUES 
(NEWID(), N'Kế hoạch học kỳ I', NEWID(), N'Lên kế hoạch học kỳ I', '2025-09-01', 1, GETDATE(), GETDATE()),
(NEWID(), N'Kế hoạch học kỳ II', NEWID(), N'Lên kế hoạch học kỳ II', '2026-01-15', 1, GETDATE(), GETDATE()),
(NEWID(), N'Kế hoạch chuyên đề', NEWID(), N'Training kỹ năng mềm', '2025-11-10', 0, GETDATE(), GETDATE());


INSERT INTO KeHoachNhomXuong (IdKHNX, IdNhomXuong, IdKeHoach, ThoiGianThucTe, SoBuoi, SoSinhVien, NgayTao, NgayCapNhat, TrangThai)
VALUES 
(NEWID(), NEWID(), NEWID(), N'Tuần 1 - 8', 8, 25, GETDATE(), GETDATE(), 1),
(NEWID(), NEWID(), NEWID(), N'Tuần 2 - 9', 8, 30, GETDATE(), GETDATE(), 1),
(NEWID(), NEWID(), NEWID(), N'Tuần 10 - 12', 3, 20, GETDATE(), GETDATE(), 0);

INSERT INTO KHNXCaHoc (IdNXCH, Buoi, NgayHoc, ThoiGian, IdKHNX, IdCaHoc, NoiDung, LinkOnline, DiemDanhTre, NgayTao, NgayCapNhat, TrangThai)
VALUES 
(NEWID(), 1, '2025-09-03', N'07:30 - 11:30', NEWID(), NEWID(), N'Lý thuyết mạch điện', N'https://class1.com', 0, GETDATE(), GETDATE(), 1),
(NEWID(), 2, '2025-09-10', N'13:00 - 17:00', NEWID(), NEWID(), N'Thực hành hàn mạch', N'https://class2.com', 0, GETDATE(), GETDATE(), 1),
(NEWID(), 1, '2026-01-12', N'07:30 - 11:30', NEWID(), NEWID(), N'Cơ sở dữ liệu', N'https://class3.com', 1, GETDATE(), GETDATE(), 1);

select * from KeHoach
select * from KeHoachNhomXuong
select * from KHNXCaHoc

