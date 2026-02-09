{{ config(materialized = 'streaming_table')}}

select * ,
_metadata.file_path as file_path,
_metadata.file_modification_time as file_time
from STREAM read_files(
    '/Volumes/main/volume/task/dbt_pipeline/orders/',
    format => 'csv',
    header => true
)