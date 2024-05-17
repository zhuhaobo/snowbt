
{{ config(
    schema='std',
    materialized='table'
) }}

{{
  generate_flatten_json(
    model_name = source("xero", "invoice"),
    json_column = 'invoices'
  )
}}