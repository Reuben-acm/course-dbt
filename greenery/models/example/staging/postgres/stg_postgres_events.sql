with events as (
    select 
        EVENT_ID
        ,SESSION_ID
        ,USER_ID
        ,PAGE_URL
        ,CREATED_AT
        ,EVENT_TYPE
        ,ORDER_ID
        ,PRODUCT_ID 
    from {{ source('postgres', 'events') }}
)

, renamed_recast as (
    select 
        EVENT_ID
        ,SESSION_ID
        ,USER_ID
        ,PAGE_URL
        ,CREATED_AT
        ,EVENT_TYPE
        ,ORDER_ID
        ,PRODUCT_ID 
    from events
)

Select * from renamed_recast