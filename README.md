# 🍔 Food Delivery Analysis

End-to-end data analysis project on a food delivery dataset — covering raw data cleaning, SQL business analysis, Python EDA, and a 3-page interactive Power BI dashboard.

---
https://app.powerbi.com/Redirect?action=openreport&context=Annotate&ctid=ef51de3c-3b7d-4e60-a91b-e607598f3278&pbi_source=mobile_android&groupObjectId=5fce47b5-fbea-4a9e-81c4-e71319fd5d85&reportObjectId=17fd01c7-e57e-4181-851a-19a1607ebc21&reportPage=d6290fbd43820473b84c&bookmarkGuid=cb73baa2-205e-45a8-a8b1-a20443b38a97&fullScreen=0<img width="1366" height="768" alt="Screenshot (118)" src="https://github.com/user-attachments/assets/cae0e3c5-49dd-441c-bc09-a3c9841cb71b" />
<img width="1366" height="768" alt="Screenshot (118)" src="https://github.com/user-attachments/assets/5e8509fc-f62a-4aca-9063-df4272bffd1c" />


## 📁 Repository Structure

| File | Description |
|------|-------------|
| `DIRTY_04_food_delivery.csv` | Raw dataset with nulls, mixed formats, duplicates |
| `Food Delivery Cleaned 02.csv` | Cleaned dataset after Power Query + Python processing |
| `FOOD_ANALYSIS.sql` | 7 business SQL queries (PostgreSQL) |
| `food_delivery.ipynb` | Python cleaning + EDA notebook |
| `README.md` | Project documentation |

---

## 🛠️ Tools Used

- **Microsoft Excel / Power Query** — Initial data cleaning
- **Python** (pandas, NumPy, Matplotlib) — Data cleaning & EDA
- **PostgreSQL** — Business analysis via SQL
- **Power BI** — Interactive 3-page dashboard

---

## 🧹 Step 1 — Data Cleaning (Power Query)

- Converted text columns to Title Case (proper capitalization)
- Trimmed extra whitespace from all columns
- Removed unnecessary/irrelevant columns
- Exported cleaned file as `Food Delivery Cleaned 02.csv`

---

## 🐍 Step 2 — Python Cleaning & EDA (Pandas / NumPy)

**Cleaning steps:**
- Loaded cleaned CSV, dropped duplicates
- Standardized column names: stripped whitespace, lowercased, replaced spaces with `_`
- Renamed `delivery_partner_id` → `delivery_boy_id`
- Applied `.str.title()` to: `restaurant_name`, `cuisine_type`, `peak_hour`, `order_status`, `city`
- Converted `order_date` to datetime (`format='mixed'`, `dayfirst=True`)
- Converted `time` column to time format using `'%H:%M'`
- Found nulls in: `distance_km` (365), `discount_applied_inr` (363), `rating` (363)
- Filled all three with **median** values
- Loaded final data into PostgreSQL using SQLAlchemy

---

## 🗄️ Step 3 — SQL Analysis (PostgreSQL)

7 business questions answered in `FOOD_ANALYSIS.sql`:

| # | Question |
|---|----------|
| 1 | Which restaurants have the highest average delivery time? |
| 2 | Which cuisine type generates the highest total order value? |
| 3 | Which delivery partners handle the most orders but still exceed average delivery time? |
| 4 | At which time slots do orders peak, and how does delivery time vary? |
| 5 | Are high-discount orders generating higher or lower order values? |
| 6 | Rank delivery partners by total orders within each cuisine type (Window Function) |
| 7 | Find customers who placed orders in every month with no gap in activity |

## 📊 Step 4 — Power BI Dashboard (3 Pages)

### Page 1 — Food Delivery Overview
- KPI Cards: Total Revenue (2M), Total Orders (4028), Avg Order Value (573.31), Avg Delivery Time (37.53 min)
- Bar chart: Total Orders by Cuisine Type
- Bar chart: Total Orders by City
- Line chart: Total Revenue by Month (2023–2024)
- Year slicer for interactive filtering

### Page 2 — Delivery Performance
- Bar chart: Total Orders by Order Status (Delivered / Cancelled / Out For Delivery)
- Bar chart: Avg Delivery Time by City
- Bar chart: Total Orders by Peak Hour
- Line chart: Delivery Time vs Distance (km)

### Page 3 — Customer & Restaurant Insights
- Bar chart: Top 10 Restaurants by Total Revenue
- Bar chart: Total Revenue by City
- Bar chart: Avg Rating by Cuisine Type

---

## 💡 Key Insights

- **Delhi and Bengaluru** are the top revenue-generating cities
- **North Indian and Biryani** are the most ordered cuisine types
- Revenue peaked in **January–March** and dropped sharply from July onward
- Most orders are successfully **Delivered**; cancellation rate is low
- High-discount orders do not consistently generate higher total order values
- Average delivery time is consistent across cities (~35–40 mins)

---

## 👤 Author

**Manoj Kumar**  
Data Analyst 
📍 New Delhi, India  
