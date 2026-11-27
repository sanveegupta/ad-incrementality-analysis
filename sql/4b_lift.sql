WITH rates AS (
  SELECT
    AVG(IF(test_group = 'ad',  converted, NULL)) AS ad_rate,
    AVG(IF(test_group = 'psa', converted, NULL)) AS psa_rate
  FROM `ad-incrementality.ab_project.marketing_ab`
  )
SELECT
  ROUND(ad_rate * 100, 3)  AS ad_rate_pct,
  ROUND(psa_rate * 100, 3) AS psa_rate_pct,
  ROUND((ad_rate - psa_rate) / psa_rate * 100, 1) AS relative_lift_pct,
  ROUND((ad_rate - psa_rate) * 1000, 2) AS extra_conversions_per_1000_users
FROM rates;
