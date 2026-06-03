with sales as (
    select * from {{ ref('stg_raw__sales') }}
),

product as (
    select * from {{ ref('stg_raw__product') }}
)

select
    sales.orders_id,
    sales.date_date,
    sales.products_id,
    sales.revenue,
    sales.quantity,
    CAST(product.purchase_price AS FLOAT64) as purchase_price,
    ROUND(sales.quantity * CAST(product.purchase_price AS FLOAT64), 2) as purchase_cost,
    ROUND(sales.revenue - (sales.quantity * CAST(product.purchase_price AS FLOAT64)), 2) as margin
from sales
left join product
    on sales.products_id = product.products_id