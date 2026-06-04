with 
source as (
    select * from `deneme-498307`.`gz_raw_data`.`raw_gz_product`
),
renamed as (
    select
        products_id,
        cast(purchse_price as float64) as purchase_price
    from source 
)
select * from renamed