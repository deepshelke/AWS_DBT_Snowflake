{{ config(severity='warn') }}
SELECT 1  
FROM {{ source('staging', 'bookings') }}
WHERE BOOKING_AMOUNT < 200 