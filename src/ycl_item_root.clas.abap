CLASS ycl_item_root DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS update ABSTRACT.
  PROTECTED SECTION.
    METHODS increase_quality.
    METHODS is_sellin_under
      IMPORTING iv_comparing_value TYPE i
      RETURNING VALUE(rv_result)   TYPE boole_d
      .
    METHODS decrease_sell_in.

    DATA mo_item TYPE REF TO ycl_item.
  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_item_root IMPLEMENTATION.

  METHOD decrease_sell_in.
    mo_item->mv_sell_in = mo_item->mv_sell_in - 1.
  ENDMETHOD.

  METHOD is_sellin_under.
    rv_result = xsdbool( mo_item->mv_sell_in < iv_comparing_value ).
  ENDMETHOD.

  METHOD increase_quality.
    IF mo_item->mv_quality < 50.
      mo_item->mv_quality = mo_item->mv_quality + 1.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
