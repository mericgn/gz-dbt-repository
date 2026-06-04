with 
source as (
    select * from {{ source('raw', 'ship') }}
),
renamed as (
    select
        orders_id,
        shipping_fee,
        logCost as log_cost, -- BigQuery'deki orijinal büyük harfli ismi dbt standartına çevirdik
        cast(ship_cost as float64) as ship_cost
    from source
)
select * from renamed