# Bicycle Store ETL (Mini Project)

Credit:
[Data Source](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database?select=brands.csv)

# Introduction

### Project Summary

This project demonstrates how to effectively collect, transform, and store data in an efficient manner, using Azure's suite of cloud tools. These tools include Azure Data Factory and Databricks to create an efficient and easy to maintain pipeline.

![Blank diagram](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/5e165ff6-d06a-4a76-935b-82eb50f2b642)

### Project Importance
- **Centralised Data Storage:** By setting up a relational database, businesses can ensure that their data is stored in a centralised and structured manner. This makes it easier to access, manage, and update data as needed as well as querying for enhanced business decision making.
- **Efficient Data Ingestion:** Using tools like Azure Data Factory simplifies the data ingestion process, allowing businesses to quickly pull in new data from various sources and keep their databases up-to-date.
- **Scalability:** Cloud platforms like Azure offer scalable database solutions. As the company grows and its data needs increase, the database can be scaled up without significant changes to the existing infrastructure.
- **Automation:** The entire end to end process is automated to update the database with the latest data.

# Methodology

### Step 1. Database Schema and Creation

First, we planned our desired database schema using DBDiagram. This involved defining tables, specifying columns, setting data types, and defining the relationships between tables.

![schema_final](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/8bb6029d-fb63-4881-8558-db0f0ca59f00)

Subsequently, we created our database using Azure SQL Database. With Azure Data Studio, we remotely accessed the database from a local machine and executed an SQL notebook to apply the schema. This process involved creating tables and setting up relationships. With this step completed, the database was ready to store the data.

### Step 2. Data Ingestion with Azure Data Factory

An Azure Blob Storage container was created to store both the raw and transformed datasets. Azure Blob Storage is a type of object storage solution and allows the storage of semi and unstructured data. It's highly scalable in storage size and offers a cheap way to store large amounts of data. 

We leveraged Azure Data Factory to retrieve data directly from GitHub using a provided raw file link, then storing the CSV file within the storage container. Each step of this particular pipeline copies the data from a table and immediately stores the information before moving onto the next table. Each task is linked and relies of the success of it's previous task to continue.

![image](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/703b19a4-78a9-448a-9916-4ea4dfbecb8d)

### Step 3. Data Transformation

For data transformation, we utilised Azure DataBricks. Creating a Python-based notebook, we imported data from our storage container, executed necessary transformations to ensure compatibility with our database schema (like data type conversions), and saved the refined data back to the storage container in a separate directory (folder). The Python notebook has been included within the repository files. It essentially authenticates a connection and mounts to the storage container. From there any stored files can be accessed within the notebook. The data is investigated to ensure there are no errors and finally the data types are converted to conform with the relational database schema. This transformed data is stored back into the storage container under a new directory.

### Step 4. Inserting Data into the Relational Database

Using Azure Data Factory again, our task was to map our data source (the storage container) to our database and initiate the data transfer. It's important to ensure that the sequence of data transfer respects the database's constraints, notably primary and foreign key associations. For an example, we cannot insert data into a table that contains a foreign key which links to an empty table. The appropraite order for data insertion is illustrated below.

![image](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/28fc04ca-f764-4a90-845a-d51c981bb13f)

### Step 5. Results

The final result is a cloud based relational database ready to be querried by the business for business intelligence or any other form of analysis. Using any preferred method to access the database (in this case remotely from a local PC) an example of an SQL query is shown below for the stored data:

Analyse the sales performance of different product categories.

```SQL
SELECT cat.category_name, SUM(oi.quantity * oi.list_price) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name;
```
Results...

```
+-------------------+-------------+
| category_name     | total_sales |
+-------------------+-------------+
| Children Bicycles | 45000.00    |
| Comfort Bicycles  | 35000.00    |
| Mountain Bicycles | 75000.00    |
| Road Bicycles     | 60000.00    |
| Electric Bicycles | 50000.00    |
| Hybrid Bicycles   | 40000.00    |
+-------------------+-------------+
```

![image](https://github.com/chrisxj33/Bike-Store-ETL/assets/53899548/dd6baa1d-f2e4-49ee-93ea-24a06b7bfef8)

