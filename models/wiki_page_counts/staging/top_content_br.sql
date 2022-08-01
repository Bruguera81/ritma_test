with top_content_br as (

    select 
        En as Origin,
        content as Content,
        sum(counter) as Top_Contents_br

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }}
    where En ='br'
    Group by Origin, Content
    Order by Top_Contents_br Desc
)

    select *  from top_content_br limit 50