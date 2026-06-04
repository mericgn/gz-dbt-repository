{{ config(
    materialized='table',
    schema='finance'
) }}

with orders as (
    -- dbt'nin otomatik referans bulucu fonksiyonu eklendi:
    select * from {{ ref('int_orders_operational') }}
)

select
    date_date,
    -- Günlük İşlem Evrimi: Toplam benzersiz sipariş sayısı
    COUNT(DISTINCT orders_id) as nb_transactions,
    -- Toplam Gelir
    ROUND(SUM(revenue), 2) as revenue,
    -- Günlük Ortalama Sepet Evrimi: Toplam Gelir / Toplam Sipariş
    ROUND(SUM(revenue) / COUNT(DISTINCT orders_id), 2) as average_basket,
    -- Günlük Operasyonel Marj Evrimi
    ROUND(SUM(operational_margin), 2) as operational_margin,
    -- Toplam Satın Alma Maliyeti
    ROUND(SUM(purchase_cost), 2) as purchase_cost,
    -- Toplam Nakliye Ücreti (Müşterinin ödediği)
    ROUND(SUM(shipping_fee), 2) as shipping_fee,
    -- Toplam Lojistik Maliyeti
    ROUND(SUM(log_cost), 2) as log_cost,
    -- Satılan Toplam Ürün Miktarı 
    SUM(quantity) as quantity
from orders
group by date_date
order by date_date desc