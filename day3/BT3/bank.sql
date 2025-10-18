-- Tạo cơ sở dữ liệu
CREATE DATABASE IF NOT EXISTS bank_xyz;
USE bank_xyz;

-- Bảng Khách Hàng
CREATE TABLE khach_hang (
    id_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    ngay_sinh DATE,
    cmnd VARCHAR(50)
);

-- Bảng Tài Khoản (mối quan hệ 1-1 với Khách Hàng)
CREATE TABLE tai_khoan (
    khach_hang_id INT PRIMARY KEY,  -- vừa là PK, vừa là FK
    so_du DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    loai_tk VARCHAR(50) DEFAULT 'THUONG',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (khach_hang_id) REFERENCES khach_hang(id_khach_hang)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
-- Thêm khách hàng
INSERT INTO khach_hang (ten, ngay_sinh, cmnd)
VALUES 
('Nguyễn Văn A', '1990-05-12', '012345678'),
('Trần Thị B', '1992-09-20', '987654321');

-- Thêm tài khoản tương ứng
INSERT INTO tai_khoan (khach_hang_id, so_du, loai_tk)
VALUES 
(1, 5000000.00, 'TIET_KIEM'),
(2, 10000000.00, 'THANH_TOAN');



