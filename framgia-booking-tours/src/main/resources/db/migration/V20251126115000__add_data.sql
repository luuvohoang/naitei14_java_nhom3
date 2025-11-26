USE framgia_booking_tours;

-- ============================
-- 1) CATEGORIES
-- ============================
INSERT INTO categories (id, name, description) VALUES
                                                   (1, 'Biển đảo', 'Tour tham quan biển, đảo'),
                                                   (2, 'Núi rừng', 'Tour trekking, leo núi'),
                                                   (3, 'Thành phố', 'City tour tham quan nội thành');

-- ============================
-- 2) PROFILES
-- ============================
INSERT INTO profiles (user_id, full_name, phone, address, avatar_url, bank_name, bank_account_number) VALUES
                                                                                                          (1, 'Admin Huy', '0901000001', 'Hà Nội', NULL, 'Vietcombank', '0011223344'),
                                                                                                          (2, 'Admin Phương', '0901000002', 'Đà Nẵng', NULL, 'Techcombank', '2233445566'),
                                                                                                          (3, 'Admin Hoàng', '0901000003', 'Hồ Chí Minh', NULL, 'MB Bank', '5566778899'),
                                                                                                          (4, 'Hoàng Kim Thạch', '0901000004', 'Đà Nẵng', NULL, 'VietinBank', '1122334455'),
                                                                                                          (5, 'Lộc', '0901000005', 'Quảng Nam', NULL, 'BIDV', '8899001122'),
                                                                                                          (6, 'User Bị Khóa', '0901000006', 'Huế', NULL, 'ACB', '7788990011');

-- ============================
-- 3) TOURS
-- ============================
INSERT INTO tours (id, category_id, creator_id, name, description, location, price, duration_days, available_slots, image_url, status)
VALUES
    (1, 1, 1, 'Tour Đà Nẵng - Sơn Trà', 'Tham quan Sơn Trà và biển Mỹ Khê', 'Đà Nẵng', 1500000, 2, 20, NULL, 'AVAILABLE'),
    (2, 1, 2, 'Tour Nha Trang 3N2Đ', 'Khám phá biển đảo Nha Trang', 'Nha Trang', 3200000, 3, 15, NULL, 'AVAILABLE'),
    (3, 2, 3, 'Tour Fansipan Trekking', 'Leo núi Fansipan - nóc nhà Đông Dương', 'Lào Cai', 2800000, 3, 10, NULL, 'AVAILABLE'),
    (4, 3, 1, 'City Tour Hà Nội', 'Tham quan Hồ Gươm, Phố Cổ', 'Hà Nội', 900000, 1, 30, NULL, 'AVAILABLE');

-- ============================
-- 4) BOOKINGS
-- ============================
INSERT INTO bookings (id, user_id, tour_id, start_date, num_people, total_price, status, payment_method)
VALUES
    (1, 4, 1, '2025-03-10', 2, 3000000, 'PAID', 'BANKING'),
    (2, 4, 3, '2025-04-01', 1, 2800000, 'PENDING', 'BANKING'),
    (3, 5, 2, '2025-05-15', 3, 9600000, 'PAID', 'CASH'),
    (4, 5, 4, '2025-03-22', 2, 1800000, 'CANCELLED', 'BANKING');

-- ============================
-- 5) PAYMENTS
-- ============================
INSERT INTO payments (booking_id, amount, payment_status, bank_name, account_number)
VALUES
    (1, 3000000, 'SUCCESS', 'VietinBank', '1122334455'),
    (2, 2800000, 'PENDING', 'VietinBank', '1122334455'),
    (3, 9600000, 'SUCCESS', 'BIDV', '8899001122'),
    (4, 1800000, 'FAILED', 'BIDV', '8899001122');

-- ============================
-- 6) REVIEWS (chỉ booking PAID)
-- ============================
INSERT INTO reviews (booking_id, title, content, rating)
VALUES
    (1, 'Tour Sơn Trà tuyệt vời', 'Hướng dẫn viên thân thiện, cảnh đẹp', 5),
    (3, 'Biển Nha Trang đẹp', 'Nước trong, lịch trình hợp lý', 4);

-- ============================
-- 7) COMMENTS
-- ============================
INSERT INTO comments (review_id, user_id, content)
VALUES
    (1, 5, 'Đúng rồi, tour này mình đi cũng rất thích!'),
    (2, 4, 'Cảm ơn bạn review, mình đang định đặt tour này.');

-- ============================
-- 8) REVIEW LIKES
-- ============================
INSERT INTO review_likes (user_id, review_id)
VALUES
    (4, 1),
    (5, 1),
    (4, 2);
