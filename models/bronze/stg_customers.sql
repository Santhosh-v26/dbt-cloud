{{ config(materialized = "table") }}
select *,
_metadata.file_path as file_path,
_metadata.file_modification_time as file_time
from read_files(
    "/Volumes/main/volume/task/dbt_pipeline/customers/",
    format => "csv",
    header => true
)