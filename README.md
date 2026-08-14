# Zepto E-Commerce SQL Data Analysis

A SQL project analyzing inventory and pricing data from **Zepto**, a quick-commerce grocery delivery platform. The project covers data exploration, data cleaning, and business-driven analysis using PostgreSQL.

## 📁 Dataset

- **File:** `zepto_v2.csv`
- **Rows:** 3,732 SKUs
- **Columns:** `category`, `name`, `mrp`, `discountPercent`, `availableQuantity`, `discountedSellingPrice`, `weightInGms`, `outOfStock`, `quantity`

Each row represents a unique product (SKU) listed on Zepto, including pricing, discount, stock status, and weight details.

## 🛠️ Tools Used

- PostgreSQL
- SQL (DDL, DML, aggregation, filtering, CASE statements)

## 🔍 Project Workflow

### 1. Data Exploration
- Checked row count and sample records
- Identified null values across key columns
- Explored distinct product categories
- Compared in-stock vs out-of-stock product counts
- Found duplicate product names (multiple SKUs per product)

### 2. Data Cleaning
- Removed rows with `mrp = 0` (invalid records)
- Converted `mrp` and `discountedSellingPrice` from paise to rupees for consistency

### 3. Business Analysis
| # | Business Question |
|---|---|
| Q1 | Top 10 best-value products based on discount percentage |
| Q2 | High-MRP products (>₹300) that are currently out of stock |
| Q3 | Estimated revenue per product category |
| Q4 | Premium products (MRP > ₹500) with low discount (<10%) |
| Q5 | Top 5 categories offering the highest average discount |
| Q6 | Price-per-gram for products above 100g, sorted by best value |
| Q7 | Categorizing products into Low / Medium / Bulk based on weight |
| Q8 | Total inventory weight per category |

## 📊 Key Insights

- Identified categories with the highest estimated revenue based on stock and selling price.
- Flagged high-value products going out of stock — a potential missed-revenue signal.
- Calculated price-per-gram to surface the best value-for-money products across weight tiers.
- Segmented the catalog by weight class (Low/Medium/Bulk) to understand inventory composition.

## 📂 Repository Structure

```
├── README.md
├── zepto_v2.csv              # Raw dataset
└── zepto_sql_project.sql     # Full SQL script (exploration, cleaning, analysis)
```

## 🚀 How to Run

1. Create a PostgreSQL database.
2. Run `zepto_sql_project.sql` — it creates the `zepto` table, loads the schema, and runs all queries in sequence.
3. Import `zepto_v2.csv` into the `zepto` table before running the analysis queries (e.g. via `\copy` in `psql` or pgAdmin's import tool).

## 👤 Author

Bhuvana — B.E. in AI & Data Science
