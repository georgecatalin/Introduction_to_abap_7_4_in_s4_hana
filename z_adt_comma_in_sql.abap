*&---------------------------------------------------------------------*
*& Report z_adt_comma_in_sql
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_comma_in_sql.

SELECT mandt, werks, regio, name1 FROM t001w UP TO 10 ROWS INTO TABLE @DATA(lt_t001w).

IF sy-subrc = 0.
  LOOP AT lt_t001w INTO DATA(ls_t001w).
    WRITE: / ls_t001w-mandt, ls_t001w-werks, ls_t001w-regio, ls_t001w-name1.
  ENDLOOP.
ENDIF.
