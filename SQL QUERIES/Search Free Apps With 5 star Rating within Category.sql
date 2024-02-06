--Find out which apps have a 5 star rating in (selected) category that are also free.
WITH rank_apps AS (
	SELECT 
		A.title,
		C.title as category_title,
		A.rating,
		COUNT(R.reviewid) as review_count,
		ROW_NUMBER() OVER(PARTITION BY C.title ORDER BY COUNT(R.reviewid) DESC, A.rating DESC) as ranking
	FROM apps A
		JOIN apps_categories AP
		ON A.appid = AP.appid
		JOIN categories C
		ON AP.categoryid = C.categoryid
		JOIN pricing_plan P
		ON A.appid = P.appid
		JOIN reviews R
		ON A.appid = R.appid
	WHERE
		P.one_time_charge = true						-- Change price from 0.00(Free), 0.01 - 20.00(Basic), 20.01 - 40.00(Advanced), > 40.00(Premium), P.one_time_charge = true
	GROUP BY A.title, C.title, A.rating
)

SELECT title,
		category_title,
		rating,
		ranking,
		review_count
FROM
	rank_apps
WHERE
	ranking <= 5
ORDER BY
	category_title, ranking;
