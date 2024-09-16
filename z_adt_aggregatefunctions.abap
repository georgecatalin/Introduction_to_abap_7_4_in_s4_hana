*&---------------------------------------------------------------------*
*& Report z_adt_aggregatefunctions
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_aggregatefunctions.

SELECT ebeln, werks,
      MAX( brtwr ) AS max_price,
      SUM( brtwr ) AS total_price,
      AVG( brtwr ) AS avg_price
      FROM ekpo  GROUP BY ebeln, werks INTO TABLE @DATA(lt_ekpo).

IF sy-subrc = 0.
    LOOP AT lt_ekpo INTO DATA(ls_ekpo).
        WRITE: / | For the Purchase Order: {  ls_ekpo-ebeln }|.
        WRITE: / | Maximum price = { ls_ekpo-max_price }, Total price = { ls_ekpo-total_price }, Average Price = { ls_ekpo-avg_price }|.
    ENDLOOP.
 ENDIF.
