*&---------------------------------------------------------------------*
*& Report z_adt_rightouterjoin
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_rightouterjoin.

SELECT p~werks, " Plant
       v~bwkey  " Valuation Area
       FROM t001k AS v RIGHT OUTER JOIN t001w AS p ON v~bwkey = p~werks
       INTO TABLE @DATA(lt_valuation).

IF sy-subrc = 0.
LOOP AT lt_valuation INTO DATA(ls_valuation).
  WRITE: / ls_valuation-werks, ls_valuation-bwkey.
 ENDLOOP.
 WRITE: | The number of lines in the internal table is { lines( lt_valuation ) }|.

 cl_demo_output=>display( lt_valuation ).
 ENDIF.
