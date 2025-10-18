-- 1. Tạo database và chọn sử dụng
CREATE DATABASE IF NOT EXISTS truong_abc;
USE truong_abc;

-- 2. Bảng Giáo Viên
CREATE TABLE giao_vien (
    id_giao_vien INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    chuyen_mon VARCHAR(100) NULL,
    email VARCHAR(255) NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Bảng Học Sinh (chứa khóa ngoại giao_vien_id)
CREATE TABLE hoc_sinh (
    id_hoc_sinh INT AUTO_INCREMENT PRIMARY KEY,
    ten VARCHAR(255) NOT NULL,
    ngay_sinh DATE NULL,
    lop VARCHAR(50) NULL,
    giao_vien_id INT NOT NULL,         -- KHÔNG NULL để bắt buộc mỗi học sinh có 1 giáo viên
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_hocsinh_giaovien
        FOREIGN KEY (giao_vien_id) REFERENCES giao_vien(id_giao_vien)
        ON DELETE RESTRICT              -- không cho xóa GV khi vẫn có HS gắn với họ
        ON UPDATE CASCADE
);

-- 4. Dữ liệu mẫu
INSERT INTO giao_vien (ten, chuyen_mon, email) VALUES
('Nguyễn Văn D', 'Toán', 'vand@example.com'),
('Trần Thị E', 'Vật Lý', 'eth@example.com'),
('Lê Thị F', 'Ngữ Văn', 'flea@example.com');

INSERT INTO hoc_sinh (ten, ngay_sinh, lop, giao_vien_id) VALUES
('Phạm A', '2008-01-15', '8A', 1),
('Hoàng B', '2007-05-20', '9B', 2),
('Đỗ C',   '2008-12-02', '8A', 1),
('Ngô D',  '2007-09-30', '9C', 3);
