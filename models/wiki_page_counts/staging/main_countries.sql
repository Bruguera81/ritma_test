
with main_countries as (

    select 
        En as Origin,
        sum(counter) as Top_Counters

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }} 
    where En in ('en','de','br')
    Group by En
    order by Top_Counters desc
) 
    select  * from main_countries
--`my-wiki-data-bq.pagecounts.raw_page_counts`