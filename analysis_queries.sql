-- ============================================================
-- E-Commerce Data Analysis using SQL
-- Dataset: Olist Brazilian E-Commerce Public Dataset
-- Tool: MySQL Workbench
-- ============================================================


-- 1. Top 10 product categories by revenue
-- Joins order_items with products to find which categories generate the most revenue.
SELECT
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 10;


-- 2. Revenue by customer state
-- Shows which states contribute the most revenue, useful for regional performance analysis.
SELECT
    c.customer_state,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


-- 3. Top 10 customers by total amount spent
-- Identifies the highest-value customers across all their orders.
SELECT
    c.customer_id,
    ROUND(SUM(p.payment_value), 2) AS total_spent
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- 4. Top 10 sellers by total sales
-- Ranks sellers by total revenue generated from item sales.
SELECT
    seller_id,
    ROUND(SUM(price), 2) AS total_sales
FROM order_items
GROUP BY seller_id
ORDER BY total_sales DESC
LIMIT 10;


-- 5. Monthly revenue trend
-- Breaks down total revenue by year and month to visualize growth/seasonality over time.
SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
INNER JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY
    YEAR(o.order_purchase_timestamp),
    MONTH(o.order_purchase_timestamp)
ORDER BY year, month;


-- 6. Payment type distribution
-- Counts how many payments were made using each payment method.
SELECT
    payment_type,
    COUNT(*) AS total_payments
FROM order_payments
GROUP BY payment_type
ORDER BY total_payments DESC;


-- 7. Order status distribution
-- Shows the breakdown of orders by their current status (delivered, shipped, canceled, etc.).
SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;


-- 8. Average order value
-- Calculates the average payment value across all orders.
SELECT
    ROUND(AVG(payment_value), 2) AS average_order_value
FROM order_payments;
