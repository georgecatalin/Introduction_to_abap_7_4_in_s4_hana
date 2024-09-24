*&---------------------------------------------------------------------*
*& Report z_adt_use_table_operators
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_use_table_operators.

TYPES: BEGIN OF ty_purchase_order,
        ebeln TYPE ebeln,
        lifnr TYPE lifnr,
        netwr TYPE netwr,
        risk TYPE flag,
       END OF ty_purchase_order.

SELECT  ebeln, "    Purchase Order Number
        ebelp, "    Item Number
        netwr, "    Net Price
        CASE
            WHEN netwr > 1000 THEN 'X'
          ELSE ' '
        END AS risk,    "   Risk Flag
        matnr, "   Material Number
        werks "     Plant
FROM ekpo INTO TABLE @DATA(lt_purchase_order).

" -----------------------------------------
" Use of the table operators
" -----------------------------------------

" Get the index of a particular line of a table
DATA(lv_index) = line_index( lt_purchase_order[ ebeln = '4500000001' ] ).
WRITE: / 'Index of Purchase Order 4500000001:', lv_index.

" Check table for a particular entry
IF line_exists( lt_purchase_order[ risk = 'X' ] ).
    WRITE: / 'Risk found'.
ENDIF.

" Read a particular line of a table
DATA(ls_purchase_order_line) =  lt_purchase_order[ risk = 'X' ].
WRITE: / ls_purchase_order_line-ebeln, ls_purchase_order_line-ebelp, ls_purchase_order_line-netwr.

" Loop into an internal table
DO lines( lt_purchase_order ) TIMES.
DATA(ls_purchase_order) = lt_purchase_order[ sy-index ].
WRITE: / | this purchase order line is -> { ls_purchase_order-ebeln } , { ls_purchase_order-ebelp } , { ls_purchase_order-matnr }|.
ENDDO.

" Read the contents of an internal table using another internal table
DATA: lv_purchase_order TYPE STANDARD TABLE OF ty_purchase_order,
      wa_purchase_order TYPE ty_purchase_order.

SELECT ebeln, "    Purchase Order Number
       lifnr "    Vendor Number
FROM ekko INTO TABLE @DATA(lt_purchase_order_header).

LOOP AT lt_purchase_order_header INTO DATA(ls_purchase_order_header).

   wa_purchase_order-ebeln = ls_purchase_order_header-ebeln.
   wa_purchase_order-lifnr = ls_purchase_order_header-lifnr.

   TRY.

   wa_purchase_order-netwr = lt_purchase_order[ ebeln = ls_purchase_order_header-ebeln ]-netwr.
   wa_purchase_order-risk = lt_purchase_order[ ebeln = ls_purchase_order_header-ebeln ]-risk.

   CATCH cx_sy_itab_line_not_found.
   ENDTRY.

   APPEND wa_purchase_order TO lv_purchase_order.

ENDLOOP.

cl_demo_output=>display( lv_purchase_order ).
