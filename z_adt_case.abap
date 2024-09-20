*&---------------------------------------------------------------------*
*& Report z_adt_case
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_case.

SELECT ebeln, " Purchase Order Number
       ebelp, "     Item Number
       matnr, "    Material Number
       werks, "     Plant
       " this is an example of a simple CASE statement
       CASE loekz "  Deletion Indicator
        WHEN ' ' THEN 'Active'
        WHEN 'X' THEN 'Deleted'
        ELSE 'Unknown'
       END AS status,
       " this is an example of a searched CASE statement
       CASE
        WHEN brtwr > 5000 THEN 'Expensive' " Net Price
        WHEN brtwr > 1000 THEN 'Moderate' " Net Price
        ELSE 'Cheap'
       END AS price
       FROM ekpo INTO TABLE @DATA(lt_ekpo).

IF sy-subrc = 0.
  cl_demo_output=>display( lt_ekpo ).
ENDIF.
