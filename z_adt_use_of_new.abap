*&---------------------------------------------------------------------*
*& Report z_adt_use_of_new
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_use_of_new.

TYPES: BEGIN OF ty_purchase_order,
         ebeln TYPE ebeln,
         lifnr TYPE lifnr,
         risk  TYPE flag,
       END OF ty_purchase_order.


" define a structure variable as a reference to the type -> This is required when we use NEW
DATA: ls_purchase_order TYPE REF TO ty_purchase_order.

" ---------------------------------------------------------------
" VERSION 1: Create a new structure object using NEW #
" ----------------------------------------------------------------
*
*ls_purchase_order = NEW #(
*    ebeln = '123456'   lifnr = 'Vendor1'   risk  = 'X'
*    ).
*
*cl_demo_output=>display( ls_purchase_order->* ). " Display the structure object as a reference
*cl_demo_output=>display( ls_purchase_order->*-ebeln ). " Display  a field in the structure object as a reference, in this case preview the purchase order number

" ---------------------------------------------------------------
" VERSION 2: Create a new structure object using NEW without #
" ----------------------------------------------------------------
DATA(runtime_structure) = NEW ty_purchase_order(
    ebeln = '123456'   lifnr = 'Vendor1'   risk  = 'X'
    ).

cl_demo_output=>display( runtime_structure ). " Display the structure object
cl_demo_output=>display( runtime_structure->ebeln ). " Display  a field in the structure object, in this case preview the purchase order number

" ---------------------------------------------------------------
ULINE.
" ---------------------------------------------------------------
WRITE: / 'Version 1: Create a new internal table using NEW #'.

TYPES: tt_purchase_order TYPE TABLE OF ty_purchase_order WITH DEFAULT KEY.

DATA: lv_purchase_order TYPE REF TO tt_purchase_order. " define a internal table variable as a reference to the type -> This is required when we use NEW

lv_purchase_order = NEW #(
    ( ebeln = '123456'   lifnr = 'Vendor1'   risk  = 'X' )
    ( ebeln = '123457'   lifnr = 'Vendor2'   risk  = ' ' )
    ( ebeln = '123458'   lifnr = 'Vendor3'   risk  = 'X' )
    ).

 cl_demo_output=>display( lv_purchase_order->* ). " Display the internal table object as a reference

 ULINE.
 WRITE: / 'Version 2: Create a new internal table using NEW without #'.

 DATA(runtime_lv_purchase_order) = NEW tt_purchase_order(
    ( ebeln = '123456'   lifnr = 'Vendor1'   risk  = 'X' )
    ( ebeln = '123457'   lifnr = 'Vendor2'   risk  = ' ' )
    ( ebeln = '123458'   lifnr = 'Vendor3'   risk  = 'X' )
    ).

cl_demo_output=>display( runtime_lv_purchase_order->* ). " Display the internal table object

" ---------------------------------------------------------------
" Loop through two internal tables
" ----------------------------------------------------------------

SELECT  ebeln, " Purchase Order
        ebelp, " Item
        netpr, " Net Price
        CASE
         WHEN netpr > 1000 THEN 'X'
         ELSE ' '
        END AS risk,
        matnr, " Material
        werks " Plant
FROM ekpo INTO TABLE @DATA(lt_item).

SELECT ebeln, " Purchase Order
       lifnr " Vendor
FROM ekko INTO TABLE @DATA(lt_header).

" Populate dynamically a new internal table
DATA(dynamic_table) = NEW tt_purchase_order(
    FOR ls_header IN lt_header
    FOR ls_item IN lt_item WHERE ( ebeln = ls_header-ebeln AND risk = 'X' )
       ( ebeln = ls_header-ebeln lifnr = ls_header-lifnr  risk = ls_item-risk )
).

cl_demo_output=>display( dynamic_table->* ). " Display the internal table object
