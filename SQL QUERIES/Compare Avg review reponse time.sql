--Find and compare Average review/help response time in days


SELECT A.title, COUNT(R.reviewid) as num_response, ROUND(AVG(R.developer_rely_posted_at::date - R.posted_at::date),2) as response_time_in_days
FROM apps A
	JOIN reviews R
	ON a.appid = R.appid
WHERE R.developer_reply IS NOT NULL AND R.body IS NOT NULL AND R.developer_rely_posted_at > R.posted_at
GROUP BY A.title
ORDER BY response_time_in_days ASC, num_response DESC, title;