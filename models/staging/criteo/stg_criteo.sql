SELECT 
    campaign_key AS campaign_name,
    date_date,
    CAST(ads_cost AS FLOAT64) AS ads_cost,
    impression AS ads_impression,
    click AS ads_clicks
FROM {{ source('gz_raw_data', 'raw_gz_criteo') }}