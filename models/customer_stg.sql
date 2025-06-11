{{ config(schema='L2_PROCESSING') }}

SELECT
    CUSTOMERID,
    FIRSTNAME,
    LASTNAME,
    EMAIL,
    PHONE,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE,
    UPDATED_AT,
    CONCAT(C.FIRSTNAME, ' ', C.LASTNAME) AS CUSTOMERNAME
FROM
    {{ source("landing", "cust") }} C
