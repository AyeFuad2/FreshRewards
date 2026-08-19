from flask import Flask, jsonify, request
from rewards import calculate_points

app = Flask(__name__)


@app.route("/health", methods=["GET"])
def health_check():
    return jsonify({
        "status": "healthy",
        "service": "FreshRewards API"
    }), 200


@app.route("/calculate-points", methods=["POST"])
def points():
    data = request.get_json()

    if not data:
        return jsonify({"error": "Request body required"}), 400

    amount = data.get("amount")
    tier = data.get("tier")

    if amount is None or tier is None:
        return jsonify({
            "error": "amount and tier are required"
        }), 400

    try:
        points_earned = calculate_points(float(amount), tier)

        return jsonify({
            "purchase_amount": amount,
            "membership_tier": tier,
            "points_earned": points_earned
        }), 200

    except ValueError as error:
        return jsonify({"error": str(error)}), 400


if __name__ == "__main__":
    app.run(debug=True)