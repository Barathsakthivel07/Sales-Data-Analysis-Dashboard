# Sales Data Analysis and Dashboard | SQL, Excel, Power BI

## Overview
Portfolio-ready exploratory analysis of **600 fictional retail orders in India** dated January–December 2025. Covers regional trends, categories, product profitability, sales channels and monthly performance. All values are synthetic and denominated in INR.

## Tech stack
- **PostgreSQL**: table creation, SQL aggregation and profitability analysis
- **Microsoft Excel**: formula-driven KPIs, structured data table and summary charts
- **Power BI Desktop**: DAX measures, interactive visuals, category and region slicers (build with included guide)

## Project files
- `sales_data.csv`: source dataset
- `sales_analysis.sql`: schema, import guidance and 8 business queries
- `Sales_Excel_Dashboard.xlsx`: Excel dashboard, underlying data and documentation
- `powerbi_guide.md`: step-by-step Power BI build instructions and DAX formulas

## Dataset fields
`order_id, order_date, region, category, product, channel, quantity, unit_price, discount_pct, sales, profit`

`Sales = Quantity × Unit Price × (1 − Discount %)`

`Profit = Sales − Quantity × Assumed Unit Cost`

Costs vary by product and are baked into the synthetic generated data. This is an illustrative operating profit proxy and excludes shipping, salaries, taxes and overhead.

## Summary KPIs (generated dataset)
- Total revenue: **₹10,527,536.26**
- Total profit: **₹2,263,886.26**
- Number of orders: **600**
- Profit margin: **21.46%**
- Leading category by revenue: **Furniture**

## How to run
1. Open `Sales_Excel_Dashboard.xlsx` in Microsoft Excel; explore the Dashboard and Sales Data sheets.
2. In PostgreSQL, execute the `CREATE TABLE` statement from `sales_analysis.sql`.
3. Use pgAdmin's **Import/Export Data** to import `sales_data.csv` into the `sales` table (CSV, header on).
4. Run the eight analysis queries in `sales_analysis.sql`.
5. In Power BI Desktop, follow `powerbi_guide.md` to build and save `Sales_Performance_Dashboard.pbix`.
6. Add a dashboard screenshot to this repository when finished.

## Example business questions
- Which region contributes the most revenue?
- Which category generates the most revenue and profit?
- How does revenue vary month to month?
- Which products and channels perform best?
- How does discount level relate to profit?

## Resume bullets
- Analyzed 600 synthetic retail transactions using PostgreSQL to identify sales trends, category performance and regional revenue distribution.
- Built an Excel sales performance dashboard with formula-driven KPIs and comparative visualizations, and designed a Power BI reporting layout with DAX measures and interactive filters.

## Note
This dataset is intentionally synthetic. Insights are demonstrations of analytical technique rather than claims about a real retail business.
