{% test is_id_valid(model, column_name) %}
    SELECT 1
    FROM {{ model }}
    WHERE NOT REGEXP_CONTAINS({{ column_name }}, "s[0-9]+")
{% endtest %}