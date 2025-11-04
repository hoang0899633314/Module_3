-- Tạo database mới
CREATE DATABASE cuu_tro_lu_lut;
USE cuu_tro_lu_lut;

-- Bảng DON_VI_UNG_HO: Đơn vị, tổ chức hoặc cá nhân ủng hộ
CREATE TABLE DON_VI_UNG_HO (
    MaDVUH CHAR(5) PRIMARY KEY,
    TenDVUH VARCHAR(100),
    TaiKhoanNH VARCHAR(100),
    HoTenNguoiDaiDien VARCHAR(100)
);

-- Bảng HINH_THUC_UNG_HO: Các loại hàng cứu trợ
CREATE TABLE HINH_THUC_UNG_HO (
    MaHinhThucUH CHAR(5) PRIMARY KEY,
    TenHinhThucUngHo VARCHAR(100),
    DonViTinh VARCHAR(20)
);

-- Bảng HO_DAN: Danh sách hộ dân
CREATE TABLE HO_DAN (
    MaHoDan CHAR(5) PRIMARY KEY,
    HoTenChuHo VARCHAR(100),
    ToDanPho VARCHAR(10),
    KhoiHoacThon VARCHAR(50),
    LoaiHo VARCHAR(50)   -- ví dụ: Ho ngheo, Ho kha, ...
);

-- Bảng DOT_UNG_HO: Đợt ủng hộ từ các đơn vị
CREATE TABLE DOT_UNG_HO (
    MaDotUngHo CHAR(5) PRIMARY KEY,
    MaDVUH CHAR(5),
    MaHinhThucUH CHAR(5),
    NgayUngHo DATE,
    SoLuongUngHo INT,
    FOREIGN KEY (MaDVUH) REFERENCES DON_VI_UNG_HO(MaDVUH),
    FOREIGN KEY (MaHinhThucUH) REFERENCES HINH_THUC_UNG_HO(MaHinhThucUH)
);

-- Bảng DOT_NHAN_UNG_HO: Đợt nhận hàng của các hộ dân
CREATE TABLE DOT_NHAN_UNG_HO (
    MaDotNhanUngHo CHAR(5) PRIMARY KEY,
    MaHoDan CHAR(5),
    MaHinhThucUH CHAR(5),
    NgayNhanUngHo DATE,
    SoLuongNhanUngHo INT,
    FOREIGN KEY (MaHoDan) REFERENCES HO_DAN(MaHoDan),
    FOREIGN KEY (MaHinhThucUH) REFERENCES HINH_THUC_UNG_HO(MaHinhThucUH)
);

-- Đơn vị ủng hộ
INSERT INTO DON_VI_UNG_HO VALUES
('DV001', 'Cong ty A', '111111 - DongA', 'Nguyen Van An'),
('DV002', 'Cong ty B', '222222 - Vietcombank', 'Pham Thi Bich'),
('DV003', 'To chuc C', '333333 - DongA', 'Le Hoang Phu'),
('DV004', 'Ca nhan D', '444444 - ACB', 'Phan Van Dung'),
('DV005', 'Cong ty E', '555555 - BIDV', 'Tran Van Minh'),
('DV006', 'Hoi tu thien F', '666666 - DongA', 'Do Thi Lan');

-- Hình thức ủng hộ
INSERT INTO HINH_THUC_UNG_HO VALUES
('HT001', 'Mi tom', 'Thung'),
('HT002', 'Gao', 'Kg'),
('HT003', 'Nuoc suoi', 'Chai'),
('HT004', 'Mi an lien', 'Thung'),
('HT005', 'Dau an', 'Chai');

-- Hộ dân
INSERT INTO HO_DAN VALUES
('HD001', 'Pham Van Phuoc', '01', 'Thon 1', 'Ho ngheo'),
('HD002', 'Phan Thi Hoa', '02', 'Thon 2', 'Ho kha'),
('HD003', 'Nguyen Van Ph', '03', 'Thon 3', 'Ho ngheo'),
('HD004', 'Tran Thi Phuong', '04', 'Thon 4', 'Ho ngheo'),
('HD005', 'Le Thi My', '05', 'Thon 5', 'Ho kha'),
('HD006', 'Phan Phu Thanh', '06', 'Thon 6', 'Ho trung binh'),
('HD007', 'Pham Hong Phuc', '07', 'Thon 7', 'Ho ngheo'),
('HD008', 'Nguyen Thi Lan', '08', 'Thon 8', 'Ho kha'),
('HD009', 'Pham Minh', '09', 'Thon 9', 'Ho trung binh'),
('HD010', 'Le Van Phu', '10', 'Thon 10', 'Ho ngheo');

-- Đợt ủng hộ (từ các đơn vị)
INSERT INTO DOT_UNG_HO VALUES
('UH001', 'DV001', 'HT001', '2015-03-15', 100),
('UH002', 'DV002', 'HT002', '2015-11-20', 200),
('UH003', 'DV003', 'HT004', '2016-01-10', 150),
('UH004', 'DV003', 'HT004', '2016-02-01', 180),
('UH005', 'DV003', 'HT004', '2016-03-12', 50),
('UH006', 'DV003', 'HT004', '2016-04-10', 80),
('UH007', 'DV003', 'HT004', '2016-05-01', 100),
('UH008', 'DV006', 'HT004', '2016-05-05', 90),
('UH009', 'DV004', 'HT003', '2015-09-25', 300),
('UH010', 'DV005', 'HT005', '2017-06-10', 60),
('UH011', 'DV006', 'HT002', '2016-12-25', 70),
('UH012', 'DV002', 'HT001', '2017-04-05', 150);

-- Đợt nhận ủng hộ (từ chính quyền -> hộ dân)
INSERT INTO DOT_NHAN_UNG_HO VALUES
('NH001', 'HD001', 'HT001', '2015-10-12', 2),
('NH002', 'HD001', 'HT004', '2016-01-05', 1),
('NH003', 'HD002', 'HT002', '2016-03-18', 3),
('NH004', 'HD003', 'HT004', '2016-02-02', 2),
('NH005', 'HD004', 'HT003', '2016-05-12', 5),
('NH006', 'HD005', 'HT004', '2016-04-10', 2),
('NH007', 'HD006', 'HT002', '2017-02-15', 4),
('NH008', 'HD007', 'HT004', '2016-03-22', 1),
('NH009', 'HD008', 'HT002', '2015-07-01', 3),
('NH010', 'HD009', 'HT003', '2016-05-15', 5);


----------------------------------------------
-- Câu 1: Xóa những đơn vị ủng hộ có tài khoản ngân hàng mở ở ngân hàng “DongA”
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM DON_VI_UNG_HO
WHERE TaiKhoanNH LIKE '%DongA%';
SET FOREIGN_KEY_CHECKS = 1;

-- Câu 2: Cập nhật hình thức ủng hộ có tên “Mi tom” thành “Mi an lien”
UPDATE HINH_THUC_UNG_HO
SET TenHinhThucUngHo = 'Mi an lien'
WHERE TenHinhThucUngHo = 'Mi tom';

-- Câu 3: Liệt kê chủ hộ có họ tên bắt đầu bằng “Ph” và độ dài ≤ 30 ký tự
SELECT *
FROM HO_DAN
WHERE HoTenChuHo LIKE 'Ph%' AND LENGTH(HoTenChuHo) <= 30;

-- Câu 4: Liệt kê đợt nhận ủng hộ có NgayNhanUngHo trong năm 2015 và MaHoDan kết thúc bằng '1'
SELECT *
FROM DOT_NHAN_UNG_HO
WHERE YEAR(NgayNhanUngHo) = 2015
  AND MaHoDan LIKE '%1';

-- Câu 5: Liệt kê MaDVUH, HoTenNguoiDaiDien, MaDotUngHo, NgayUngHo của đợt ủng hộ trước 30/04/2016.
-- Sắp xếp giảm dần NgayUngHo, tăng dần HoTenNguoiDaiDien.
SELECT d.MaDVUH, u.HoTenNguoiDaiDien, d.MaDotUngHo, d.NgayUngHo
FROM DOT_UNG_HO d
JOIN DON_VI_UNG_HO u ON d.MaDVUH = u.MaDVUH
WHERE d.NgayUngHo < '2016-04-30'
ORDER BY d.NgayUngHo DESC, u.HoTenNguoiDaiDien ASC;

-- Câu 6: Liệt kê hộ nghèo chưa từng nhận ủng hộ lần nào
SELECT *
FROM HO_DAN h
WHERE h.LoaiHo = 'Ho ngheo'
  AND h.MaHoDan NOT IN (
      SELECT DISTINCT MaHoDan FROM DOT_NHAN_UNG_HO
  );

-- Câu 7: Liệt kê họ tên chủ hộ, loại bỏ trùng lặp — 2 cách
-- Cách 1: DISTINCT
SELECT DISTINCT HoTenChuHo
FROM HO_DAN;

-- Cách 2: GROUP BY
SELECT HoTenChuHo
FROM HO_DAN
GROUP BY HoTenChuHo;

-- Câu 8: Liệt kê đầy đủ thông tin hộ dân và đợt nhận
SELECT h.MaHoDan, h.HoTenChuHo, h.ToDanPho, h.KhoiHoacThon,
       d.MaDotNhanUngHo, d.NgayNhanUngHo, d.MaHinhThucUH,
       d.SoLuongNhanUngHo, ht.DonViTinh
FROM HO_DAN h
JOIN DOT_NHAN_UNG_HO d ON h.MaHoDan = d.MaHoDan
JOIN HINH_THUC_UNG_HO ht ON d.MaHinhThucUH = ht.MaHinhThucUH;

-- Câu 9: Liệt kê đơn vị có tài khoản ở “DongA”, ít nhất 5 lần hỗ trợ “Mi an lien” trong năm 2016
SELECT u.MaDVUH, u.TenDVUH, COUNT(*) AS SoLanUngHo
FROM DOT_UNG_HO d
JOIN DON_VI_UNG_HO u ON d.MaDVUH = u.MaDVUH
JOIN HINH_THUC_UNG_HO h ON d.MaHinhThucUH = h.MaHinhThucUH
WHERE u.TaiKhoanNH LIKE '%DongA%'
  AND h.TenHinhThucUngHo = 'Mi an lien'
  AND YEAR(d.NgayUngHo) = 2016
GROUP BY u.MaDVUH, u.TenDVUH
HAVING COUNT(*) >= 5;

-- Câu 10: Liệt kê hộ dân đã từng nhận “Mi an lien” và chưa từng nhận “Gao”

SELECT DISTINCT h.MaHoDan, h.HoTenChuHo
FROM HO_DAN h
WHERE h.MaHoDan IN (
    SELECT d.MaHoDan
    FROM DOT_NHAN_UNG_HO d
    JOIN HINH_THUC_UNG_HO ht ON d.MaHinhThucUH = ht.MaHinhThucUH
    WHERE ht.TenHinhThucUngHo = 'Mi an lien'
)
AND h.MaHoDan NOT IN (
    SELECT d.MaHoDan
    FROM DOT_NHAN_UNG_HO d
    JOIN HINH_THUC_UNG_HO ht ON d.MaHinhThucUH = ht.MaHinhThucUH
    WHERE ht.TenHinhThucUngHo = 'Gao'
);

