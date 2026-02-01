# SQL Data Warehouse Project

## 📌 Project Overview
This project was created to gain **hands-on experience in designing and building a Data Warehouse** by following a structured **ETL (Extract, Transform, Load)** process and implementing a **layered architecture**.

Although my primary background is in **Data Analysis**, I wanted to deepen my technical understanding of how analytical data models are built, maintained, and consumed by analysts and business users. This project helped bridge the gap between business requirements and technical implementation.

---

## 🎯 Project Objectives
- Understand end-to-end **Data Warehouse development**
- Implement a structured **ETL pipeline**
- Design a data model that supports **analytical reporting**
- Create reusable SQL scripts for data transformation

---

## 🔹 Project Specifications

**Data Sources:**  
- Two source systems: **ERP** and **CRM**, provided as CSV files.

**Data Quality:**  
- Cleaned and resolved data quality issues before analysis.

**Integration:**  
- Combined both sources into a **single, user-friendly data model** optimized for analytical queries.

**Scope:**  
- Focused on the **latest dataset only**; historization of data is not included.

**Documentation:**  
- Clear documentation of the **data model** to support both business stakeholders and analytics teams.

---

## 🏗️ Architecture Overview

### 🔹 Bronze Layer
- Raw data ingestion
- Minimal transformations
- Source-aligned structure

### 🔹 Silver Layer
- Data cleansing and standardization
- Business logic applied
- Prepared for analytics consumption

### 🔹 Gold Layer
- Business-friendly views
- Dimensional model (facts & dimensions)
- Optimized for reporting and analysis

---

## 📁 Repository Structure

```text
SQL_Data_WareHouse_Project/
│
├── datasets/               # Source datasets (ERP & CRM CSVs)
│
├── docs/                   # Project documentation
│   ├── data_model/         # Data model details
│   ├── diagrams/           # Architecture & flow diagrams
│   └── notes/              # Additional project notes
│
├── scripts/                # SQL scripts for ETL / transformations
│   ├── bronze/             # Load raw source data
│   ├── silver/             # Data cleansing & transformations
│   └── gold/               # Dimensional models / analytics-ready views
│
├── tests/                  # Data quality & validation SQL scripts
│
├── LICENSE                 # MIT License
└── README.md               # Project overview & documentation
```
---

## 🛠️ Tools & Technologies Used
- **SQL Server**
- **SSMS (SQL Server Management Studio)**
- **Git & GitHub**
- **CSV source datasets**

---

## 📈 Key Learnings
Through this project, I gained hands-on experience in:
- Designing a **Data Warehouse schema**
- Writing **ETL SQL scripts**
- Applying **data modeling concepts**
- Implementing layered transformations
- Structuring projects for **real-world analytics use cases**

---

## 🙌 Credits
This project was built as a learning initiative, and credit goes to **DataWithBaraa** for the guidance and learning resources that inspired and supported this implementation.

---

## 🚀 Future Enhancements
- Extend Gold layer with more analytical views
- Connect to BI tools (Power BI / Tableau)

---

## 📬 About Me
Hi! I'm **Pavan Kumar**, a passionate **Business Intelligence Analyst** at **Société Générale** experienced in data analysis and business intelligence.  

I have a strong interest in turning data into actionable insights and building interactive dashboards that help drive informed business decisions. My expertise lies in **Power BI**, **SQL**, and data visualization, and I'm always eager to explore new technologies in the data space.  

## Skills & Tools
- **Data Analysis & Visualization:** Power BI, Tableau, Excel
- **Databases & Querying:** SQL, MySQL
- **Business Intelligence:** Dashboard creation, KPI reporting, data storytelling

## Interests
- Data Analytics & Visualization  
- Business Intelligence Solutions  
- Learning new data tools and technologies  

Feel free to connect with me on **LinkedIn:** [www.linkedin.com/in/pavan-kumar-69a246172](https://www.linkedin.com/in/pavan-kumar-69a246172) or check out my projects here on GitHub!


