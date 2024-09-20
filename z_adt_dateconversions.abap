*&---------------------------------------------------------------------*
*& Report z_adt_date
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_date.


DATA p_date TYPE sy-datum VALUE '20240920'.

WRITE: / | The original date format is { p_date }|.
WRITE:/ | The ISO date format is { p_date DATE = ISO }|. "YYYYMMDD
WRITE:/ | The USER date format is { p_date DATE = USER }|. "DD/MM/YYYY depending on the user settings
