CLASS ycl_sulfuras DEFINITION
  PUBLIC
  INHERITING FROM ycl_item_root
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: update REDEFINITION.
    METHODS constructor
      IMPORTING
        i_item TYPE REF TO ycl_item.
ENDCLASS.

CLASS ycl_sulfuras IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    me->mo_item = i_item.
  ENDMETHOD.

  METHOD update.

  ENDMETHOD.
ENDCLASS.
