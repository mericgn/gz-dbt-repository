WITH all_campaigns AS (
    SELECT * FROM {{ ref('stg_adwords') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_bing') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_criteo') }}
    UNION ALL
    SELECT * FROM {{ ref('stg_facebook') }}
)

SELECT * FROM all_campaigns