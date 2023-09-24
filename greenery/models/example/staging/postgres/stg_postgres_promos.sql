with promos as (
    select 
        PROMO_ID
        ,DISCOUNT
        ,STATUS
    from {{ source('postgres', 'promos') }}
)

, renamed_recast as (
    select 
        PROMO_ID
        ,DISCOUNT
        ,STATUS
    from promos
)

Select * from renamed_recast