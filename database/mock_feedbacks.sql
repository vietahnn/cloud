-- Mock data for feedbacks
INSERT IGNORE INTO feedbacks (id, invoice_id, phone, date, created_by, average_rating, food_quality_rating, service_rating, staff_behavior_rating, ambiance_rating, recommend_rating, remarks, tenant_id) VALUES
(201, 201, '0911000002', NOW() - INTERVAL 1 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100),
(202, 202, '0911000003', NOW() - INTERVAL 2 DAY, 'Customer', 5, 5, 4.5, 5, 4, 5, 'Rất ngon, sẽ quay lại!', 100);
