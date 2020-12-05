CLASS ycl_gilded_rose DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:
      tt_items TYPE STANDARD TABLE OF REF TO ycl_item WITH EMPTY KEY.
    METHODS:
      constructor
        IMPORTING it_items TYPE tt_items,
      update_quality.

  PRIVATE SECTION.
    DATA:
      mt_items TYPE tt_items.
ENDCLASS.

CLASS ycl_gilded_rose IMPLEMENTATION.

  METHOD constructor.
    mt_items = it_items.
  ENDMETHOD.

  METHOD update_quality.
    LOOP AT mt_items INTO DATA(lo_item).
      ycl_item_shop=>create_item( lo_item )->update( ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
