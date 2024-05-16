
{{ config(
    schema='std',
    materialized='table'
) }}

{{
  flatten_json(
    model_name = source("xero", "invoice"),
    json_column = 'invoices'
  )
}}