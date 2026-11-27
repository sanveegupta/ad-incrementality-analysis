SELECT
  CASE
    WHEN total_ads < 10  THEN '01: 1-9'
    WHEN total_ads < 25  THEN '02: 10-24'
    WHEN total_ads < 50  THEN '03: 25-49'
    WHEN total_ads < 100 THEN '04: 50-99'
    WHEN total_ads < 200 THEN '05: 100-199'
    ELSE '06: 200+'
  END AS ad_bucket,
  test_group,
  COUNT(*) AS users,
  ROUND(AVG(converted) * 100, 2) AS conversion_rate_pct
FROM `ad-incrementality.ab_project.marketing_ab`
GROUP BY ad_bucket, test_group
ORDER BY ad_bucket, test_group;
