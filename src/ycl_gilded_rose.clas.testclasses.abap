*& Test Code - Currently Broken
CLASS ltc_gilded_rose DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    DATA: mo_cut   TYPE REF TO ycl_gilded_rose,
          mt_items TYPE ycl_gilded_rose=>tt_items.
    METHODS:
      setup,
      "Given: sell-in is positive
      "When : item is common and sell-in remains positive
      "Then : quality decreases by 1
      foo_positive_sellin FOR TESTING,
      "Given: sell-in is negative
      "When : item is common and sell-in goes negative
      "Then : quality decreases twice as fast
      foo_negative_sellin FOR TESTING,
      "Given: sell-in is positive
      "When : item is brie and sell-in remains positive
      "Then : quality increases
      brie_positive_sellin FOR TESTING,
      "Given: sell-in is positive
      "When : item is brie and sell-in goes negative
      "Then : quality increases twice as fast
      brie_negative_sellin FOR TESTING,
      "Given: sell-in is greater than 10
      "When : item is backstage
      "Then : quality increases by 1
      backstage_sellin_gt10 FOR TESTING,
      "Given: sell-in is lower than 10
      "When : item is backstage
      "Then : quality increases by 2
      backstage_sellin_lt10 FOR TESTING,
      "Given: sell-in is lower than 5
      "When : item is backstage
      "Then : quality increases by 3
      backstage_sellin_lt5 FOR TESTING,
      "Given: sell-in is lower than 0
      "When : item is backstage
      "Then : quality drops to 0
      backstage_sellin_lt0 FOR TESTING,
      "Given: sell-in is positive
      "When : item is Sulfuras (Legendary)
      "Then : quality and sell-in remain the same
      sulfuras_positive_sellin FOR TESTING,
      "Given: sell-in should go negative
      "When : item is Sulfuras (Legendary)
      "Then : quality and sell-in remain the same
      sulfuras_negative_sellin FOR TESTING
      .
ENDCLASS.

CLASS ltc_gilded_rose IMPLEMENTATION.

  METHOD setup.
    mt_items = VALUE ycl_gilded_rose=>tt_items( ( NEW #( iv_name    = |foo|
                                                       iv_sell_in = 3
                                                       iv_quality = 6 ) )
                                                ( NEW #( iv_name    = |foo|
                                                         iv_sell_in = 0
                                                         iv_quality = 6 ) )
                                                ( NEW #( iv_name    = |Aged Brie|
                                                         iv_sell_in = 4
                                                         iv_quality = 2 ) )
                                                ( NEW #( iv_name    = |Aged Brie|
                                                         iv_sell_in = 0
                                                         iv_quality = 2 ) )
                                                ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                         iv_sell_in = 15
                                                         iv_quality = 20 ) )
                                                ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                         iv_sell_in = 10
                                                         iv_quality = 20 ) )
                                                ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                         iv_sell_in = 5
                                                         iv_quality = 20 ) )
                                                ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                                         iv_sell_in = 0
                                                         iv_quality = 20 ) )
                                                ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                                         iv_sell_in = 3
                                                         iv_quality = 80 ) )
                                                ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                                         iv_sell_in = 0
                                                         iv_quality = 80 ) )
                                                        ).

    mo_cut = NEW ycl_gilded_rose( it_items = mt_items ).
  ENDMETHOD.

  METHOD foo_positive_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 1 ] )->description( )
                   exp = |foo, 2, 5| ).
  ENDMETHOD.

  METHOD foo_negative_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 2 ] )->description( )
                   exp = |foo, -1, 4| ).
  ENDMETHOD.

  METHOD brie_positive_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 3 ] )->description( )
                   exp = |Aged Brie, 3, 3| ).
  ENDMETHOD.

  METHOD brie_negative_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 4 ] )->description( )
                   exp = |Aged Brie, -1, 4| ).
  ENDMETHOD.

  METHOD backstage_sellin_gt10.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 5 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, 14, 21| ).
  ENDMETHOD.

  METHOD backstage_sellin_lt10.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 6 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, 9, 22| ).
  ENDMETHOD.

  METHOD backstage_sellin_lt5.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 7 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, 4, 23| ).
  ENDMETHOD.

  METHOD backstage_sellin_lt0.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 8 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, -1, 0| ).
  ENDMETHOD.

  METHOD sulfuras_positive_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 9 ] )->description( )
                   exp = |Sulfuras, Hand of Ragnaros, 3, 80| ).
  ENDMETHOD.

  METHOD sulfuras_negative_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 10 ] )->description( )
                   exp = |Sulfuras, Hand of Ragnaros, 0, 80| ).
  ENDMETHOD.

ENDCLASS.
