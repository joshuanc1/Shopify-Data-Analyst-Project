# Shopify-Data-Analyst-Project
SQL project comparing Shopify apps.
Dataset: Kaggle
Methods: Data Cleansing, Data Visualization, SQL Querying, Statistical Inference
Technologies: PostgresSQL, Excel, Tableau

Project Overview:
  SQL project determining which Shopify apps have the best ratings and reviews for each category &amp; pricing plan to determine what models work the best in attracting clients and maintaining a consumer subscription. 
Dataset Description:
  Provide information about the dataset, including its source, structure, and any data cleaning or preprocessing steps you performed.
  apps Table:
    url: =IF(AND(ISNUMBER(SEARCH("https://",B2)),ISNUMBER(SEARCH(".com",B2))),B2,"")
  reviews Table:
    posted_at: =IFERROR(DATEVALUE(B2),B2)
  pricing_plan Table:
    =UNIQUE(title)
    
Schema Design:
  Document the structure of your database schema, including the purpose of each table and the relationships between them.
SQL Queries:
  Explain the purpose of key SQL queries, especially those involved in data analysis. Include comments within your SQL script to describe each major step.
Data Analysis Results:
  Summarize the key findings from your data analysis. Use tables, charts, or visualizations if applicable.
Challenges and Solutions:
  Document any challenges you faced during the project and how you addressed them.
Performance Optimization:
  If you optimized your queries for performance, explain the steps you took and the impact on query execution time.
Next Steps:
  Discuss potential extensions or improvements to your project. This could include additional analyses, incorporating more data sources, or refining your queries.
