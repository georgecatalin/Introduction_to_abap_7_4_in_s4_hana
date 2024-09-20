*&---------------------------------------------------------------------*
*& Report z_adt_boolc
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_boolc.

SELECT p~ebeln, "
       p~ebelp, "
       p~matnr, "
       p~werks, "
       p~menge, "
       p~brtwr, "
       plant~name1, "
       plant~regio, "
       plant~land1 "
FROM ekpo AS p INNER JOIN t001w AS plant ON p~werks = plant~werks
INTO TABLE @DATA(lt_ekpo).

IF sy-subrc = 0.
  LOOP AT lt_ekpo INTO DATA(ls_ekpo).
    IF boolc( ls_ekpo-brtwr > 5000 AND ls_ekpo-regio = 'TX' ) = ABAP_TRUE.
      WRITE: / |The Purchase Order { ls_ekpo-ebeln } is very risky|.
    ELSEIF boolc( ls_ekpo-brtwr > 1000 AND ls_ekpo-regio = 'TX') = ABAP_TRUE.
      WRITE: / |The Purchase Order { ls_ekpo-ebeln } is sensitive|.
    ELSE.
      WRITE: / |The Purchase Order { ls_ekpo-ebeln } is safe|.
    ENDIF.
  ENDLOOP.

cl_demo_output=>display( ).

ENDIF.
