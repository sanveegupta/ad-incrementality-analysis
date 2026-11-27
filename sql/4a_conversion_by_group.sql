SELECT
  test_group,
  COUNT(*) AS users,
  SUM(converted) AS conversions,
  ROUND(AVG(converted) * 100, 3) AS conversion_rate_pct
FROM `ad-incrementality.ab_project.marketing_ab`
GROUP BY test_group;
