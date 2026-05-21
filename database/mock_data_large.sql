-- MOCK DATA SIÊU TO KHỔNG LỒ

-- 10 Tài khoản nhân viên (Mật khẩu trùng với Tên đăng nhập)
INSERT IGNORE INTO users (username, password, name, role, designation, phone, email, tenant_id) VALUES
('nhanvien1', '$2b$10$4CFY05uu./.DnsLfmaJOd.RnYRdZ2klwzy8y8xtwX5O6r53dx/gBW', 'Nhân viên 1', 'user', 'Phục Vụ', '0800000001', 'nhanvien1@nhahang.com', 100),
('nhanvien2', '$2b$10$osSkDpJ4co3ulSkHiJII/OQ8MtZXoVhqcqFgRlNDOn1gIQba2/38y', 'Nhân viên 2', 'user', 'Phục Vụ', '0800000002', 'nhanvien2@nhahang.com', 100),
('nhanvien3', '$2b$10$k8G51bn59KgB15.Y6H1XwuxApdqRKwUVDW5m5wmQIB3BGgSBXW1n6', 'Nhân viên 3', 'user', 'Phục Vụ', '0800000003', 'nhanvien3@nhahang.com', 100),
('nhanvien4', '$2b$10$io/eO./8Sp.XQ9edLNqwc.DyLiKyndW6kx.r3lkWP8yGKcPBRZ91y', 'Nhân viên 4', 'user', 'Phục Vụ', '0800000004', 'nhanvien4@nhahang.com', 100),
('nhanvien5', '$2b$10$ayoAW5tiK4ErH0Q8bpl4pOJOWwTkpcqWV3Zn7s.YXO9t8.qWIPj3u', 'Nhân viên 5', 'user', 'Phục Vụ', '0800000005', 'nhanvien5@nhahang.com', 100),
('nhanvien6', '$2b$10$7riXHGl1V1ayKYtRauE4few2bmop9M.gmBHyZEkaKICJkNbcHUXCy', 'Nhân viên 6', 'user', 'Phục Vụ', '0800000006', 'nhanvien6@nhahang.com', 100),
('nhanvien7', '$2b$10$vpjCm57YOspebfIZ426b/eA/t.sC4QL.7XqHc57gAXo4sOj2EP7NC', 'Nhân viên 7', 'user', 'Phục Vụ', '0800000007', 'nhanvien7@nhahang.com', 100),
('nhanvien8', '$2b$10$goMAmpysPAaXrqVY6irbG.Vd.vchzBIKeFAvR29.5RAJUINUWIQh6', 'Nhân viên 8', 'user', 'Phục Vụ', '0800000008', 'nhanvien8@nhahang.com', 100),
('nhanvien9', '$2b$10$PZDvaqSuxenngksvMi2cb.qwaaenBaqX0hHihjkLovfHCYKJkAqF.', 'Nhân viên 9', 'user', 'Phục Vụ', '0800000009', 'nhanvien9@nhahang.com', 100),
('nhanvien10', '$2b$10$UBESswfw7.mM8N5UwQmGXuhvg9kEN2IXjZ3GGkvfmsZpU5BXlYz.u', 'Nhân viên 10', 'user', 'Phục Vụ', '0800000010', 'nhanvien10@nhahang.com', 100);

-- 10 Danh mục mốn ăn
INSERT IGNORE INTO categories (id, title, tenant_id) VALUES
(200, 'Hải sản tươi sống', 100),
(201, 'Lẩu các loại', 100),
(202, 'Đồ Nướng BBQ', 100),
(203, 'Món Gỏi/Salad', 100),
(204, 'Món Gà', 100),
(205, 'Món Bò', 100),
(206, 'Món Heo', 100),
(207, 'Bia & Rượu', 100),
(208, 'Nước Ép Trái Cây', 100),
(209, 'Sinh Tố', 100);

-- 20 Sản phẩm món ăn/thức uống
INSERT IGNORE INTO menu_items (id, title, price, net_price, tax_id, category, tenant_id, image) VALUES
(200, 'Mực Hấp Hành', 15000, 15000, 100, 200, 100, ''),
(201, 'Cua Rang Me', 30000, 30000, 100, 200, 100, ''),
(202, 'Tôm Hùm Đất Cháy Tỏi', 45000, 45000, 100, 201, 100, ''),
(203, 'Bạch Tuộc Sốt Thái', 60000, 60000, 100, 201, 100, ''),
(204, 'Lẩu Thái Tomyum', 75000, 75000, 100, 202, 100, ''),
(205, 'Lẩu Bò Nhúng Dấm', 90000, 90000, 100, 202, 100, ''),
(206, 'Lẩu Cá Thác Lác', 105000, 105000, 100, 203, 100, ''),
(207, 'Sườn Heo Nướng Tảng', 120000, 120000, 100, 203, 100, ''),
(208, 'Bạch Tuộc Nướng Sa Tế', 135000, 135000, 100, 204, 100, ''),
(209, 'Dê Nướng Tảng', 150000, 150000, 100, 204, 100, ''),
(210, 'Gỏi Ngó Sen Tôm Thịt', 165000, 165000, 100, 205, 100, ''),
(211, 'Gỏi Bò Bóp Thấu', 180000, 180000, 100, 205, 100, ''),
(212, 'Gà Quay Lu', 195000, 195000, 100, 206, 100, ''),
(213, 'Gà Hấp Lá Chanh', 210000, 210000, 100, 206, 100, ''),
(214, 'Bò Lúc Lắc', 225000, 225000, 100, 207, 100, ''),
(215, 'Bò Né', 240000, 240000, 100, 207, 100, ''),
(216, 'Bia Tiger', 255000, 255000, 100, 208, 100, ''),
(217, 'Bia Heineken', 270000, 270000, 100, 208, 100, ''),
(218, 'Nước Ép Cam', 285000, 285000, 100, 209, 100, ''),
(219, 'Nước Ép Dưa Hấu', 300000, 300000, 100, 209, 100, '');

-- 10 Bàn ăn mới
INSERT IGNORE INTO store_tables (id, table_title, floor, seating_capacity, tenant_id) VALUES
(201, 'Bàn VIP 1', 'Sân Thượng', 5, 100),
(202, 'Bàn VIP 2', 'Sân Thượng', 6, 100),
(203, 'Bàn VIP 3', 'Sân Thượng', 7, 100),
(204, 'Bàn VIP 4', 'Sân Thượng', 4, 100),
(205, 'Bàn VIP 5', 'Sân Thượng', 5, 100),
(206, 'Bàn VIP 6', 'Phòng Lạnh', 6, 100),
(207, 'Bàn VIP 7', 'Phòng Lạnh', 7, 100),
(208, 'Bàn VIP 8', 'Phòng Lạnh', 4, 100),
(209, 'Bàn VIP 9', 'Phòng Lạnh', 5, 100),
(210, 'Bàn VIP 10', 'Phòng Lạnh', 6, 100);

-- 15 Khách hàng thân thiết
INSERT IGNORE INTO customers (phone, name, email, is_member, tenant_id) VALUES
('0911000001', 'Khách Hàng 1', 'khachhang1@gmail.com', 0, 100),
('0911000002', 'Khách Hàng 2', 'khachhang2@gmail.com', 1, 100),
('0911000003', 'Khách Hàng 3', 'khachhang3@gmail.com', 0, 100),
('0911000004', 'Khách Hàng 4', 'khachhang4@gmail.com', 1, 100),
('0911000005', 'Khách Hàng 5', 'khachhang5@gmail.com', 0, 100),
('0911000006', 'Khách Hàng 6', 'khachhang6@gmail.com', 1, 100),
('0911000007', 'Khách Hàng 7', 'khachhang7@gmail.com', 0, 100),
('0911000008', 'Khách Hàng 8', 'khachhang8@gmail.com', 1, 100),
('0911000009', 'Khách Hàng 9', 'khachhang9@gmail.com', 0, 100),
('0911000010', 'Khách Hàng 10', 'khachhang10@gmail.com', 1, 100),
('0911000011', 'Khách Hàng 11', 'khachhang11@gmail.com', 0, 100),
('0911000012', 'Khách Hàng 12', 'khachhang12@gmail.com', 1, 100),
('0911000013', 'Khách Hàng 13', 'khachhang13@gmail.com', 0, 100),
('0911000014', 'Khách Hàng 14', 'khachhang14@gmail.com', 1, 100),
('0911000015', 'Khách Hàng 15', 'khachhang15@gmail.com', 0, 100);

-- 8 Phương thức thanh toán điện tử
INSERT IGNORE INTO payment_types (id, title, is_active, icon, tenant_id) VALUES
(200, 'Momo', 1, 'card', 100),
(201, 'ZaloPay', 1, 'card', 100),
(202, 'VNPay', 1, 'card', 100),
(203, 'ShopeePay', 1, 'card', 100),
(204, 'Visa', 1, 'card', 100),
(205, 'MasterCard', 1, 'card', 100),
(206, 'Apple Pay', 1, 'card', 100),
(207, 'Google Pay', 1, 'card', 100);

