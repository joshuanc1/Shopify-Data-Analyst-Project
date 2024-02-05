--User engagement Metric
--Determine average number of reviews per user for top 10 developers with most apps.


SELECT R.author, COUNT(R.appid) as num_apps, ROUND(AVG(R.rating),2) as avg_rating
FROM reviews R
WHERE R.author IS NOT NULL
GROUP BY R.author
ORDER BY num_apps DESC
LIMIT 10;


--Determine number or user reviews for Free, less than 20, less than 40, > 40 in each category

WITH category_apps AS (
	SELECT A.appid, C.title as category_title
	FROM apps A
		JOIN apps_categories AC
		ON A.appid = AC.appid
		JOIN categories C 
		ON AC.categoryid = C.categoryid
)


SELECT category_title,
		(
		CASE WHEN P.price = 0.00 THEN 'Free'
		WHEN (P.price BETWEEN 0.01 AND 20.00) AND P.one_time_charge = false THEN 'Basic'
		WHEN (P.price BETWEEN 20.01 AND 40.00) AND P.one_time_charge = false THEN 'Advanced'
		WHEN P.one_time_charge = true THEN 'One-Time-Charge'
		ELSE 'Premium'
		END
	) as membership_rank,
	COUNT(R.reviewId) as num_reviews,
	ROUND(AVG(P.price),2) as avg_price
	
FROM reviews R
	JOIN pricing_plan P
	ON R.appid = P.appid
	JOIN category_apps CA
	ON P.appid = CA.appid
	
GROUP BY category_title, membership_rank
ORDER BY category_title, num_reviews DESC;
