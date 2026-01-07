{% macro trimmer(col_name, node) %}
    {{ col_name | trim | upper }}
{% endmacro %}