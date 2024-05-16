{% macro generate_flatten_json_test(model_name, json_column) %}

SELECT 
  i.value:AmountCredited::STRING AS AmountCredited,
  i.value:AmountDue::STRING AS AmountDue,
  i.value:AmountPaid::STRING AS AmountPaid,
  i.value:Contact:ContactID::STRING AS ContactID,
  i.value:Contact:Name::STRING AS ContactName,
  i.value:CurrencyCode::STRING AS CurrencyCode,
  i.value:Date::STRING AS Date,
  i.value:DateString::STRING AS DateString,
  i.value:DueDate::STRING AS DueDate,
  i.value:DueDateString::STRING AS DueDateString,
  i.value:InvoiceID::STRING AS InvoiceID,
  i.value:InvoiceNumber::STRING AS InvoiceNumber,
  i.value:LineAmountTypes::STRING AS LineAmountTypes,
  i.value:Reference::STRING AS Reference,
  i.value:Status::STRING AS Status,
  i.value:SubTotal::STRING AS SubTotal,
  i.value:Total::STRING AS Total,
  i.value:TotalTax::STRING AS TotalTax,
  i.value:Type::STRING AS Type,
  i.value:UpdatedDateUTC::STRING AS UpdatedDateUTC
FROM {{ model_name }},
LATERAL FLATTEN(input => PARSE_JSON(invoice.invoices)) AS i

{% endmacro %}
