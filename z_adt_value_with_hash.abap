*&---------------------------------------------------------------------*
*& Report z_adt_value_with_hash
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_value_with_hash.

* ----------------------------------------------------------------------
* The use of VALUE allows you to define the table content directly
* The hash (#) symbol is used to define the table type
* The table type is defined by the structure of the LHS table
* ----------------------------------------------------------------------

TYPES: BEGIN OF ty_purchase_order,
         ebeln TYPE ebeln, " Purchase Order
         lifnr TYPE lifnr, " Vendor
         risk TYPE flag, " Risk Indicator
       END OF ty_purchase_order.

DATA: lv_purchase_order TYPE STANDARD TABLE OF ty_purchase_order.

lv_purchase_order = VALUE #(
    ( ebeln = 11 lifnr = 'Vendor1' risk = ' ' )
  ( ebeln = 12 lifnr = 'Vendor2' risk = 'X')
  ( ebeln = 13 lifnr = 'Vendor3' risk = 'X' )
  ( ebeln = 14 lifnr = 'Vendor4' risk = 'X')
).

cl_demo_output=>display(  lv_purchase_order ). " Display the table
