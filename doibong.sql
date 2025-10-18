-- Tạo database
CREATE DATABASE IF NOT EXISTS quanly_doibong;
USE quanly_doibong;

-- Bảng HLV
CREATE TABLE hlv (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    ngay_sinh DATE
);

-- Bảng Đội
CREATE TABLE doi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten_doi VARCHAR(255) NOT NULL,
    hlv_id INT UNIQUE, -- Đảm bảo mỗi HLV chỉ quản lý một đội
    FOREIGN KEY (hlv_id) REFERENCES hlv(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Bảng Cầu Thủ
CREATE TABLE cau_thu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    ngay_sinh DATE,
    doi_id INT NOT NULL,
    FOREIGN KEY (doi_id) REFERENCES doi(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Bảng Vị Trí Cầu Thủ
CREATE TABLE vi_tri_cau_thu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vi_tri VARCHAR(100) NOT NULL
);

-- Bảng liên kết Cầu Thủ ↔ Vị Trí (đa trị)
CREATE TABLE cau_thu_vi_tri (
    cau_thu_id INT,
    vi_tri_id INT,
    PRIMARY KEY (cau_thu_id, vi_tri_id),
    FOREIGN KEY (cau_thu_id) REFERENCES cau_thu(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (vi_tri_id) REFERENCES vi_tri_cau_thu(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Bảng Trận Đấu
CREATE TABLE tran_dau (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doi_a INT NOT NULL,
    doi_b INT NOT NULL,
    ngay_gio_dau DATETIME NOT NULL,
    FOREIGN KEY (doi_a) REFERENCES doi(id),
    FOREIGN KEY (doi_b) REFERENCES doi(id),
    CHECK (doi_a <> doi_b)
);

-- Bảng liên kết Trận Đấu ↔ Cầu Thủ (n-n)
CREATE TABLE tran_dau_cau_thu (
    tran_dau_id INT,
    cau_thu_id INT,
    PRIMARY KEY (tran_dau_id, cau_thu_id),
    FOREIGN KEY (tran_dau_id) REFERENCES tran_dau(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (cau_thu_id) REFERENCES cau_thu(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Dữ liệu mẫu
INSERT INTO hlv (ten, ngay_sinh) VALUES
('Nguyễn Văn A', '1980-05-20'),
('Trần Văn B', '1978-03-15');

INSERT INTO doi (ten_doi, hlv_id) VALUES
('Đội Rồng Xanh', 1),
('Đội Hổ Đỏ', 2);

INSERT INTO cau_thu (ten, ngay_sinh, doi_id) VALUES
('Phạm Công', '2000-01-10', 1),
('Nguyễn Huy', '1999-07-22', 1),
('Lê Bình', '2001-03-14', 2),
('Trần Đức', '1998-09-30', 2);

INSERT INTO vi_tri_cau_thu (vi_tri) VALUES
('Thủ môn'), ('Hậu vệ'), ('Tiền vệ'), ('Tiền đạo');

INSERT INTO cau_thu_vi_tri (cau_thu_id, vi_tri_id) VALUES
(1, 1), (1, 2),
(2, 3),
(3, 4),
(4, 2), (4, 3);

INSERT INTO tran_dau (doi_a, doi_b, ngay_gio_dau) VALUES
(1, 2, '2025-11-05 19:30:00');

INSERT INTO tran_dau_cau_thu (tran_dau_id, cau_thu_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4);
