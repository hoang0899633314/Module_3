CREATE DATABASE store_management;

-- 2️⃣ Sử dụng cơ sở dữ liệu
USE store_management;

-- 3️⃣ Tạo bảng product
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NULL,
    price DECIMAL(15,2) NULL,
    stock INT NULL
);

-- 🧾 4️⃣ THÊM DỮ LIỆU

-- (a) Thêm dữ liệu không chỉ định tên cột
INSERT INTO product VALUES 
(NULL, 'Tai nghe Sony WH-1000XM5', 'Tai nghe chống ồn cao cấp', 8990000, 20);

-- (b) Thêm dữ liệu có chỉ định tên cột
INSERT INTO product (name, description, price, stock)
VALUES ('Chuột Logitech MX Master 3', 'Chuột không dây cao cấp', 2990000, 15);

-- (c) Thêm dữ liệu có chỉ định tên cột và bỏ qua cột cho phép NULL
INSERT INTO product (name, price)
VALUES ('Bàn phím cơ Keychron K6', 2500000);

-- 🔍 5️⃣ TRUY VẤN DỮ LIỆU

-- a. Liệt kê toàn bộ thông tin sản phẩm
SELECT * FROM product;

-- b. Liệt kê id, name, price
SELECT id, name, price FROM product;

-- c. Liệt kê sản phẩm có giá dưới 10 triệu
SELECT id, name, price 
FROM product
WHERE price < 10000000;

-- 🔧 6️⃣ CẬP NHẬT DỮ LIỆU

-- Cho phép cập nhật mà không cần WHERE
SET sql_safe_updates = 0;

-- a. Cập nhật tất cả giá tăng 10%
UPDATE product
SET price = price * 1.1;

-- b. Cập nhật có điều kiện (ví dụ cập nhật số lượng cho 1 sản phẩm)
UPDATE product
SET stock = stock + 5
WHERE name = 'Chuột Logitech MX Master 3';

-- Bật lại chế độ an toàn
SET sql_safe_updates = 1;

-- 🧩 7️⃣ CHỈNH SỬA CẤU TRÚC BẢNG

-- a. Thêm trường Barcode (NULL)
ALTER TABLE product
ADD COLUMN barcode VARCHAR(100) NULL;

-- b. Thêm trường Warranty (mặc định 6 tháng)
ALTER TABLE product
ADD COLUMN warranty VARCHAR(50) DEFAULT '6 tháng';


