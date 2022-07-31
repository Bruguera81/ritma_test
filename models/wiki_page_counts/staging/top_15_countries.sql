
with countries as (

    select 
        En as Origin,
        sum(counter) as Top_Counters

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }} 
    Group by En
    order by Top_Counters desc
) 
    select  * from countries limit 15
--`my-wiki-data-bq.pagecounts.raw_page_counts`