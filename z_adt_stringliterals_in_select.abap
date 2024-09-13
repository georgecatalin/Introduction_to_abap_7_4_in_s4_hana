*&---------------------------------------------------------------------*
*& Report z_adt_stringliterals_in_select
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_stringliterals_in_select.

TABLES: t001w.

SELECT-OPTIONS: s_werks FOR t001w-werks.

SELECT SINGLE 'This is a valid plant' FROM t001w WHERE werks in @s_werks INTO @DATA(lv_result).


* ------------------------------------------------------------------------------------------------------------------------------------
* Note: In modern ABAP (starting with ABAP 7.40 and beyond), the @ symbol is used for escaping host variables in Open SQL statements.
* This is required when you use variables, parameters, or expressions in SQL queries to differentiate them from field names or constants.
* ------------------------------------------------------------------------------------------------------------------------------------

IF sy-subrc <> 0.
  WRITE: 'No valid plants'.
ELSE.
  WRITE: lv_result.
ENDIF.
