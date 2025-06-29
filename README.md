# Yelp Review Sentiment Intelligence Project

##  Overview
This project showcases a complete cloud-native analytics workflow that transforms raw Yelp review data into structured insights using **Snowflake**, **Python UDF**, and **SQL**. It simulates a real-world business scenario where stakeholders need to understand customer sentiment, business performance, and reviewer behavior at scale.

##  Goal
Enable data-driven decisions by:
- Classifying customer sentiment from unstructured review text
- Modeling review volume, star ratings, and business trends
- Identifying top-performing businesses and potential churn risks

##  Tech Stack
- **Data Source**: Yelp JSON (Reviews + Businesses)
- **Cloud Storage**: AWS S3
- **Data Warehouse**: Snowflake (VARIANT, SQL, Python UDF)
- **Languages**: SQL, Python (TextBlob)


##  What’s Implemented
-  Python script to split 5GB raw JSON review file into smaller chunks
-  Ingest raw Yelp review and business data from S3 into Snowflake
-  Parse and flatten JSON data using VARIANT column type
-  Apply sentiment classification using Python UDF (TextBlob)
-  Answer business-critical questions using SQL queries

##  Setup Instructions
1. Use the Python script to split `yelp_academic_dataset_review.json` into smaller files  
2. Upload the files to an AWS S3 bucket  
3. Run Snowflake `COPY INTO` commands to load the JSON files into `VARIANT` columns  
4. Use SQL to flatten the data into structured tables  
5. Create and apply the Python UDF to generate sentiment classification  
6. Run the analytical SQL queries to derive business insights  

##  Data Flow

---

##  SQL Insights Delivered
1. Business count by category  
2. Top 10 users reviewing restaurants  
3. Most reviewed business categories  
4. Top 3 recent reviews per business  
5. Month with highest review volume  
6. 5-star review % per business  
7. Top 5 reviewed businesses per city  
8. Avg rating for businesses with ≥100 reviews  
9. Top 10 reviewers + reviewed businesses  
10. Businesses with highest number of positive sentiment reviews  

 _All queries are available in [`/sql/analytics_queries.sql`](./sql/analytics_queries.sql)_


##  Outcomes
- Identified most-trusted business categories by 5★ share  
- Highlighted cities and businesses with strong or weak sentiment  
- Detected high-volume reviewers and churn-risk businesses  
- Demonstrated cloud-scale ETL and Python-SQL integration in a real-world scenario  
