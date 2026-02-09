{{ config(materialized='table')}}

select * from 
{{ref("stg_customers")}}
where customer_id is not null
QUALIFY row_number() over(
    partition by customer_id
    order by file_time desc ) = 1