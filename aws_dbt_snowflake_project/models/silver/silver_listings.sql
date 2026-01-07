{{
  config(
    materialized='incremental',
    unique_key='LISTING_ID'
  )
}}

SELECT 
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,
    {{ tag('PRICE_PER_NIGHT') }} AS PRICE_TAG,
    CREATED_AT
FROM {{ ref('bronze_listings') }}
