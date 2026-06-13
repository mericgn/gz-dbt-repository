SELECT
    date_date,
    campaign_name,
    SUM(ads_cost) AS ads_cost,
    SUM(ads_impression) AS ads_impression,
    SUM(ads_clicks) AS ads_clicks
FROM {{ ref('int_campaigns') }}
GROUP BY 1, 2
ORDER BY date_date DESC