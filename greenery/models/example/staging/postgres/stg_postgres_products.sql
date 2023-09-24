with products as (
    select 
        PRODUCT_ID
        ,NAME
        ,PRICE
        ,INVENTORY
    from {{ source('postgres', 'products') }}
)

, renamed_recast as (
    select 
        PRODUCT_ID
        ,NAME
        ,PRICE
        ,INVENTORY
    from products
)

Select * from renamed_recast