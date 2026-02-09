{{ config(materialized='table')}}

select * from 
{{ref("stg_products")}}
where product_id is not null
QUALIFY row_number() over(
    partition by product_id
    order by file_time desc ) = 1