{% set incremental_flag = 1 %}
{% set incremental_col = 'CREATED_AT' %}

SELECT *
FROM {{ source('staging', 'bookings') }}
{% if incremental_flag == 1 %}
    WHERE {{ incremental_col }} > COALESCE((SELECT MAX({{ incremental_col }}) FROM {{ target.database }}.bronze.bronze_bookings), '1900-01-01')
{% endif %}
