*&---------------------------------------------------------------------*
*& Report z_adt_movecorresponding
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_movecorresponding.

TYPES: BEGIN OF ty_purchase_order,
         ebeln TYPE ebeln,
         lifnr TYPE lifnr,
         risk TYPE flag,
       END OF ty_purchase_order.

DATA: lv_purchase_order TYPE STANDARD TABLE OF ty_purchase_order.

SELECT
       ebeln, " Purchase Order Number
       ebelp, " Item Number
       netpr, " Net Price
       CASE
        WHEN netpr > 1000 THEN 'X'
        ELSE ' '
       END AS risk
       FROM ekpo INTO TABLE @DATA(lt_purchase_order_item).

 SELECT
        ebeln, " Purchase Order Number
        lifnr " Vendor Number
 FROM ekko INTO TABLE @DATA(lt_purchase_order_header).

" MOVE-CORRESPONDING lt_purchase_order_item TO lv_purchase_order. " Move Corresponding Fields from Internal Table to Internal Table
" MOVE-CORRESPONDING lt_purchase_order_header TO lv_purchase_order. " Move Corresponding Fields from Internal Table to Internal Table

" How to fill in the lv_purchase_order table with the data from lt_purchase_order_item and lt_purchase_order_header tables using MOVE-CORRESPONDING
" -----------------------------------------------------------------------
" version 1 with VALUE #( )
" -----------------------------------------------------------------------
*
*lv_purchase_order = VALUE #(
*    FOR ls_header IN lt_purchase_order_header
*    FOR ls_item IN lt_purchase_order_item WHERE ( ebeln = ls_header-ebeln )
*    ( ebeln = ls_header-ebeln   lifnr = ls_header-lifnr risk = ls_item-risk )
*).
*  cl_demo_output=>display(  lv_purchase_order ).

" -----------------------------------------------------------------------
" version 2 without VALUE #( )
" -----------------------------------------------------------------------
TYPES: tt_purchase_order TYPE STANDARD TABLE OF ty_purchase_order WITH DEFAULT KEY.
DATA(runtime_table) = VALUE tt_purchase_order(
    FOR ls_header IN lt_purchase_order_header
    FOR ls_item IN lt_purchase_order_item WHERE ( ebeln = ls_header-ebeln )
    ( ebeln = ls_header-ebeln   lifnr = ls_header-lifnr risk = ls_item-risk )
).

cl_demo_output=>display(  runtime_table ).
 cl_demo_output=>display(  lv_purchase_order ).
