# 🧴 D2C Skincare E-Commerce — SQL & Power BI Analytics Portfolio

![SSMS](https://img.shields.io/badge/SQL%20Server%20Management%20Studio-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![PowerBI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Kaggle](https://img.shields.io/badge/Kaggle-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)

## 📌 Project Overview

This project is a two-part analytics portfolio built on a synthetic relational dataset from a Direct-to-Consumer (D2C) Skincare E-Commerce business:

1. **SQL Analysis** — structured queries on Microsoft SQL Server to answer business questions on customer behavior, product performance, sales trends, and returns.
2. **Power BI Dashboard** — an interactive multi-page dashboard built on top of the same relational model, covering revenue, customer segmentation (RFM), product profitability, and return analysis.

**Dataset Source:** [D2C Skincare E-Commerce Analytics Dataset — Kaggle](https://www.kaggle.com/datasets/kaushalvyas16/d2c-skincare-e-commerce-analytics-dataset)

---

## 🗂️ Database Schema

The database `SkincareDB` consists of 6 relational tables:

| Table | Rows | Columns | Description |
|---|---|---|---|
| `customers` | 500 | 8 | Customer demographics and acquisition channel |
| `orders` | 1,250 | 11 | Order transactions with payment and sales channel info |
| `order_items` | 2,042 | 7 | Line items per order with product, quantity, and pricing |
| `products` | 28 | 11 | Product catalog with category, concern, ingredient, and pricing |
| `returns` | 79 | 6 | Return records with reason and refund status |
| `reviews` | 494 | 6 | Customer ratings per product |

### Entity Relationship

```
customers ──< orders ──< order_items >── products
                │                            │
                └──────────< returns >───────┘
                │
reviews >── customers
reviews >── products
reviews >── orders
```

**Foreign Key Constraints:**
- `orders.customer_id` → `customers.customer_id`
- `order_items.order_id` → `orders.order_id`
- `order_items.product_id` → `products.product_id`
- `returns.order_id` → `orders.order_id`
- `returns.product_id` → `products.product_id`
- `reviews.customer_id` → `customers.customer_id`
- `reviews.product_id` → `products.product_id`
- `reviews.order_id` → `orders.order_id`

---

## 📂 File Structure

```
sql-skincare-ecommerce-analysis/
│
├── create_database.sql             # Create SkincareDB database
├── create_tables.sql               # DDL for all 6 tables with FK constraints
├── insert_data.sql                 # BULK INSERT scripts for all tables
│
├── profitable_channel.sql          # Acquisition channel by revenue
├── customer_distribution.sql       # Customer distribution by gender, age group, state
├── customer_segmentation.sql       # High / Mid / Low value customer segmentation
├── loyal_customer.sql              # Top 10 most loyal customers by order frequency
├── top10_product.sql               # Top 10 products by quantity sold and revenue
├── sales_comparison.sql            # Sales channel comparison (Website vs Mobile App)
├── highest_lowest_rating.sql       # Products with highest and lowest avg rating
├── ratings_sales_correlation.sql   # Correlation between product rating and sales volume
├── return_reason.sql               # Most frequent return reasons with percentage
├── refund_status.sql               # Refund status breakdown with percentage
│
├── Skincare_Analysis.pbix          # Power BI dashboard file
│
└── README.md
```

---

## 🔍 SQL Analysis Summary

### 👥 Customer Analysis

**`profitable_channel.sql`** — Acquisition Channel Performance

Identifies which marketing channel (YouTube, Instagram, Google Search, Website Direct, Referral) generates the highest total revenue and average order value by joining `customers` and `orders`.

**`customer_distribution.sql`** — Customer Distribution

Breaks down the customer base by gender, age group, and state to understand demographic composition using `GROUP BY` and `COUNT`.

**`customer_segmentation.sql`** — Customer Segmentation (High / Mid / Low Value)

Classifies each customer into High Value (≥5,000), Mid Value (≥2,000), or Low Value segments based on their cumulative spending using `CASE WHEN` and `SUM` with `JOIN`.

**`loyal_customer.sql`** — Top 10 Loyal Customers

Ranks the top 10 most loyal customers by order frequency and total spending using `TOP 10`, `COUNT`, and multi-column `ORDER BY`.

---

### 📦 Product Analysis

**`top10_product.sql`** — Top 10 Best-Selling Products

Ranks the top 10 products by total quantity sold and revenue by joining `order_items` and `products`.

**`highest_lowest_rating.sql`** — Highest & Lowest Rated Products

Calculates average, minimum, and maximum rating per product using `AVG`, `MIN`, `MAX` with `JOIN` between `products` and `reviews`.

**`ratings_sales_correlation.sql`** — Rating vs Sales Volume Correlation

Combines rating data and sales data in a single query using multi-table `JOIN` across `products`, `order_items`, and `reviews`. Uses `COUNT(DISTINCT)` to prevent row multiplication.

---

### 📊 Sales Analysis

**`sales_comparison.sql`** — Sales Channel Comparison

Compares Website vs Mobile App performance across total orders, total revenue, average order value, and discount given using `GROUP BY sales_channel`.

---

### 🔄 Return Analysis

**`return_reason.sql`** — Return Reason Breakdown

Identifies the most frequent return reasons and their percentage contribution to total returns using Window Function `SUM() OVER()`.

**`refund_status.sql`** — Refund Status Breakdown

Summarizes the distribution of refund statuses (Replacement Sent, Refunded, Under Review, etc.) with percentage using `SUM() OVER()`.

---

## 💡 Key SQL Concepts Used

| Concept | Applied In |
|---|---|
| `INNER JOIN` | `profitable_channel`, `customer_segmentation`, `loyal_customer`, `top10_product`, `ratings_sales_correlation` |
| Multi-table `JOIN` (3 tables) | `ratings_sales_correlation` |
| `LEFT JOIN` | `highest_lowest_rating`, `return_reason` |
| `GROUP BY` + Aggregation (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`) | All analysis files |
| `CASE WHEN` | `customer_segmentation` |
| `TOP N` | `loyal_customer`, `top10_product` |
| Window Function `OVER()` | `return_reason`, `refund_status` |
| `COUNT(DISTINCT)` | `profitable_channel`, `ratings_sales_correlation` |
| `DECIMAL` casting | `highest_lowest_rating`, `ratings_sales_correlation` |
| `BULK INSERT` | `insert_data` |
| `PRIMARY KEY` + `FOREIGN KEY` | `create_tables` |

---

## 📈 Power BI Dashboard

An interactive 4-page Power BI dashboard was built on the same relational data model to complement the SQL analysis, translating raw queries into a visual, business-ready reporting tool.

### Pages

1. **Executive Overview** — Total Revenue, Total Orders, AOV, Total Customers, and Return Rate KPIs; monthly revenue trend; revenue by product category; order distribution by sales channel (Website / Mobile App / Marketplace).
2. **Customer & RFM Segmentation** — customer-level Recency, Frequency, and Monetary (RFM) analysis; customer distribution by acquisition channel and age group; a Frequency-vs-Monetary scatter plot for identifying high-value customer segments.
3. **Product Profitability** — revenue, gross profit, and profit margin per product; gross profit by skin type; top 5 products by revenue; product rating vs. return rate scatter analysis to flag underperforming products.
4. **Return Analysis** — return count and return rate KPIs; monthly return trend; return breakdown by reason and refund status; return rate by product.

### Data Modeling & DAX Highlights

- Built a **star-schema-style relationship model** across all 6 tables using Power BI's relationship engine, resolving multiple filter paths (e.g. `Returns` connects to both `Products` directly and indirectly via `Orders → Order_Items`) by selectively activating relationships and using `USERELATIONSHIP()` in DAX measures where an inactive path was needed.
- Authored a full **DAX measure library** (`Total Revenue`, `AOV`, `Gross Profit`, `Profit Margin %`, `Return Rate`, `Return Rate by Product`, `Customer Recency/Frequency/Monetary`, etc.), using `CALCULATE`, `ALLEXCEPT`, `SUMX`, and `RELATED` for row-level profit and per-customer aggregation.
- Built a dedicated **Date table** with `CALENDAR()` for correct chronological sorting and time-intelligence-ready analysis.
- Implemented an **RFM-based customer segmentation column** using a `SWITCH(TRUE(), ...)` pattern to classify customers into segments such as Champion, Loyal Customer, At Risk, and Lost, based on Recency/Frequency/Monetary thresholds.

---

## ⚙️ Setup & Usage

### Prerequisites
- Microsoft SQL Server Express
- Azure Data Studio
- Power BI Desktop

### Steps

1. Clone this repository
```bash
git clone https://github.com/muktiprab/sql-skincare-ecommerce-analysis.git
```

2. **SQL setup** — open Azure Data Studio and connect to `localhost\SQLEXPRESS`, then run scripts in this order:
```sql
-- Step 1: Create database
-- Run: create_database.sql

-- Step 2: Create all tables with constraints
-- Run: create_tables.sql

-- Step 3: Import data from CSV
-- Update file paths in insert_data.sql to match your local directory
-- Run: insert_data.sql

-- Step 4: Run any analysis query
-- Run any .sql file in the root folder
```

> **Note:** Update the file paths in `insert_data.sql` (e.g. `D:\Project SQL\Customers.csv`) to match the location of your CSV files before running BULK INSERT.

3. **Power BI setup** — open `Skincare_Analysis.pbix` in Power BI Desktop. If prompted, update the data source file paths to point to your local CSV files, then click **Refresh**.

---

## 👤 Author

**Mukti Prabowo**
- GitHub: [@muktiprab](https://github.com/muktiprab)
- Kaggle: [muktiprabowo](https://www.kaggle.com/muktiprabowo)
- LinkedIn: [muktiprabowo](https://linkedin.com/in/muktiprabowo)
- Email: muktiprab65@gmail.com
