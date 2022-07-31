
with counts as (

    select 
        En,
        content,
        counter,
        size,
        created_date,
        loaded_datetime

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }}

) 
    select * from counts
--`my-wiki-data-bq.pagecounts.raw_page_counts`