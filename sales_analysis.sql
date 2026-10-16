-- PostgreSQL | Retail sales analysis | Fictional 2025 dataset
-- Step 1: Run this CREATE TABLE statement in pgAdmin Query Tool.
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
  order_id VARCHAR(12) PRIMARY KEY,
  order_date DATE NOT NULL,
  region VARCHAR(20) NOT NULL,
  category VARCHAR(40) NOT NULL,
  product VARCHAR(50) NOT NULL,
  channel VARCHAR(20) NOT NULL,
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC(12,2) NOT NULL,
  discount_pct NUMERIC(5,2) NOT NULL,
  sales NUMERIC(14,2) NOT NULL,
  profit NUMERIC(14,2) NOT NULL
);
-- Step 2: pgAdmin > right-click 'sales' > Import/Export Data > Import.
-- Select sales_data.csv; Format CSV; Header Yes; delimiter comma; Encoding UTF8.
-- Alternatively in psql, run (edit path to your local file):
-- \copy sales FROM 'C:/path/to/sales_data.csv' WITH (FORMAT csv, HEADER true)

-- 1. KPI overview
SELECT COUNT(*) AS total_orders, SUM(quantity) AS units_sold,
  ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit,
  ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0),2) AS profit_margin_pct
FROM sales;

-- 2. Revenue and profit by month
SELECT TO_CHAR(DATE_TRUNC('month',order_date),'YYYY-MM') AS month,
  COUNT(*) AS orders, ROUND(SUM(sales),2) AS revenue,
  ROUND(SUM(profit),2) AS profit
FROM sales GROUP BY DATE_TRUNC('month',order_date)
ORDER BY DATE_TRUNC('month',order_date);

-- 3. Region performance
SELECT region, COUNT(*) AS orders, ROUND(SUM(sales),2) AS revenue,
  ROUND(SUM(profit),2) AS profit,
  ROUND(100.0 * SUM(profit)/NULLIF(SUM(sales),0),2) AS profit_margin_pct
FROM sales GROUP BY region ORDER BY revenue DESC;

-- 4. Product-category performance
SELECT category, ROUND(SUM(sales),2) AS revenue,
  ROUND(SUM(profit),2) AS profit, SUM(quantity) AS units_sold
FROM sales GROUP BY category ORDER BY revenue DESC;

-- 5. Top five products by revenue
SELECT product, category, ROUND(SUM(sales),2) AS revenue,
  ROUND(SUM(profit),2) AS profit
FROM sales GROUP BY product,category ORDER BY revenue DESC LIMIT 5;

-- 6. Sales channel performance
SELECT channel, COUNT(*) AS orders, ROUND(SUM(sales),2) AS revenue,
 ROUND(SUM(profit),2) AS profit
FROM sales GROUP BY channel ORDER BY revenue DESC;

-- 7. Highest performing month
SELECT DATE_TRUNC('month', order_date)::DATE AS month,
 ROUND(SUM(sales),2) AS revenue
FROM sales GROUP BY 1 ORDER BY revenue DESC LIMIT 1;

-- 8. Discount impact
SELECT discount_pct, COUNT(*) AS orders,
 ROUND(SUM(sales),2) AS revenue, ROUND(SUM(profit),2) AS profit
FROM sales GROUP BY discount_pct ORDER BY discount_pct;
