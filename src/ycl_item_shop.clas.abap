CLASS ycl_item_shop DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    CONSTANTS:
      BEGIN OF mc_items,
        aged_brie TYPE string VALUE 'Aged Brie',
        backstage TYPE string VALUE 'Backstage passes to a TAFKAL80ETC concert',
        sulfuras  TYPE string VALUE 'Sulfuras, Hand of Ragnaros',
        conjured  TYPE string VALUE 'Conjured Cake',
      END OF mc_items.

    CLASS-METHODS create_item
      IMPORTING io_item        TYPE REF TO ycl_item
      RETURNING VALUE(ro_item) TYPE REF TO ycl_item_root.
ENDCLASS.

CLASS ycl_item_shop IMPLEMENTATION.
  METHOD create_item.
    ro_item = COND #( WHEN io_item->mv_name = mc_items-aged_brie THEN NEW ycl_aged_brie( io_item )
                      WHEN io_item->mv_name = mc_items-backstage THEN NEW ycl_backstage( io_item )
                      WHEN io_item->mv_name = mc_items-sulfuras  THEN NEW ycl_sulfuras( io_item )
                      WHEN io_item->mv_name = mc_items-conjured  THEN NEW ycl_conjured_cake( io_item )
                      ELSE NEW ycl_common_item( io_item )
      ).
  ENDMETHOD.
ENDCLASS.
