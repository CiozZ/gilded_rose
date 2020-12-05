CLASS ycl_item_shop DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    CLASS-METHODS create_item
      IMPORTING io_item        TYPE REF TO ycl_item
      RETURNING VALUE(ro_item) TYPE REF TO ycl_item_root.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS ycl_item_shop IMPLEMENTATION.
  METHOD create_item.
    ro_item = COND #( WHEN io_item->mv_name = |Aged Brie| THEN NEW ycl_aged_brie( io_item )
                      WHEN io_item->mv_name = |Backstage passes to a TAFKAL80ETC concert| THEN NEW ycl_backstage( io_item )
                      WHEN io_item->mv_name = |Sulfuras, Hand of Ragnaros|  THEN NEW ycl_sulfuras( io_item )
                      ELSE NEW ycl_common_item( io_item )
      ).
  ENDMETHOD.
ENDCLASS.
