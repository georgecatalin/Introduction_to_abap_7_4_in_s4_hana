*&---------------------------------------------------------------------*
*& Report z_adt_arithmetic_ops
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_arithmetic_ops.

DATA: lv_discounted TYPE p LENGTH 2 DECIMALS 2 VALUE '0.9'.

SELECT ebeln, " Purchase Order Number
       werks, " Plant
       brtwr, " Net Price
       brtwr * @lv_discounted AS discounted_price
FROM ekpo INTO TABLE @DATA(lt_ekpo).

IF sy-subrc = 0.

    LOOP AT lt_ekpo ASSIGNING FIELD-SYMBOL(<fs_ekpo>). "
        WRITE: / <fs_ekpo>-ebeln.
        WRITE: / | The price is { <fs_ekpo>-brtwr }, whereas the discounted price is { <fs_ekpo>-discounted_price }|.
    ENDLOOP.
ENDIF.
