*&---------------------------------------------------------------------*
*& Report z_adt_usingclient
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_usingclient.

* the old way of doing it
SELECT mandt, werks, regio, name1 UP TO 20 ROWS  INTO TABLE @DATA(lt_t001w) FROM t001w CLIENT SPECIFIED WHERE mandt = '110'.

LOOP AT lt_t001w INTO DATA(ls_t001w).
  WRITE: / ls_t001w-mandt, ls_t001w-werks, ls_t001w-regio, ls_t001w-name1.
ENDLOOP.

* the new way of doing it with ABAP 7.4
SELECT mandt, werks, regio, name1 UP TO 20 ROWS INTO TABLE @DATA(lt_t002w) FROM t001w USING CLIENT '110'.

LOOP AT lt_t002w INTO DATA(ls_t002w).
  WRITE: / ls_t002w-mandt, ls_t002w-werks, ls_t002w-regio, ls_t002w-name1.
ENDLOOP.
