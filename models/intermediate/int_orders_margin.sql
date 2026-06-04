with sales_margin as (
    select * from `deneme-498307`.`dbt_meric`.`int_sales_margin`
)

select
    orders_id,
    date_date,
    ROUND(SUM(revenue), 2) as revenue,
    ROUND(SUM(quantity), 2) as quantity,
    ROUND(SUM(purchase_cost), 2) as purchase_cost,
    ROUND(SUM(margin), 2) as margin
from sales_margin
group by orders_id, date_date