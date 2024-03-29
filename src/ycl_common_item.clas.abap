CLASS ycl_common_item DEFINITION
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

ENDCLASS.

CLASS ycl_common_item IMPLEMENTATION.

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



ENDCLASS.
