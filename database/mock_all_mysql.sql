-- Combined mock SQL for MySQL
-- Sources: clean.sql, restropro_saas.sql, mock_data.sql, mock_transactions.sql, mock_data_large.sql

-- ===== clean.sql =====
DELETE FROM order_items WHERE tenant_id = 100;
DELETE FROM orders WHERE tenant_id = 100;
DELETE FROM invoices WHERE tenant_id = 100;
DELETE FROM reservations WHERE tenant_id = 100;
DELETE FROM feedbacks WHERE tenant_id = 100;
DELETE FROM menu_item_variants WHERE tenant_id = 100;
DELETE FROM menu_item_addons WHERE tenant_id = 100;
DELETE FROM menu_items WHERE tenant_id = 100;
DELETE FROM categories WHERE tenant_id = 100;
DELETE FROM store_tables WHERE tenant_id = 100;
DELETE FROM payment_types WHERE tenant_id = 100;
DELETE FROM customers WHERE tenant_id = 100;
DELETE FROM users WHERE tenant_id = 100;
DELETE FROM inventory_items WHERE tenant_id = 100;
DELETE FROM store_details WHERE tenant_id = 100;
DELETE FROM tenants WHERE id = 100;

-- ===== restropro_saas.sql / mock_data.sql =====
-- Xóa dữ liệu cũ nếu bị kẹt (nếu có khóa ngoại thì thôi, ta dùng tenant_id = 100 để tách biệt hoàn toàn)
-- Tạo nhà hàng (tenant)
INSERT INTO tenants (id, name, is_active, subscription_id, payment_customer_id) 
VALUES (100, 'Nhà hàng Mock Data', 1, 'sub_mock', 'cus_mock');

-- Tạo siêu quản trị viên (super admin - nếu cần)
-- Mật khẩu cho admin là "admin"
INSERT INTO superadmins (email, password, name) 
VALUES ('super@test.com', '$2b$10$I/T244iuCBsKDUNMuV52Qu56KARzjeTmHqi8N4dEDjEBjIkR/TG.e', 'Super Admin');

-- Tạo tài khoản Quản lý & Nhân viên
-- Mật khẩu cho admin là "admin" | Mật khẩu cho manager là "manager"
INSERT INTO users (username, password, name, role, designation, phone, email, tenant_id) VALUES
('admin', '$2b$10$I/T244iuCBsKDUNMuV52Qu56KARzjeTmHqi8N4dEDjEBjIkR/TG.e', 'Chủ nhà hàng (Admin)', 'admin', 'Manager', '0123456789', 'admin@test.com', 100),
('manager', '$2b$10$jzF1hxpw78xA3BiVQIcuhOw08b/an0Q0AsW2fG2OjX4FcgiV4bVFW', 'Nhân viên (Manager)', 'user', 'Staff', '0123456780', 'manager@test.com', 100);

-- Cấu hình thông tin cửa hàng
INSERT INTO store_details (store_name, address, phone, email, currency, tenant_id, is_qr_menu_enabled) 
VALUES ('Nhà hàng Mock Data', '123 Fake Street', '0123456789', 'mock@test.com', 'VND', 100, 1);

-- Thuế (VAT)
INSERT INTO taxes (id, title, rate, type, tenant_id) VALUES 
(100, 'VAT', 10.00, 'inclusive', 100);

-- Danh mục món ăn
INSERT INTO categories (id, title, tenant_id) VALUES 
(101, 'Món Chính', 100),
(102, 'Đồ Uống', 100),
(103, 'Tráng Miệng', 100);

-- Sản phẩm / Món ăn
INSERT INTO menu_items (id, title, price, net_price, tax_id, category, tenant_id, image) VALUES 
(101, 'Cơm Tấm Sườn Bì Trả', 45000.00, 45000.00, 100, 101, 100, ''),
(102, 'Phở Bò', 50000.00, 50000.00, 100, 101, 100, ''),
(103, 'Trà Đá', 5000.00, 5000.00, 100, 102, 100, ''),
(104, 'Cà Phê Sữa Đá', 25000.00, 25000.00, 100, 102, 100, ''),
(105, 'Bánh Flan', 15000.00, 15000.00, 100, 103, 100, '');

-- Biến thể (Variants) cho sản phẩm (Vd size lớn, nhỏ)
INSERT INTO menu_item_variants (id, item_id, title, price, tenant_id) VALUES 
(101, 101, 'Phần Vừa', 0.00, 100),
(102, 101, 'Phần Lớn', 10000.00, 100),
(103, 102, 'Tô Thường', 0.00, 100),
(104, 102, 'Tô Đặc Biệt', 15000.00, 100);

-- Topping (Addons)
INSERT INTO menu_item_addons (id, item_id, title, price, tenant_id) VALUES 
(101, 101, 'Thêm Trứng', 5000.00, 100),
(102, 104, 'Thêm Sữa', 5000.00, 100);

-- Bàn ăn
INSERT INTO store_tables (id, table_title, floor, seating_capacity, tenant_id) VALUES 
(101, 'Bàn 1 (Tầng trệt)', 'Tầng Trệt', 4, 100),
(102, 'Bàn 2 (Tầng trệt)', 'Tầng Trệt', 4, 100),
(103, 'Bàn 3 (Tầng 2)', 'Tầng 2', 6, 100),
(104, 'Bàn 4 (Tầng 2)', 'Tầng 2', 6, 100);

-- Khách hàng thành viên
INSERT INTO customers (phone, name, email, is_member, tenant_id) VALUES 
('0909123456', 'Nguyễn Văn A', 'nguyenvana@gmail.com', 1, 100),
('0909654321', 'Trần Thị B', 'tranthib@gmail.com', 0, 100);

-- Phương thức thanh toán
INSERT INTO payment_types (id, title, is_active, icon, tenant_id) VALUES
(100, 'Tiền măt (Cash)', 1, 'cash', 100),
(101, 'Chuyển khoản (Card)', 1, 'card', 100);

-- ===== mock_transactions.sql =====
-- MOCK DATA GIAO DỊCH

-- 15 Hóa đơn
INSERT IGNORE INTO invoices (id, created_at, sub_total, tax_total, total, payment_type_id, tenant_id) VALUES
(201, NOW() - INTERVAL 16 DAY, 153000, 17000, 170000, 101, 100),
(202, NOW() - INTERVAL 21 DAY, 90000, 10000, 100000, 100, 100),
(203, NOW() - INTERVAL 20 DAY, 522000, 58000, 580000, 101, 100),
(204, NOW() - INTERVAL 19 DAY, 270000, 30000, 300000, 100, 100),
(205, NOW() - INTERVAL 20 DAY, 108000, 12000, 120000, 101, 100),
(206, NOW() - INTERVAL 12 DAY, 351000, 39000, 390000, 100, 100),
(207, NOW() - INTERVAL 28 DAY, 378000, 42000, 420000, 101, 100),
(208, NOW() - INTERVAL 13 DAY, 288000, 32000, 320000, 100, 100),
(209, NOW() - INTERVAL 28 DAY, 423000, 47000, 470000, 101, 100),
(210, NOW() - INTERVAL 1 DAY, 441000, 49000, 490000, 100, 100),
(211, NOW() - INTERVAL 17 DAY, 117000, 13000, 130000, 101, 100),
(212, NOW() - INTERVAL 8 DAY, 351000, 39000, 390000, 100, 100),
(213, NOW() - INTERVAL 24 DAY, 360000, 40000, 400000, 101, 100),
(214, NOW() - INTERVAL 4 DAY, 531000, 59000, 590000, 100, 100),
(215, NOW() - INTERVAL 9 DAY, 108000, 12000, 120000, 101, 100);

-- 15 Đơn hàng
INSERT IGNORE INTO orders (id, date, delivery_type, customer_type, customer_id, table_id, status, token_no, payment_status, invoice_id, tenant_id) VALUES
(201, NOW() - INTERVAL 15 DAY, 'Dine-in', 'CUSTOMER', '0911000002', 202, 'completed', 1, 'paid', 201, 100),
(202, NOW() - INTERVAL 12 DAY, 'Dine-in', 'CUSTOMER', '0911000003', 203, 'cancelled', 2, 'paid', 202, 100),
(203, NOW() - INTERVAL 8 DAY, 'Dine-in', 'CUSTOMER', '0911000004', 204, 'created', 3, 'paid', 203, 100),
(204, NOW() - INTERVAL 23 DAY, 'Dine-in', 'CUSTOMER', '0911000005', 205, 'completed', 4, 'paid', 204, 100),
(205, NOW() - INTERVAL 19 DAY, 'Dine-in', 'CUSTOMER', '0911000006', 201, 'cancelled', 5, 'paid', 205, 100),
(206, NOW() - INTERVAL 25 DAY, 'Dine-in', 'CUSTOMER', '0911000007', 202, 'created', 6, 'paid', 206, 100),
(207, NOW() - INTERVAL 8 DAY, 'Dine-in', 'CUSTOMER', '0911000008', 203, 'completed', 7, 'paid', 207, 100),
(208, NOW() - INTERVAL 9 DAY, 'Dine-in', 'CUSTOMER', '0911000009', 204, 'cancelled', 8, 'paid', 208, 100),
(209, NOW() - INTERVAL 3 DAY, 'Dine-in', 'CUSTOMER', '0911000010', 205, 'created', 9, 'paid', 209, 100),
(210, NOW() - INTERVAL 28 DAY, 'Dine-in', 'CUSTOMER', '0911000011', 201, 'completed', 10, 'paid', 210, 100),
(211, NOW() - INTERVAL 12 DAY, 'Dine-in', 'CUSTOMER', '0911000012', 202, 'cancelled', 11, 'paid', 211, 100),
(212, NOW() - INTERVAL 16 DAY, 'Dine-in', 'CUSTOMER', '0911000013', 203, 'created', 12, 'paid', 212, 100),
(213, NOW() - INTERVAL 4 DAY, 'Dine-in', 'CUSTOMER', '0911000014', 204, 'completed', 13, 'paid', 213, 100),
(214, NOW() - INTERVAL 4 DAY, 'Dine-in', 'CUSTOMER', '0911000015', 205, 'cancelled', 14, 'paid', 214, 100),
(215, NOW() - INTERVAL 7 DAY, 'Dine-in', 'CUSTOMER', '0911000001', 201, 'created', 15, 'paid', 215, 100);

-- Chi tiết đơn hàng (Order Items)
INSERT IGNORE INTO order_items (id, order_id, item_id, price, quantity, status, date, notes, tenant_id) VALUES
(201, 201, 201, 15000, 1, 'preparing', NOW(), '', 100),
(202, 201, 202, 30000, 2, 'preparing', NOW(), '', 100),
(203, 201, 203, 45000, 1, 'preparing', NOW(), '', 100),
(204, 202, 202, 15000, 1, 'completed', NOW(), '', 100),
(205, 202, 203, 30000, 2, 'completed', NOW(), '', 100),
(206, 202, 204, 45000, 1, 'completed', NOW(), '', 100),
(207, 202, 205, 60000, 2, 'completed', NOW(), '', 100),
(208, 203, 203, 15000, 1, 'preparing', NOW(), '', 100),
(209, 203, 204, 30000, 2, 'preparing', NOW(), '', 100),
(210, 204, 204, 15000, 1, 'completed', NOW(), '', 100),
(211, 204, 205, 30000, 2, 'completed', NOW(), '', 100),
(212, 204, 206, 45000, 1, 'completed', NOW(), '', 100),
(213, 205, 205, 15000, 1, 'preparing', NOW(), '', 100),
(214, 205, 206, 30000, 2, 'preparing', NOW(), '', 100),
(215, 205, 207, 45000, 1, 'preparing', NOW(), '', 100),
(216, 205, 208, 60000, 2, 'preparing', NOW(), '', 100),
(217, 206, 206, 15000, 1, 'completed', NOW(), '', 100),
(218, 206, 207, 30000, 2, 'completed', NOW(), '', 100),
(219, 207, 207, 15000, 1, 'preparing', NOW(), '', 100),
(220, 207, 208, 30000, 2, 'preparing', NOW(), '', 100),
(221, 207, 209, 45000, 1, 'preparing', NOW(), '', 100),
(222, 208, 208, 15000, 1, 'completed', NOW(), '', 100),
(223, 208, 209, 30000, 2, 'completed', NOW(), '', 100),
(224, 208, 200, 45000, 1, 'completed', NOW(), '', 100),
(225, 208, 201, 60000, 2, 'completed', NOW(), '', 100),
(226, 209, 209, 15000, 1, 'preparing', NOW(), '', 100),
(227, 209, 200, 30000, 2, 'preparing', NOW(), '', 100),
(228, 210, 200, 15000, 1, 'completed', NOW(), '', 100),
(229, 210, 201, 30000, 2, 'completed', NOW(), '', 100),
(230, 210, 202, 45000, 1, 'completed', NOW(), '', 100),
(231, 211, 201, 15000, 1, 'preparing', NOW(), '', 100),
(232, 211, 202, 30000, 2, 'preparing', NOW(), '', 100),
(233, 211, 203, 45000, 1, 'preparing', NOW(), '', 100),
(234, 211, 204, 60000, 2, 'preparing', NOW(), '', 100),
(235, 212, 202, 15000, 1, 'completed', NOW(), '', 100),
(236, 212, 203, 30000, 2, 'completed', NOW(), '', 100),
(237, 213, 203, 15000, 1, 'preparing', NOW(), '', 100),
(238, 213, 204, 30000, 2, 'preparing', NOW(), '', 100),
(239, 213, 205, 45000, 1, 'preparing', NOW(), '', 100),
(240, 214, 204, 15000, 1, 'completed', NOW(), '', 100),
(241, 214, 205, 30000, 2, 'completed', NOW(), '', 100),
(242, 214, 206, 45000, 1, 'completed', NOW(), '', 100),
(243, 214, 207, 60000, 2, 'completed', NOW(), '', 100),
(244, 215, 205, 15000, 1, 'preparing', NOW(), '', 100),
(245, 215, 206, 30000, 2, 'preparing', NOW(), '', 100);

-- Đặt bàn (Reservations)
INSERT IGNORE INTO reservations (id, customer_id, date, table_id, status, notes, people_count, unique_code, tenant_id) VALUES
(201, '0911000002', NOW() + INTERVAL 1 DAY, 202, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680791', 100),
(202, '0911000003', NOW() + INTERVAL 2 DAY, 203, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680792', 100),
(203, '0911000004', NOW() + INTERVAL 3 DAY, 204, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680793', 100),
(204, '0911000005', NOW() + INTERVAL 4 DAY, 205, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680794', 100),
(205, '0911000006', NOW() + INTERVAL 5 DAY, 201, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680795', 100),
(206, '0911000007', NOW() + INTERVAL 6 DAY, 202, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680796', 100),
(207, '0911000008', NOW() + INTERVAL 7 DAY, 203, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680797', 100),
(208, '0911000009', NOW() + INTERVAL 8 DAY, 204, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680798', 100),
(209, '0911000010', NOW() + INTERVAL 9 DAY, 205, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV17793308680799', 100),
(210, '0911000011', NOW() + INTERVAL 10 DAY, 201, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV177933086807910', 100),
(211, '0911000012', NOW() + INTERVAL 11 DAY, 202, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV177933086807911', 100),
(212, '0911000013', NOW() + INTERVAL 12 DAY, 203, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV177933086807912', 100),
(213, '0911000014', NOW() + INTERVAL 13 DAY, 204, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV177933086807913', 100),
(214, '0911000015', NOW() + INTERVAL 14 DAY, 205, 'confirmed', 'Kỷ niệm sinh nhật', 4, 'RESV177933086807914', 100),
(215, '0911000001', NOW() + INTERVAL 15 DAY, 201, 'pending', 'Kỷ niệm sinh nhật', 4, 'RESV177933086807915', 100);

-- Phản hồi khách hàng (Feedbacks)
INSERT IGNORE INTO feedbacks (id, invoice_id, phone, date, created_by, average_rating, food_quality_rating, service_rating, staff_behavior_rating, ambiance_rating, recommend_rating, remarks, tenant_id) VALUES
(201, 201, '0911000002', NOW() - INTERVAL 1 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(202, 202, '0911000003', NOW() - INTERVAL 2 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(203, 203, '0911000004', NOW() - INTERVAL 3 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(204, 204, '0911000005', NOW() - INTERVAL 4 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(205, 205, '0911000006', NOW() - INTERVAL 5 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(206, 206, '0911000007', NOW() - INTERVAL 6 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(207, 207, '0911000008', NOW() - INTERVAL 7 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(208, 208, '0911000009', NOW() - INTERVAL 8 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(209, 209, '0911000010', NOW() - INTERVAL 9 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(210, 210, '0911000011', NOW() - INTERVAL 10 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100);

-- ===== mock_data_large.sql =====
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
