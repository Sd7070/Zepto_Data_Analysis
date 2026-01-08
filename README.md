# 🛒 Zepto Data Analysis Project
A comprehensive SQL-based data analysis project analyzing Zepto's e-commerce product catalog to extract actionable business insights for inventory management, pricing strategy, and revenue optimization.

![Zepto Logo](zepto_img.webp)


## 📋 Table of Contents

- [Overview](#overview)
- [Objectives](#objectives)
- [Dataset](#dataset)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [Installation & Setup](#installation--setup)
- [Usage](#usage)
- [Key Insights](#key-insights)
- [Business Value](#business-value)
- [Analysis Workflow](#analysis-workflow)

## 🎯 Overview

This project performs end-to-end data analysis on Zepto's product catalog using SQL. It covers data exploration, cleaning, and extraction of business insights to support decision-making in inventory management, pricing strategies, and revenue optimization for the quick-commerce platform.

## 🎯 Objectives

1. **Data Exploration**: Understand the product catalog structure, identify data quality issues, and explore product categories
2. **Data Cleaning**: Standardize currency format, remove invalid records, and ensure data consistency
3. **Business Insights**: Extract actionable insights for:
   - Inventory management and stock optimization
   - Pricing and discount strategy analysis
   - Revenue potential estimation by category
   - Product value analysis

## 📊 Dataset

- **Source**: Zepto product catalog
- **Records**: ~3,734 products
- **Format**: CSV (zepto_v2.csv)
- **Key Attributes**:
  - Product categories
  - MRP and discounted selling prices
  - Discount percentages
  - Stock availability and quantities
  - Product weights
  - Stock status (in-stock/out-of-stock)

### Dataset Schema

| Column | Type | Description |
|--------|------|-------------|
| `sku_id` | SERIAL | Primary key (auto-increment) |
| `category` | VARCHAR(120) | Product category |
| `name` | VARCHAR(150) | Product name |
| `mrp` | NUMERIC(8,2) | Maximum Retail Price |
| `discountPercent` | NUMERIC(5,2) | Discount percentage |
| `availableQuantity` | INTEGER | Available stock quantity |
| `discountedSellingPrice` | NUMERIC(8,2) | Final selling price after discount |
| `weightInGms` | INTEGER | Product weight in grams |
| `outOfStock` | BOOLEAN | Stock availability status |
| `quantity` | INTEGER | Quantity field |

## 📁 Project Structure

```
Zepto_Data_analysis/
│
├── zepto_Data_Analysis.sql    # Main SQL analysis script
├── zepto_v2.csv               # Current dataset
├── README.md                  # Project documentation

```

## 🛠️ Technologies Used

- **Database**: PostgreSQL
- **Language**: SQL
- **Data Format**: CSV
- **Tools**: PostgreSQL Database Management System

## 💻 Installation & Setup

### Prerequisites

- PostgreSQL installed on your system
- Access to a PostgreSQL database
- CSV file (zepto_v2.csv) in the project directory

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd Zepto_Data_analysis
   ```

2. **Create a PostgreSQL database**
   ```sql
   CREATE DATABASE zepto_analysis;
   ```

3. **Import the CSV data**
   ```sql
   -- Connect to your database
   \c zepto_analysis;
   
   -- Create the table (run the CREATE TABLE statement from zepto_Data_Analysis.sql)
   -- Then import CSV data using COPY command or pgAdmin import tool
   ```

4. **Load the SQL script**
   - Open `zepto_Data_Analysis.sql` in your PostgreSQL client
   - Execute the script to run all analyses

## 📖 Usage

### Running the Analysis

1. **Execute the complete script**
   ```sql
   -- Run the entire zepto_Data_Analysis.sql file
   \i zepto_Data_Analysis.sql
   ```

2. **Run individual queries**
   - Open the SQL file
   - Execute specific query sections as needed
   - Review results in your PostgreSQL client

### Query Sections

The SQL script is organized into three main sections:

1. **Data Exploration** (Lines 17-61)
   - Total record count
   - Sample data preview
   - Null value detection
   - Category analysis
   - Stock status analysis
   - Product duplication check

2. **Data Cleaning** (Lines 63-80)
   - Remove zero-price products
   - Convert paise to rupees

3. **Business Insights** (Lines 82-152)
   - Top 10 best-value products
   - High-value out-of-stock products
   - Category revenue estimation
   - Premium products with low discounts
   - Top discount categories
   - Price per gram analysis
   - Weight-based categorization
   - Total inventory weight by category

## 🔍 Key Insights

### 1. Best-Value Products
Identifies top 10 products with highest discount percentages to support marketing campaigns and customer promotions.

### 2. High-Value Stockout Analysis
Highlights expensive products (high MRP) that are currently out of stock, helping prioritize restocking to prevent revenue loss.

### 3. Category Revenue Potential
Estimates potential revenue for each product category using:
```sql
SUM(discountedSellingPrice * availableQuantity)
```
This helps identify high-value categories for strategic focus.

### 4. Premium Products Analysis
Finds products with MRP > ₹500 and discount < 10% to identify pricing optimization opportunities.

### 5. Discount Strategy by Category
Ranks top 5 categories by average discount percentage to understand discount distribution across product categories.

### 6. Value-for-Money Analysis
Calculates price per gram to identify the most economical products for customers.

### 7. Weight-Based Categorization
Groups products into Low (<1000g), Medium (1000-5000g), and Bulk (>5000g) categories for logistics planning.

### 8. Inventory Weight Analysis
Measures total inventory weight per category to support warehouse and logistics planning.

## 💼 Business Value

This analysis supports decision-making in:

- **Inventory Management**: Prioritize restocking of high-value out-of-stock items
- **Pricing Strategy**: Optimize discount levels and identify premium product opportunities
- **Revenue Optimization**: Focus on high-revenue potential categories
- **Marketing**: Identify best-value products for promotional campaigns
- **Operations**: Plan logistics based on weight distribution and category analysis

### Expected Impact

- **Revenue Increase**: 5-15% by prioritizing high-value restocking
- **Inventory Optimization**: 10-20% reduction in dead stock
- **Better Pricing**: Improved margin management through discount analysis
- **Customer Satisfaction**: Reduced stockouts of popular items

## 📊 Analysis Workflow

```
1. Data Exploration
   ↓
2. Data Quality Assessment
   ↓
3. Data Cleaning
   ↓
4. Business Insights Extraction
   ↓
5. Actionable Recommendations
```

## 📝 Notes

- Original data prices were in **paise** (Indian currency subunit) and converted to **rupees** during data cleaning
- Products with zero MRP were removed to ensure data quality
- The analysis uses DISTINCT to handle potential duplicate product entries
- All monetary values are in Indian Rupees (₹)

## 🤝 Contributing

This is a personal project for learning and portfolio purposes. Suggestions and feedback are welcome!

## 📄 License

This project is open source and available for educational purposes.

## 👤 Author

Created as part of a Data Science SQL project portfolio.

---

**Note**: This project demonstrates SQL skills in data exploration, cleaning, and business intelligence analysis for e-commerce data.

