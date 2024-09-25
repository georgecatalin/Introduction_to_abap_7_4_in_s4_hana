*&---------------------------------------------------------------------*
*& Report z_adt_new_in_oop
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_adt_new_in_oop.

CLASS lcl_class DEFINITION.
  PUBLIC SECTION.
    DATA: lv_name  TYPE char50 VALUE 'Introduction to ABAP in Eclipse',
          lv_class TYPE char50 VALUE 'This is a class'.
    METHODS show_name.
    METHODS: show_class.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS lcl_class IMPLEMENTATION.

  METHOD show_name.
    WRITE: / 'This is the show_name method.'.
    WRITE: / lv_name.
  ENDMETHOD.

  METHOD show_class.
    WRITE: / 'This is the show_class method.'.
    WRITE: / lv_class.
  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.

" Old fashion of instantiating a class
DATA: myobject TYPE REF TO lcl_class.
CREATE OBJECT myobject.
CALL METHOD myobject->show_name.
myobject->show_name( ).


" New fashion of instantiating a class without #
DATA(myobject1) = NEW lcl_class( ).
CALL METHOD myobject1->show_class.
myobject1->show_class( ).

" New fashion of instantiating a class with #
DATA: myobject2 TYPE REF TO lcl_class.
myobject2 = NEW #(  ).
CALL METHOD myobject2->show_name.
myobject2->show_name(  ).

" New fashion of instantiating a class temporarily creating the object
NEW lcl_class(  )->show_name(  ).
NEW lcl_class(  )->show_class(  ).
