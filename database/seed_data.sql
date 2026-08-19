INSERT INTO member_tiers
(tier_name, minimum_spend, points_multiplier)
VALUES
('Bronze', 0, 1.00),
('Silver', 1000, 1.25),
('Gold', 5000, 1.50);


INSERT INTO members
(first_name, last_name, email, tier_id, points_balance, annual_spend)
VALUES
('Marcus', 'Johnson', 'marcus@example.com', 1, 320, 450.00),
('Sarah', 'Williams', 'sarah@example.com', 2, 1450, 2350.00),
('Daniel', 'Lee', 'daniel@example.com', 3, 5200, 7250.00),
('Emily', 'Brown', 'emily@example.com', 1, 175, 290.00),
('Michael', 'Davis', 'michael@example.com', 2, 2100, 3100.00);


INSERT INTO transactions
(member_id, purchase_amount, points_earned)
VALUES
(1, 85.50, 85),
(2, 150.25, 187),
(3, 225.75, 338),
(1, 42.10, 42),
(4, 95.00, 95),
(5, 175.50, 219),
(3, 310.20, 465);


INSERT INTO rewards
(reward_name, points_required)
VALUES
('$5 Grocery Discount', 500),
('$10 Grocery Discount', 900),
('Free Delivery', 1200),
('$25 Grocery Discount', 2000);