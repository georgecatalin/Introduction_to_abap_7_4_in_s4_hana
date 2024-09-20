*&---------------------------------------------------------------------*
*& Report z_adt_coalesce
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_coalesce.

* USE EXPLANATION: this report is a simple example of using the COALESCE function in ABAP
* to replace a series of IF statements.  The COALESCE function returns the first non-null value in a list of expressions.  This can be useful when you have a series of IF statements
* that are all checking the same field for different values and returning different values based on those values.  The COALESCE function can replace all of those IF statements in a single line of code.
* The COALESCE function is available in ABAP 7.40 and later.
* *************************************************************************************************************************************************************************************************

SELECT p~werks, v~bwkey, COALESCE( p~werks, v~bwkey ) AS coalesce_field
  FROM t001w AS p
  LEFT OUTER JOIN t001k AS v ON p~werks = v~bwkey
  INTO TABLE @DATA(lt_data).

LOOP AT lt_data INTO DATA(ls_data).
   WRITE: / | Plant is {  ls_data-werks }, Valuation is { ls_data-bwkey }, Coalesce is { ls_data-coalesce_field }|.
ENDLOOP.
