{% set incremental_flag = 0 %}
{% set incremental_col = 'CREATED_AT' %}

SELECT *
FROM {{ source('staging', 'listings') }}
{% if incremental_flag == 1 %}
    WHERE {{ incremental_col }} > COALESCE((SELECT MAX({{ incremental_col }}) FROM {{ target.database }}.bronze.bronze_listings), '1900-01-01')
{% endif %}
