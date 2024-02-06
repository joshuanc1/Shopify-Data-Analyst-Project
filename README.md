# Shopify-Data-Analyst-Project
SQL project comparing Shopify apps. <br/>
Methods: Data Cleansing, Data Visualization, SQL Querying, Statistical Inference <br/>
Technologies: PostgresSQL, Excel, Tableau <br/>
Download Data: [https://drive.google.com/file/d/1Jh52pxbc5JHmOZRnHrvOwdSoHJf1f8OM/view?usp=drive_link](https://drive.google.com/drive/folders/1SWPZz0lvMKOtEVFCcl5UpXpPyrKR3mKn?usp=drive_link) <br/>


Project Overview: <br/>
  SQL project determining which Shopify apps have the best ratings and reviews for each category &amp; pricing plan to determine what models work the best in attracting clients and maintaining a consumer subscription. <br/>

    
Schema Design:
![ERD Shopify Relationships pgerd](https://github.com/joshuanc1/Shopify-Data-Analyst-Project/assets/108759536/693cc8fb-d91d-48dc-aadb-19663390bf3f)


Instructions: <br/>
  1. Download Data from Google Drive. <br/>
  2. Run Table Creation SQL file FROM SQL QUERIES folder <br/>
  3. Run Data importing SQL file FROM SQL QUERIES folder (Replace path file to corresponding data table with your own path file) <br/>


Dataset Description: <br/>
Dataset: Kaggle <br/>
Cleansing Process: (Excel) <br/>
  1. UNIQUE rows <br/>
  2. apps.url  =IF(ISNUMBER(SEARCH("https://apps.shopify.com/",B2)),B2, "Invalid URL")      -- Make sure each url follows the correct url pattern <br/>
  3. apps.rating Filter out numberic values greater than 5.0 or less than 0.0 <br/>
  3. review.body =CONCATENATE("""",B2,"""") to prevent '\n' errors during data importing to PgAdmin <br/>

SQL Queries: <br/>
  Can be found in SQL QUERIES folder <br/>
Data Analysis Results: <br/>
  
  ![Data Results](https://github.com/joshuanc1/Shopify-Data-Analyst-Project/assets/108759536/fef06f58-b3e0-4060-a1f9-4f98c768f332)

  SUMMARY: <br/>
  The ranking of Shopify apps per category is based on its rating and number of reviews for each specific price point(Free, Basic(<$20.00), Advanced ($20.00 >< $40.00), Premium (> $40.00), One-time-charge (any price)). The Sum of Top 5 in the table above are the number of occurences in which the App appears for its corresponding category for the different price points. For example: "Privy - Pop ups, Email, & SMN" show up three times in the top 5 in the Free, Basic, and Premium pricing category. The table above does not show the specific price categories. The same can be said of other rankings in each category.

  
  
Challenges and Solutions: <br/>
  Document any challenges you faced during the project and how you addressed them.
Performance Optimization:
  If you optimized your queries for performance, explain the steps you took and the impact on query execution time.
Next Steps:
  Discuss potential extensions or improvements to your project. This could include additional analyses, incorporating more data sources, or refining your queries.
