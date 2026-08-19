CREATE TABLE member_tiers (
    tier_id SERIAL PRIMARY KEY,
    tier_name VARCHAR(20) UNIQUE NOT NULL,
    minimum_spend DECIMAL(10,2) NOT NULL,
    points_multiplier DECIMAL(4,2) NOT NULL
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    tier_id INTEGER REFERENCES member_tiers(tier_id),
    points_balance INTEGER DEFAULT 0,
    annual_spend DECIMAL(10,2) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    purchase_amount DECIMAL(10,2) NOT NULL CHECK (purchase_amount > 0),
    points_earned INTEGER NOT NULL DEFAULT 0,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rewards (
    reward_id SERIAL PRIMARY KEY,
    reward_name VARCHAR(100) NOT NULL,
    points_required INTEGER NOT NULL,
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE redemptions (
    redemption_id SERIAL PRIMARY KEY,
    member_id INTEGER NOT NULL REFERENCES members(member_id),
    reward_id INTEGER NOT NULL REFERENCES rewards(reward_id),
    points_used INTEGER NOT NULL,
    redeemed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_transactions_member
ON transactions(member_id);

CREATE INDEX idx_transactions_date
ON transactions(transaction_date);