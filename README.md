# Supply Chain Performance Analytics — Brazilian E-Commerce (Olist)

## Project Overview
End-to-end supply chain analytics pipeline built with dbt and BigQuery, 
visualized in Power BI. Uses the Olist Brazilian E-Commerce dataset to 
track key supply chain KPIs.

## Tech Stack
- **Data Warehouse:** BigQuery
- **Transformation:** dbt Cloud
- **Visualization:** Power BI
- **Source Data:** Olist Brazilian E-Commerce (Kaggle)

## KPIs
1. **On-Time Delivery Rate** — % of orders delivered on or before estimated date, by month and seller
2. **Order Cycle Time** — Days from purchase to delivery, by product category and month
3. **Seller Performance** — Orders, on-time rate, cycle time, and revenue per seller

## Data Model
- **Staging:** 6 models cleaning raw Olist tables
- **Dimensions:** dim_customers, dim_sellers, dim_products, dim_date
- **Facts:** fct_orders, fct_order_items
- **Metrics:** mart_on_time_delivery, mart_order_cycle_time, mart_seller_performance