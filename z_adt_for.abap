*&---------------------------------------------------------------------*
*& Report z_adt_for
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_for.

*----------------------------------------------------------------------*
* Example for a simple FOR statement
*----------------------------------------------------------------------*

DATA: my_word TYPE c LENGTH 20 VALUE 'Hello World',
      lv_table TYPE STANDARD TABLE OF c1.

DATA(string_length) = STRLEN( my_word ).

lv_table = VALUE #(
    FOR i = 0 UNTIL i >= string_length
    ( my_word+i(1) ) " Extract one character at a time from the string and append it to the table 
    ).

LOOP AT lv_table INTO DATA(ls_table).
  WRITE: / | At row number { sy-tabix } we have { ls_table }|.
ENDLOOP.
