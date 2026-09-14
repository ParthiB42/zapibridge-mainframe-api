<img width="1435" height="1096" alt="ZapiBridge_Flow" src="https://github.com/user-attachments/assets/88d7b544-face-4dcb-8b25-8cc8413daf18" /># 🛍️ ZapiBridge | Mainframe Modernization Platform
<p align="center">
  <img src="<img width="1435" height="1096" alt="ZapiBridge_Flow" src="https://github.com/user-attachments/assets/136acd09-1d19-4922-8a60-834dcf73d48a" />" width="100%">
</p>

## 📌 Executive Summary 

ZapiBridge modernizes an existing Mainframe application by exposing COBOL/CICS business logic and Db2 data as REST APIs using IBM z/OS Connect EE. The project demonstrates how modern web applications can interact with reliable Mainframe systems through REST/JSON interfaces while preserving the underlying COBOL business logic.

- 🎯 **Business Problem:** Mainframe applications contain critical business logic, but modern applications require REST/JSON interfaces. Integrating directly with CICS/COBOL applications can be complex, and rewriting established Mainframe systems can be costly and risky.

- 🛠️ **Approach:** Developed `EMPPOR01` using COBOL, CICS, and Db2; exposed the program through IBM z/OS Connect EE; and integrated the resulting APIs with a modern employee portal for profile retrieval and updates.

- 📊 **Business Impact:** Enabled modern REST-based access to Mainframe employee data, demonstrated a practical API-led modernization approach, preserved existing business logic, and created a reusable foundation for additional Mainframe APIs.

---

# 🎯 Business Problem

Retail businesses generate thousands of transactions every day, making it difficult to identify which products truly drive profitability, where revenue leakage occurs, and how customer purchasing behavior influences business growth. Without a structured analytical framework, business decisions related to pricing, inventory, promotions, and customer retention often rely on assumptions instead of data.

This project transforms raw retail transaction data into business-ready insights, enabling stakeholders to monitor financial performance, optimize product strategy, improve customer retention, and identify operational improvement opportunities.

---

# 🏗️ Methodology

- 📥 Extracted and analyzed retail transaction data using advanced SQL.
- 🗄️ Built reusable SQL views to simplify executive and operational reporting.
- 📊 Designed business KPIs for Revenue, Profit, Gross Margin, Orders, and Average Order Value (AOV).
- 🛍️ Performed product category, department, customer, and return rate analysis.
- 📈 Conducted trend analysis to evaluate business performance over time.
- 🧩 Organized SQL scripts into modular analytical layers for better scalability and maintainability.

---

# 🛠️ Skills

### 💾 SQL
- Joins
- Common Table Expressions (CTEs)
- Window Functions
- Aggregate Functions
- CASE Statements
- Date Functions
- Views
- Subqueries
- Business KPI Calculations
  
### 📊 BI & Reporting
- SQL-based Business Reporting
- KPI Design
- Business View Modeling

### 📚 Analytics Concepts
- Executive KPI Reporting
- Revenue Analysis
- Profitability Analysis
- Product Performance Analysis
- Customer Analytics
- Repeat Purchase Analysis
- Return Rate Analysis
- Trend Analysis
- Retail Performance Measurement

---

# 📊 Results & Business Recommendations

The analysis converted raw retail transaction data into actionable business insights across executive, product, and customer dimensions. The findings highlight profitability drivers, customer purchasing patterns, and operational risks that support strategic decision-making.

## 🔍 Key Insights

- 💰 Processed **31,028 completed orders**, generating **$2.68M revenue** and **$1.39M gross profit** with a **51.85% gross margin** and an **Average Order Value (AOV) of $86.24**.
- 📈 Business growth was primarily driven by increasing **order volume**, while **Average Order Value remained stable** between **$80-$90**, indicating opportunities to increase basket size.
- 🛍️ **Jeans** generated the highest revenue, while **Blazers & Jackets** delivered the highest gross margin (**62.11%**), showing that the best-selling category isn't always the most profitable.
- 🏬 The **Men's department** generated higher overall revenue, whereas the **Women's department** achieved a slightly higher gross margin, indicating stronger profitability.
- 👥 Customer retention remains an opportunity, with a **12.17% Repeat Purchase Rate**, suggesting room for loyalty initiatives.
- 🔄 **Plus** products recorded the highest return rate (**31.85%**), highlighting potential issues related to sizing, product quality, or customer expectations.
- ✅ Only **one loss-making product** was identified, indicating effective overall pricing and inventory management.

## 💡 Business Recommendations

- 🎯 Prioritize marketing investment toward **high-margin categories** while reviewing pricing strategies for low-margin products.
- 🛒 Increase **Average Order Value (AOV)** through cross-selling, product bundles, and personalized promotions instead of relying only on higher order volumes.
- ❤️ Launch customer loyalty and retention programs to improve the **12.17% Repeat Purchase Rate** and increase Customer Lifetime Value.
- 📦 Investigate high-return categories by improving product descriptions, sizing guides, and quality control to reduce return-related costs.
- 📈 Optimize inventory allocation by balancing **both revenue and profitability**, ensuring resources are invested in the most valuable product categories.

---

# 🚀 Next Steps

- 📊 Build an interactive **Power BI Executive Dashboard** for real-time business monitoring.
- 📈 Develop a **Sales Forecasting** model to improve demand planning and inventory optimization.
- 👥 Perform customer segmentation to identify high-value customer groups.
- 🤖 Build predictive models to estimate product return probability.
- 📦 Extend the project with inventory optimization and demand planning analytics.
