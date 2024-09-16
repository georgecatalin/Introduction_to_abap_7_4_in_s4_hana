*&---------------------------------------------------------------------*
*& Report z_adt_ceil_floor
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_ceil_floor.

DATA: lv_discounted TYPE p LENGTH 4 DECIMALS 3 VALUE '0.923'.

SELECT ebeln, " Purchase Order Number
       werks, " Plant
       brtwr, " Net Price
       brtwr * @lv_discounted AS discounted_price,
       CEIL( brtwr * @lv_discounted ) AS ceil_price,
       FLOOR( brtwr * @lv_discounted ) AS floor_price
FROM ekpo INTO TABLE @DATA(lt_ekpo).

IF sy-subrc = 0.

    LOOP AT lt_ekpo ASSIGNING FIELD-SYMBOL(<fs_ekpo>). "
        WRITE: / <fs_ekpo>-ebeln.
        WRITE: / | The price is { <fs_ekpo>-brtwr }, whereas the discounted price is { <fs_ekpo>-discounted_price }, ceil price is { <fs_ekpo>-ceil_price }, floor price is {  <fs_ekpo>-floor_price }|.
    ENDLOOP.
ENDIF.


* NOTES
* -----------------------------------------------------------------------------------------------------------------
* ASSIGNING FIELD-SYMBOL is a powerful construct in ABAP that allows you to work with data efficiently, especially when dealing with internal tables.
* Here's an explanation of its key aspects and usage:
* Purpose
* The main purpose of ASSIGNING FIELD-SYMBOL is to create a reference or pointer to a data object, typically a line in an internal table, without copying the data.
* This can lead to improved performance and more direct data manipulation.
* Syntax
* LOOP AT itab ASSIGNING FIELD-SYMBOL(<fs>).
* // Work with <fs>
* ENDLOOP.

*   Key Points
*           No Data Copying: Unlike using INTO with a work area, ASSIGNING FIELD-SYMBOL doesn't create a copy of the data. It directly references the memory location of the table line.
*           Direct Modification: Changes made to the field symbol directly affect the original data in the table, without needing an explicit MODIFY statement.
*           Performance: It's generally more efficient, especially for large tables or when modifications are needed.
*           Flexibility: Field symbols can be typed or untyped, allowing for more dynamic programming.
