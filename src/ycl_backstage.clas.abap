CLASS ycl_backstage DEFINITION
  PUBLIC
  INHERITING FROM ycl_item_root
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: update REDEFINITION.
    METHODS constructor
      IMPORTING
        i_item TYPE REF TO ycl_item.
  PRIVATE SECTION.
    METHODS abolish_quality.
ENDCLASS.

CLASS ycl_backstage IMPLEMENTATION.

  METHOD constructor.
    super->constructor( ).
    me->mo_item = i_item.
  ENDMETHOD.
  METHOD update.
    increase_quality( ).

    IF is_sellin_under( 11 ).
      increase_quality( ).
    ENDIF.

    IF is_sellin_under( 6 ).
      increase_quality( ).
    ENDIF.

    decrease_sell_in( ).

    IF is_sellin_under( 0 ).
      abolish_quality( ).
    ENDIF.
  ENDMETHOD.
  METHOD abolish_quality.
    mo_item->mv_quality = mo_item->mv_quality - mo_item->mv_quality.
  ENDMETHOD.

ENDCLASS.
