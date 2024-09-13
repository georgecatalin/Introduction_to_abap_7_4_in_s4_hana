*&---------------------------------------------------------------------*
*& Report z_adt_inlinedeclaration
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_inlinedeclaration.

* version using old version of inline declaration
WRITE:/ 'Old version of inline declaration'.
ULINE.
DATA: lv_mara TYPE STANDARD TABLE of mara.
DATA: wa_mara TYPE mara.

SELECT * FROM mara INTO TABLE lv_mara UP TO 10 ROWS.

LOOP AT lv_mara INTO wa_mara.
  WRITE: / wa_mara-matnr, wa_mara-mtart, wa_mara-mbrsh.
ENDLOOP.

SKIP.
SKIP.
ULINE.

WRITE:/ 'New version of inline declaration'.

SELECT * FROM mara INTO TABLE @DATA(lv_mara_inline) UP TO 10 ROWS.

LOOP AT lv_mara_inline INTO DATA(wa_mara_inline).
  WRITE: / wa_mara_inline-matnr, wa_mara_inline-mtart, wa_mara_inline-mbrsh.
ENDLOOP.
