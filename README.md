# 🧴 D2C Skincare E-Commerce — SQL Analytics Portfolio

![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Azure Data Studio](https://img.shields.io/badge/Azure%20Data%20Studio-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Kaggle](https://img.shields.io/badge/Kaggle-20BEFF?style=for-the-badge&logo=kaggle&logoColor=white)

## 📌 Project Overview

This project is a SQL-based analytics portfolio using a synthetic relational dataset from a Direct-to-Consumer (D2C) Skincare E-Commerce business. The goal is to extract actionable business insights across customer behavior, product performance, sales trends, and return analysis using structured SQL queries on Microsoft SQL Server.

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
└── README.md
```

---

## 🔍 Analysis Summary

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

## ⚙️ Setup & Usage

### Prerequisites
- Microsoft SQL Server Express
- Azure Data Studio

### Steps

1. Clone this repository
```bash
git clone https://github.com/muktiprab/sql-skincare-ecommerce-analysis.git
```

2. Open Azure Data Studio and connect to `localhost\SQLEXPRESS`

3. Run scripts in this order:
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

---

## 👤 Author

**Mukti Prabowo**
- GitHub: [@muktiprab](https://github.com/muktiprab)
- Kaggle: [muktiprabowo](https://www.kaggle.com/muktiprabowo)
- LinkedIn: [muktiprabowo](https://linkedin.com/in/muktiprabowo)
- Email: muktiprab65@gmail.com
