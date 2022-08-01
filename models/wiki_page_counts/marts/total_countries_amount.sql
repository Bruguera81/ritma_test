
with total_countries_amount as (

    select 
        Origin,
        Top_Counters as counter_amount
    from {{ ref('main_countries') }}
)

select * from total_countries_amount limit 3