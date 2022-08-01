
with top_content_en as (

    select 
        En as Origin,
        content as Content,
        sum(counter) as Top_Contents_En

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }}
    where En ='en'
    Group by Origin, Content
    Order by Top_Contents_En Desc
)

    select *  from top_content_en limit 50