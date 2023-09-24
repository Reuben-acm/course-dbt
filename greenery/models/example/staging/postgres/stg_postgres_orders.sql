with orders as (
    select 
     ORDER_ID
    ,USER_ID
    ,PROMO_ID
    ,ADDRESS_ID
    ,CREATED_AT
    ,ORDER_COST
    ,SHIPPING_COST
    ,ORDER_TOTAL
    ,TRACKING_ID
    ,SHIPPING_SERVICE
    ,ESTIMATED_DELIVERY_AT
    ,DELIVERED_AT
    ,STATUS
    from {{ source('postgres', 'orders') }}
)

, renamed_recast as (
    select 
        ORDER_ID
        ,USER_ID
        ,PROMO_ID
        ,ADDRESS_ID
        ,CREATED_AT
        ,ORDER_COST
        ,SHIPPING_COST
        ,ORDER_TOTAL
        ,TRACKING_ID
        ,SHIPPING_SERVICE
        ,ESTIMATED_DELIVERY_AT
        ,DELIVERED_AT 
        ,STATUS
    from orders
)

Select * from renamed_recast