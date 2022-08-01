with top_content_de as (

    select 
        En as Origin,
        content as Content,
        sum(counter) as Top_Contents_de

    from {{ source('my-wiki-data-bq', 'raw_page_counts') }}
    where En ='de'
    Group by Origin, Content
    Order by Top_Contents_de Desc
)

    select *  from top_content_de limit 50