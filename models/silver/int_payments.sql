{{ config(materialized = 'incremental',
        incremental_strategy = 'merge',
        unique_key = 'payment_id'
)}}

select * from 
{{ ref("stg_payments") }}
where payment_id is not null
{%if is_incremental() %}
    and file_time > (select max(file_time) from {{this}} )
{% endif %}
QUALIFY row_number() over(
    partition by payment_id order by file_time desc
) = 1