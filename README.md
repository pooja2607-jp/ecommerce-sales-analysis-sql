# E-Commerce Data Analysis using SQL

Analysis of the **Olist Brazilian E-Commerce Public Dataset** using SQL, exploring revenue trends, customer behavior, seller performance, and payment patterns across ~100,000 orders.

## Overview

This project uses SQL (MySQL) to answer real business questions a company might ask about its e-commerce operations — which product categories drive the most revenue, who the top customers and sellers are, how sales trend over time, and how customers prefer to pay.

## Dataset

The [Olist dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) contains real, anonymized order data from a Brazilian e-commerce marketplace between 2016–2018, split across multiple relational tables:

| Table | Description |
|---|---|
| `orders` | Order status and timestamps |
| `order_items` | Items within each order, price, and seller |
| `order_payments` | Payment type, installments, and value |
| `order_reviews` | Customer review scores and comments |
| `customers` | Customer location data |
| `products` | Product category and dimensions |
| `sellers` | Seller location data |
| `geolocation` | Zip code to lat/long mapping |
| `product_category_name_translation` | Category names translated to English |

## Questions Answered

1. Which product categories generate the most revenue?
2. Which customer states contribute the most revenue?
3. Who are the top 10 customers by total spend?
4. Who are the top 10 sellers by total sales?
5. What does the monthly revenue trend look like?
6. How do customers prefer to pay (payment type distribution)?
7. What's the breakdown of order statuses (delivered, shipped, canceled, etc.)?
8. What is the average order value?

All queries are in [`queries/analysis_queries.sql`](queries/analysis_queries.sql).

## Key Findings

- **Delivered orders dominate**, making up the vast majority of all orders, with cancellations and unavailable orders forming a small fraction.
- **Credit card is the clear preferred payment method**, used far more often than boleto, voucher, or debit card.
- Revenue is concentrated in a handful of **top-performing product categories and states**, following a typical Pareto-style distribution.
- A small number of **top sellers and top customers** account for a disproportionate share of total sales/spend.
- Monthly revenue shows a clear **growth trend** across the dataset's time period.

## Tools Used

- **MySQL Workbench** — writing and executing SQL queries
- SQL concepts applied: `JOIN`s, `GROUP BY`, aggregate functions (`SUM`, `AVG`, `COUNT`), `ORDER BY`/`LIMIT` for ranking, and date functions (`YEAR`, `MONTH`) for time-series analysis

## What I Learned

This project helped me practice writing multi-table JOINs to combine data spread across a normalized schema, using aggregate functions to answer business questions, and structuring queries to produce clean, ranked, decision-ready output rather than just raw data dumps.

## Author

J Pooja Akshitha / https://www.linkedin.com/in/pooja-akshitha-jallepalli/
