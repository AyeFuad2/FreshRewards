from app.rewards import (
    calculate_points,
    can_redeem,
    calculate_new_balance
)


def test_bronze_points():
    assert calculate_points(100, "Bronze") == 100


def test_silver_points():
    assert calculate_points(100, "Silver") == 125


def test_gold_points():
    assert calculate_points(100, "Gold") == 150


def test_reward_redemption():
    assert can_redeem(1500, 1000) is True


def test_insufficient_points():
    assert can_redeem(500, 1000) is False


def test_new_balance():
    assert calculate_new_balance(2000, 500) == 1500