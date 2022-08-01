with top_content_pt as (

    select 
        En as Origin,
        content as Content,
        sum(counter) as Top_Contents_pt

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }}
    where En ='pt'
    Group by Origin, Content
    Order by Top_Contents_pt Desc
)

    select *  from top_content_pt limit 50