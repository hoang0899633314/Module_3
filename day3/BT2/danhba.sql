CREATE DATABASE danh_ba;
USE danh_ba;

-- Bảng Người
CREATE TABLE nguoi (
    id_nguoi INT PRIMARY KEY AUTO_INCREMENT,
    ten VARCHAR(255) NOT NULL
);

-- Bảng Số điện thoại
CREATE TABLE so_dien_thoai (
    id_so_dien_thoai INT PRIMARY KEY AUTO_INCREMENT,
    nguoi_id INT,
    so VARCHAR(15) NOT NULL,
    FOREIGN KEY (nguoi_id) REFERENCES nguoi(id_nguoi)
);

-- Bảng Email
CREATE TABLE email (
    id_email INT PRIMARY KEY AUTO_INCREMENT,
    nguoi_id INT,
    dia_chi_email VARCHAR(255) NOT NULL,
    FOREIGN KEY (nguoi_id) REFERENCES nguoi(id_nguoi)
);
-- Thêm người
INSERT INTO nguoi (ten) VALUES
('Nguyễn Văn A'),
('Trần Thị B'),
('Lê Văn C');

-- Thêm số điện thoại
INSERT INTO so_dien_thoai (nguoi_id, so) VALUES
(1, '0909123456'),
(1, '0911222333'),
(2, '0988777666'),
(3, '0977444555'),
(3, '0933222111');

-- Thêm email
INSERT INTO email (nguoi_id, dia_chi_email) VALUES
(1, 'nguyenvana@gmail.com'),
(1, 'vana@company.com'),
(2, 'tranthib@yahoo.com'),
(3, 'levanc@hotmail.com');



