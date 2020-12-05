CLASS ycl_conjured_cake DEFINITION
  PUBLIC
  INHERITING FROM ycl_item_root
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: update REDEFINITION.
    METHODS constructor
      IMPORTING
        i_item TYPE REF TO ycl_item.

  PROTECTED SECTION.
    METHODS decrease_quality REDEFINITION.

  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_conjured_cake IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).

    me->mo_item = i_item.

  ENDMETHOD.
  METHOD update.
    decrease_quality( ).

    decrease_sell_in( ).

    IF is_sellin_under( 0 ).
      decrease_quality( ).
    ENDIF.
  ENDMETHOD.
  METHOD decrease_quality.
    mo_item->mv_quality = COND #( WHEN mo_item->mv_quality GT 2 THEN mo_item->mv_quality - 2 ELSE 0 ).
  ENDMETHOD.
ENDCLASS.
