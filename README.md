# Fetch Data Analysis

## Part 1: Explore the Data

### Data Sources
- **Python Notebooks**: Contain code for exploratory analysis and insights related to data quality.
- **Data Updated Folder**: Contains the updated data files derived from the exploratory analysis.
  - These updated data files were used for SQL analysis.
  - A Google Drive link is provided for all data files (since some files exceed 25 MB).
  - https://drive.google.com/drive/folders/1MEsUfiR6bjYP6AsdArocmbE_S87zv7RO?usp=sharing

## Part 2: SQL Analysis

### SQL Files and Queries
- **`Top_5_Brands_By_Receipt.sql`**: Identifies the top 5 brands by receipts scanned among users aged 21 and over.
- **`Top_5_Brands_By_Sale.sql`**: Determines the top 5 brands by sales among users who have had an account for at least six months.
- **`YoY_Growth.sql`**: Calculates the year-over-year growth percentage of Fetch.
- Output folder has the csv file for all the above SQL queries.

## Part 3: Communicate with Stakeholders

### Documentation
- Insights and findings are documented in `Communicate with Stakeholders.pdf`.

### High-Priority Data Issues & Solutions

1. **User Mapping in Transaction Data**
   - **Issue**: Only ~0.5% of users in the transaction data were mapped to the user data.
   - **Impact**: Limits insights related to users (age, joining date, demographics).
   - **Solution Needed**: Improved mapping of user data to generate useful user-level insights.

2. **Transaction Data with Missing Barcodes**
   - **Issue**: ~10% of transactions lack a barcode.
   - **Impact**: Limits product-level insights.
   - **Solution Needed**: Improved barcode mapping.

3. **Barcode Format Issues**
   - **Issue**: Barcodes in transaction and product data are stored as integers of varying lengths.
   - **Impact**: Any barcode with leading zeros may get dropped when transferring to/from a CSV file.
   - **Solution**: Converted barcodes to strings and ensured a fixed length of 14 characters.

4. **Missing Brand and Manufacturer Information**
   - **Issue**: ~26% of products lack brand and manufacturer details.
   - **Impact**: Affects product categorization and brand insights.
   - **Solution Needed**: Acquire missing brand and manufacturer information.

5. **Duplicate Records in Transaction Data**
   - **Issue**: Some records where the combination of Receipt ID and Barcode appears more than once.
     - Missing final sale data.
     - Final volume is zero.
   - **Solution**: Removed duplicate rows.

---
