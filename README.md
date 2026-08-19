# FreshRewards

FreshRewards is a grocery store membership and rewards system designed to manage customer memberships, purchase transactions, reward points, membership tiers, and reward redemptions.

The project started as a systems analysis case study and was expanded into a working backend prototype using **Python, Flask, PostgreSQL, SQL, and REST API concepts**.

## Project Overview

FreshRewards demonstrates how a loyalty platform could support customers and store operations through a centralized rewards system.

The application is designed to:

- Manage customer membership accounts
- Track purchases and transaction history
- Calculate reward points based on membership tier
- Maintain customer point balances
- Support Bronze, Silver, and Gold membership tiers
- Determine reward eligibility
- Track reward redemptions
- Provide SQL-based reporting and analytics
- Expose backend functionality through REST API endpoints
- Support troubleshooting and system health checks

## Technology Stack

| Technology | Usage |
|---|---|
| Python | Backend logic and automation |
| Flask | REST API |
| PostgreSQL | Relational database |
| SQL | Queries, reporting, joins, views, and analytics |
| Pytest | Unit testing |
| Git/GitHub | Version control and project management |

## Project Structure

```text
FreshRewards/
│
├── app/
│   ├── app.py
│   ├── database.py
│   └── rewards.py
│
├── database/
│   ├── schema.sql
│   ├── seed_data.sql
│   ├── queries.sql
│   └── views.sql
│
├── docs/
│   ├── CASE_STUDY.md
│   └── TROUBLESHOOTING.md
│
├── scripts/
│   └── health_check.py
│
├── tests/
│   └── test_rewards.py
│
├── .env.example
├── .gitignore
├── requirements.txt
└── README.md
```

## Database Design

FreshRewards uses a relational database model with tables for:

- `member_tiers`
- `members`
- `transactions`
- `rewards`
- `redemptions`

Primary and foreign key relationships are used to maintain data integrity between customers, transactions, membership tiers, and rewards.

Indexes are also included for commonly searched transaction fields.

## SQL Features

The project contains SQL examples for common application-support and reporting scenarios, including:

- Customer lookup
- Transaction history
- INNER JOIN and LEFT JOIN operations
- Aggregate functions such as `COUNT`, `SUM`, and `AVG`
- `GROUP BY` and `HAVING`
- Duplicate account detection
- Membership tier analysis
- Revenue reporting
- Reward eligibility
- Date-based transaction filtering
- Database views
- Primary and foreign key relationships
- Indexing

Example:

```sql
SELECT
    m.member_id,
    m.first_name,
    m.last_name,
    SUM(t.purchase_amount) AS total_spent
FROM members m
INNER JOIN transactions t
    ON m.member_id = t.member_id
GROUP BY
    m.member_id,
    m.first_name,
    m.last_name
ORDER BY total_spent DESC;
```

## Rewards Logic

Customers earn points based on their membership tier.

| Tier | Points Multiplier |
|---|---:|
| Bronze | 1.00x |
| Silver | 1.25x |
| Gold | 1.50x |

For example, a Gold member making a $100 purchase earns:

```text
$100 × 1.50 = 150 points
```

The Python backend handles point calculations, reward eligibility, and balance validation.

## REST API

FreshRewards includes a Flask API for interacting with the rewards system.

### Health Check

```http
GET /health
```

Example response:

```json
{
  "status": "healthy",
  "service": "FreshRewards API"
}
```

### Calculate Reward Points

```http
POST /calculate-points
```

Example request:

```json
{
  "amount": 100,
  "tier": "Gold"
}
```

Example response:

```json
{
  "purchase_amount": 100,
  "membership_tier": "Gold",
  "points_earned": 150
}
```

The endpoint also includes validation and HTTP `400` responses for invalid requests.

## Testing

Unit tests are included for the rewards calculation logic.

Run the tests with:

```bash
python -m pytest
```

Tests validate:

- Bronze point calculations
- Silver point calculations
- Gold point calculations
- Reward eligibility
- Insufficient point balances
- Point balance updates

## Local Setup

### 1. Clone the repository

```bash
git clone https://github.com/AyeFuad2/FreshRewards.git
cd FreshRewards
```

### 2. Create a virtual environment

Windows:

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure environment variables

Copy `.env.example` to `.env` and configure your local PostgreSQL connection.

```text
DB_HOST=localhost
DB_PORT=5432
DB_NAME=freshrewards
DB_USER=postgres
DB_PASSWORD=your_password_here
```

Do not commit the `.env` file.

### 5. Initialize the database

Run:

```text
database/schema.sql
```

followed by:

```text
database/seed_data.sql
```

against your PostgreSQL database.

### 6. Start the API

```bash
python app/app.py
```

The Flask development server can then be used to test the API locally.

## Troubleshooting

The project includes production-style troubleshooting documentation covering scenarios such as:

- Database connectivity failures
- Incorrect reward balances
- Duplicate transactions
- API errors
- Failed reward redemptions
- Slow SQL queries
- Application health-check failures

See `docs/TROUBLESHOOTING.md` for additional information.

## What I Learned

This project provided hands-on practice with:

- Relational database design
- PostgreSQL and SQL
- SQL joins and aggregate queries
- Python backend development
- REST APIs and JSON
- HTTP methods and status codes
- Application troubleshooting
- Data validation
- Unit testing
- Git and GitHub version control

## Future Improvements

Future development could include:

- JWT authentication
- Full PostgreSQL integration with the Flask API
- Customer registration endpoints
- Transaction creation endpoints
- Reward redemption endpoints
- Docker containerization
- AWS deployment
- CI/CD with GitHub Actions
- Logging and monitoring
- Administrative analytics dashboard

## Documentation

The `docs` directory contains the original systems analysis case study as well as technical troubleshooting documentation.

---

**FreshRewards — Grocery Store Membership & Rewards System**
