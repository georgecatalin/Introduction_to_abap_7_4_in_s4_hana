*&---------------------------------------------------------------------*
*& Report Z_MY_FIRST_ALVLIST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_my_first_alvlist.

SELECT *  FROM sflights INTO TABLE @DATA(myflights).

" set the title of the list
DATA(title) = | Number of flights= { lines( myflights ) }|.

"$. START REGION. Write ALV List
cl_salv_table=>factory(
  IMPORTING r_salv_table = DATA(alv_list)
  CHANGING t_table = myflights
).


" display the standard toolbar associated with the ALV List
alv_list->get_functions( )->set_all( ).

" set the width of the columns to autosize as per their width
alv_list->get_columns( )->set_optimize( ).

" set the position of the header on top of the ALV list
alv_list->get_display_settings( )->set_list_header( CONV lvc_title( title ) ).

" display the list
alv_list->display( ).


"$. END REGION.
