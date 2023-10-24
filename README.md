# Bike-Store-Data-Analytics

Credit: sqlservertutorial.net 
Data Source: https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database?select=brands.csv

# Introduction

### Project Summary

The project demonstrates how to effectively gather, transform, and store data in a structured manner, leveraging Azure's suite of tools, making it a valuable blueprint for businesses aiming to streamline their data analytics processes and providing scalability for improved cost.

### Project Importance
- **Centralized Data Storage:** By setting up a relational database, businesses can ensure that their data is stored in a centralized and structured manner. This makes it easier to access, manage, and update data as needed.
- **Efficient Data Ingestion:** Using tools like Azure Data Factory simplifies the data ingestion process, allowing businesses to quickly pull in new data from various sources and keep their databases up-to-date.
- **Scalability:** Cloud platforms like Azure offer scalable database solutions. As the company grows and its data needs increase, the database can be scaled up without significant changes to the existing infrastructure.
- **Data Transformation:** With Azure DataBricks, businesses can transform and preprocess their data as needed. This ensures that the data stored in the database is in the right format and quality for analytics.
- **Automation:** The entire end to end process can be easily scheduled to efficiently update the database with the latest data.
- **Enhanced Decision Making:** With a properly set up database and the right data in place, companies can leverage analytics and business intelligence tools to derive insights from their data. This can guide strategic decision-making and optimize operations.

# Methodology

### Step 1. Database Schema and Creation

First, we visualized our desired database schema using DBDiagram. This involved defining tables, specifying columns, setting data types, and delineating the relationships between tables.

![schema_final](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/8f92c7f7-5888-4357-a60c-011aecb06e97)

Subsequently, we initialized our database within Azure's SQL Database service. Using Azure Data Studio, we remotely accessed the database from a local machine and executed an SQL notebook to apply the visualized schema. This process involved creating tables and setting up relationships. With this step completed, the database was primed to receive data.

### Step 2. Data Ingestion with Azure Data Factory

Our primary step was to establish a data storage container to archive both raw and processed data sets.

We leveraged Azure Data Factory to retrieve data directly from GitHub using a provided raw file link, subsequently storing the CSV file within our data storage container.

![image](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/703b19a4-78a9-448a-9916-4ea4dfbecb8d)

### Step 3. Data Transformation

For data transformation, we utilized Azure DataBricks. Utilizing a Python-based notebook, we imported data from our storage container, executed necessary transformations to ensure compatibility with our database schema (like data type conversions), and saved the refined data back to the storage container in a separate directory.

### Step 4. Inserting Data into the Relational Database

Azure Data Factory came into play once again for this step. Here, our task was to map our data source (the storage container) to our database and initiate the data transfer. It's imperative to ensure that the sequence of data transfer respects the database's constraints, notably primary and foreign key associations. The recommended order for data insertion is illustrated below.

![image](https://github.com/chrisxj33/Bike-Store-Data-Analytics/assets/53899548/28fc04ca-f764-4a90-845a-d51c981bb13f)
