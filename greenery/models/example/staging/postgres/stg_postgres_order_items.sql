with order_items as (
    select 
        ORDER_ID
        ,PRODUCT_ID
        ,QUANTITY
    from {{ source('postgres', 'order_items') }}
)

, renamed_recast as (
    select 
        ORDER_ID
        ,PRODUCT_ID
        ,QUANTITY
    from order_items
)

Select * from renamed_recast