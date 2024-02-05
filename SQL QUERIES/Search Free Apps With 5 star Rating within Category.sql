--Find out which apps have a 5 star rating in (selected) category that are also free.
WITH rank_apps AS (
	SELECT 
		A.title,
		C.title as category_title,
		A.rating,
		DENSE_RANK() OVER(PARTITION BY C.title ORDER BY A.rating DESC) as rn
	FROM apps A
		JOIN apps_categories AP
		ON A.appid = AP.appid
		JOIN categories C
		ON AP.categoryid = C.categoryid
		JOIN pricing_plan P
		ON A.appid = P.appid
	WHERE
		C.title = 'Marketing' AND P.price = 0.0
)

SELECT title,
		category_title,
		rating
FROM
	rank_apps
WHERE
	rn = 1
ORDER BY
	title ASC;
