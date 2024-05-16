{% macro flatten_json(model_name, json_column) %}
WITH json_data AS (
  SELECT
    PARSE_JSON({{ json_column }}) AS json_data
  FROM
    {{ model_name }}
),
json_flat AS (
  SELECT
    key,
    json_data.json_data:value AS value
  FROM
    json_data,
    LATERAL FLATTEN(input => json_data.json_data)
)
SELECT
  {% for key in range(0, json_flat.column_names | length - 1) %}
    value:{{ json_flat.column_names[key] }}::STRING AS {{ json_flat.column_names[key] }}{% if not loop.last %},{% endif %}
  {% endfor %}
FROM
  json_flat
{% endmacro %}
