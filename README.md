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
  The ranking of Shopify apps per category is based on its rating and number of reviews for each specific price point(Free, Basic(<$20.00), Advanced ($20.00 >< $40.00), Premium (> $40.00), One-time-charge (any price)). The Sum of Top 5 in the table above are the number of occurences in which the App appears for its corresponding category for the different price points. For example: "Privy - Pop ups, Email, & SMN" show up three times in the top 5 in the Free, Basic, and Premium pricing category. The table above does not show the specific price categories. The same can be said of other rankings in each category.  <br/>
  Another Insight from the SQL QUERIES were that the majority of the application throughout all categories were used more often during the weekdays peaking at Tuesday and Thursdays as seen from the amount of reviews posted on those given days.

  The results for each pricing category is within the PIVOT TABLES folder.

Challenges and Solutions: <br/>
  1. The most challenging part is coming up with business questions and insights to solve based off the information on the dataset used for the project. <br/> The solution was to find relationships between the tables, come up with a few questions for each, and determine which would help contribute towards the Project Overview. <br/>
  2. Another challenge determining how to generalize the different payment plans throughout each application since each app has different named tiers. <br/> At first my solution was to find certain key words in each subscription tier like searching for the word "Free" within each tier which worked, but there were too many variations of titles for the other tiers for that solution to be efficient. The only other way I could generalize the plan was based off price points and whether they were a monthly payment or a one-time payment. This solution allowed me to segment the apps, but there was another problem. Each subscription tier also varied for example an application could have a free to 100$ a month subcrition plan while another could have a free to 20$ for their premium tier subscription. This 100% skewed the results and had changed the validity of the end results. <br/>
  3. Another challenge was not having a client to bounce ideas from. Client insight could help in determining what was more important when it came to the "Quality" of the App. I based it off of the formentioned criterias, but there might have been a criteria that was seen as more important than the other by the client. <br/>
  4. Another challenge was the lack of imformation in the datasets. A lot of values were missing from certain columns that were needed in criterias for "Quality" of the App and some had invalid data that had a developer reponse date before the user post date. This was solved by cleaning the data, but it definitely changed the end result of the data. <br/>
  5. Filling the data tables in PostgresSQL was automatic if I utilized the COPY SQL for my specific path file, but It is not automatic for others who would want to download the datasets. They would have to put in their own file path.
  
Next Steps: <br/>
  Discuss potential extensions or improvements to your project. This could include additional analyses, incorporating more data sources, or refining your queries.
  1. Performance Optimization - I found I had to join multiple of the same tables many times for each SQL query. I could have reduced the redundancies by creating a View or a custom function that returns the joined tables to reduce clutter in the queries. <br/>
  2. I could have spent more time fleshing out the subscription tiers for each application to have a more accurate summary instead of basing it off price. <br/>
  3. With different data values and more information, there could have been deeper insight. For example active user column instead of depending on review count. There could also be a date aspect and the amount of users utilizing the app on that specific day so there could be a timeline to visualize the trend of users overtime. <br/>
  4. Another downfall and possible future fix was what the Apps in each category actually provided service wise. For example, there could be a search for certain key words within the description/services that the app provides and return those results to ensure the app has the tools that the user is looking for. <br/>

  OVERALL: <br/>
  The most important thing for me was the start. Finding a dataset that has enough quality information to answer the business question at hand, because if I don't have that, the rest of the project would be hard.
