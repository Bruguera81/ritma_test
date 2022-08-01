
With counter_en as (

    select 
        Origin,
        Content,
        Top_Contents_En as counter_amount
    from {{ ref('top_content_en') }}
),
    counter_de as (
    select 
        Origin,
        Content,
        Top_Contents_de as counter_amount
    from {{ ref('top_content_de')}}
),
    counter_pt as (
    select 
        Origin,
        Content,
        Top_Contents_pt as counter_amount
    from {{ ref('top_content_br') }}
), 
    page_counting as ( 
    select * from counter_en
    union all
    select * from counter_de
    union all 
    select * from counter_pt
)
    select * from page_counting 
    order by counter_amount desc limit 50

