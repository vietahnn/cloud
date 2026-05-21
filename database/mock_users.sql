-- Mock data for users
INSERT IGNORE INTO users (username, password, name, role, designation, phone, email, tenant_id) VALUES
('admin', '$2b$10$I/T244iuCBsKDUNMuV52Qu56KARzjeTmHqi8N4dEDjEBjIkR/TG.e', 'Chủ nhà hàng (Admin)', 'admin', 'Manager', '0123456789', 'admin@test.com', 100),
('manager', '$2b$10$jzF1hxpw78xA3BiVQIcuhOw08b/an0Q0AsW2fG2OjX4FcgiV4bVFW', 'Nhân viên (Manager)', 'user', 'Staff', '0123456780', 'manager@test.com', 100),
('nhanvien1', '$2b$10$4CFY05uu./.DnsLfmaJOd.RnYRdZ2klwzy8y8xtwX5O6r53dx/gBW', 'Nhân viên 1', 'user', 'Phục Vụ', '0800000001', 'nhanvien1@nhahang.com', 100);
