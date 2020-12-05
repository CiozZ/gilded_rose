CLASS ycl_aged_brie DEFINITION
  PUBLIC
 INHERITING FROM ycl_item_root
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_item TYPE REF TO ycl_item.

    METHODS update REDEFINITION.

ENDCLASS.

CLASS ycl_aged_brie IMPLEMENTATION.

  METHOD constructor.
    super->constructor( ).
    me->mo_item = i_item.
  ENDMETHOD.

  METHOD update.
    increase_quality( ).

    decrease_sell_in( ).

    IF is_sellin_under( 0 ).
      increase_quality( ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
