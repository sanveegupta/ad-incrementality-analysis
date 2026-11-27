SELECT most_ads_day, ROUND(AVG(converted) * 100, 2) AS conversion_rate_pct, COUNT(*) AS users
FROM `ad-incrementality.ab_project.marketing_ab`
WHERE test_group = 'ad'
GROUP BY most_ads_day
ORDER BY conversion_rate_pct DESC;
