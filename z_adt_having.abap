*&---------------------------------------------------------------------*
*& Report z_adt_having
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_having.

TABLES: ekpo. " Purchasing Document Item

SELECT-OPTIONS p_ebeln FOR ekpo-ebeln. " Purchasing Document Number

SELECT ebeln, werks, " Purchasing Document Number, Plant
       MAX( netpr ) AS max_price, " Maximum Price
       SUM( brtwr ) AS total_price, " total Price
       AVG( brtwr ) AS avg_price " Average Price
    FROM ekpo GROUP BY ebeln, werks
    HAVING ( ebeln IN @p_ebeln ) INTO TABLE @DATA(lt_ekpo).

IF sy-subrc = 0.

    LOOP AT lt_ekpo INTO DATA(ls_ekpo). " Loop at the internal table
        WRITE: / | For the following purchase order  { ls_ekpo-ebeln } |.
        WRITE: / | The maximum price is { ls_ekpo-max_price }, the total price is { ls_ekpo-total_price } , the average price is { ls_ekpo-avg_price }  |.
    ENDLOOP.
ENDIF.
