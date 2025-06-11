string_not_empty.sql
{% test string_not_empty(model, column_name) %}
    SELECT {{column_name}}
    FROM {{model}}
    where TRIM({{column_name}}) = ''
{% endtest %}