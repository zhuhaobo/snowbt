
{{ config(
    schema='std',
    materialized='table'
) }}

{{
  generate_flatten_json(
    model_name = source("xero", "orderinfo"),
    json_column = 'orders'
  )
}}