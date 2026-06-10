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
('admin@test.com', '$2b$10$I/T244iuCBsKDUNMuV52Qu56KARzjeTmHqi8N4dEDjEBjIkR/TG.e', 'Chủ nhà hàng (Admin)', 'admin', 'Manager', '0123456789', 'admin@test.com', 100),
('manager@test.com', '$2b$10$jzF1hxpw78xA3BiVQIcuhOw08b/an0Q0AsW2fG2OjX4FcgiV4bVFW', 'Nhân viên (Manager)', 'user', 'Staff', '0123456780', 'manager@test.com', 100);

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