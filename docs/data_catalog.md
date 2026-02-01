# Gold Layer – Data Catalog

## Overview
The **Gold Layer** contains business-ready datasets used for **analytics, reporting, and dashboards**.  
These tables are curated from the Silver Layer and modeled using a **dimensional (star schema) approach**, making them easy to use for BI tools such as Power BI, Tableau, and SQL-based analysis.

---

## Dimension Tables

### gold.dim_customers

| Item | Details |
|-----|--------|
| **Table Type** | Dimension |
| **Grain** | One row per customer |
| **Business Purpose** | Used to analyze customers by demographics, geography, and lifecycle attributes |
| **Source** | Curated from Silver customer datasets |
| **Primary Key** | `customer_key` |

#### Columns

| Column Name | Data Type | Description |
|------------|----------|-------------|
| customer_key | INT | Surrogate key uniquely identifying a customer record in the Gold layer. |
| customer_id | INT | Unique customer identifier from the source system. |
| customer_number | NVARCHAR(50) | Business-facing customer reference used for tracking and reporting. |
| first_name | NVARCHAR(50) | Customer’s first name. |
| last_name | NVARCHAR(50) | Customer’s last name. |
| country | NVARCHAR(50) | Customer’s country of residence (e.g., Australia). |
| marital_status | NVARCHAR(50) | Marital status such as Married or Single. |
| gender | NVARCHAR(50) | Gender of the customer (Male, Female, n/a). |
| birthdate | DATE | Date of birth in `YYYY-MM-DD` format. |
| create_date | DATE | Date when the customer record was created in the source system. |

---

### gold.dim_products

| Item | Details |
|-----|--------|
| **Table Type** | Dimension |
| **Grain** | One row per product |
| **Business Purpose** | Enables product, category, and product-line level analysis |
| **Source** | Curated from Silver product datasets |
| **Primary Key** | `product_key` |

#### Columns

| Column Name | Data Type | Description |
|------------|----------|-------------|
| product_key | INT | Surrogate key uniquely identifying a product record. |
| product_id | INT | Internal product identifier from the source system. |
| product_number | NVARCHAR(50) | Business product code used for inventory and reporting. |
| product_name | NVARCHAR(50) | Descriptive product name including type, color, or size. |
| category_id | NVARCHAR(50) | Identifier representing the product category. |
| category | NVARCHAR(50) | High-level product category (e.g., Bikes, Components). |
| subcategory | NVARCHAR(50) | More detailed product classification within the category. |
| maintenance_required | NVARCHAR(50) | Indicates whether the product requires maintenance (Yes / No). |
| cost | INT | Base cost of the product. |
| product_line | NVARCHAR(50) | Product line or series (e.g., Road, Mountain). |
| start_date | DATE | Date when the product became available for sale. |

---

## Fact Tables

### gold.fact_sales

| Item | Details |
|-----|--------|
| **Table Type** | Fact |
| **Grain** | One row per product per sales order |
| **Business Purpose** | Supports revenue, quantity, and time-based sales analysis |
| **Source** | Curated from Silver sales transactions |
| **Primary Key** | (Composite) `order_number`, `product_key` |
| **Foreign Keys** | `customer_key`, `product_key` |

#### Columns

| Column Name | Data Type | Description |
|------------|----------|-------------|
| order_number | NVARCHAR(50) | Unique identifier for the sales order (e.g., SO54496). |
| product_key | INT | References the associated product in `gold.dim_products`. |
| customer_key | INT | References the associated customer in `gold.dim_customers`. |
| order_date | DATE | Date when the order was placed. |
| shipping_date | DATE | Date when the order was shipped to the customer. |
| due_date | DATE | Date when payment for the order is due. |
| sales_amount | INT | Total sales value for the order line. |
| quantity | INT | Number of product units sold. |
| price | INT | Price per unit at the time of sale. |

---

## Table Relationships

| From Table | Column | To Table | Column |
|----------|--------|----------|--------|
| gold.fact_sales | customer_key | gold.dim_customers | customer_key |
| gold.fact_sales | product_key | gold.dim_products | product_key |

---

## Notes & Assumptions
- All surrogate keys are generated in the Gold layer.
- Fact tables should only be joined to dimensions using surrogate keys.
- The Gold layer is optimized for **read-heavy analytical workloads**.
- Data is refreshed as per the upstream Silver layer schedule.
