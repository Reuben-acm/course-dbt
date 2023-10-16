with addresses as (
    select
        ADDRESS_ID
        ,ADDRESS
        ,ZIPCODE
        ,STATE
        ,COUNTRY 
    from {{ source('postgres', 'addresses') }}
)

, renamed_recast as (
    select 
        ADDRESS_ID
        ,ADDRESS
        ,ZIPCODE
        ,STATE
        ,COUNTRY 
    from addresses
)

Select * from renamed_recast