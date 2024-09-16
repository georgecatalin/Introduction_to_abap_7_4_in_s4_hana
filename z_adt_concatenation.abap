*&---------------------------------------------------------------------*
*& Report z_adt_concatenation
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_concatenation.

SELECT mandt, werks, regio, name1 UP TO 10 ROWS FROM t001w INTO TABLE @DATA(lt_t001w).

* Concatenate fields using the CONCATENATE statement ( Old way ABAP )
LOOP AT lt_t001w INTO DATA(ls_t001w).
  CONCATENATE ls_t001w-mandt ls_t001w-werks '->' ls_t001w-regio INTO ls_t001w-name1.
  WRITE: / ls_t001w-name1.
ENDLOOP.

* Concatenate fields using the CONCATENATE operator ( New way ABAP )
LOOP AT lt_t001w INTO DATA(ls_t002w).
    WRITE: / | { ls_t002w-mandt } {  ls_t002w-name1 } -> { ls_t002w-regio }|.
    WRITE: / | This is the loop number | && | { sy-tabix }|.
    WRITE: / | This is the loop number  { sy-tabix }|.


ENDLOOP.
