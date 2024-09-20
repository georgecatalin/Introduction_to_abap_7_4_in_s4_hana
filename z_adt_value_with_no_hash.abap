*&---------------------------------------------------------------------*
*& Report z_adt_value_with_no_hash
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_value_with_no_hash.

* ----------------------------------------------------------------------*
* The use of VALUE without hash derives the type of the table from the RHS of the assignment.
* ----------------------------------------------------------------------*


TYPES: BEGIN OF ty_purchase,
         ebeln TYPE ebeln, " Purchase Order Number
         lifnr TYPE lifnr, " Vendor Number
         risk  TYPE flag, "   Risk Indicator
       END OF ty_purchase.

TYPES: tt_purchase TYPE TABLE OF ty_purchase WITH DEFAULT KEY. " Table of type ty_purchase with default key in this case 'with default key' is mandatory
* The default key is the first field of the table. In this case, it is ebeln

DATA(runtime_table) = VALUE tt_purchase(
    ( ebeln = 11 lifnr = 'Vendor1' risk = ' ')
    ( ebeln = 12 lifnr = 'Vendor2' risk = 'X')
    ( ebeln = 13 lifnr = 'Vendor3' risk = 'X' )
 ). " The type of runtime_table is tt_purchase

 cl_demo_output=>display( runtime_table ).
