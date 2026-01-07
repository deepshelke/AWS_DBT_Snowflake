{% macro multiply(x,y,precision) %}
    round({{x}} * {{y}},{{precision}}) 
{% endmacro %}