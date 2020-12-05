CLASS ltc_backstage DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    DATA: mo_cut   TYPE REF TO ycl_gilded_rose,
          mt_items TYPE ycl_gilded_rose=>tt_items.
    METHODS:
      setup,
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
      backstage_sellin_lt0 FOR TESTING.
ENDCLASS.

CLASS ltc_backstage IMPLEMENTATION.

  METHOD setup.
    mt_items = VALUE ycl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
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
                                                        ).

    mo_cut = NEW ycl_gilded_rose( it_items = mt_items ).
  ENDMETHOD.

  METHOD backstage_sellin_gt10.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 1 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, 14, 21| ).
  ENDMETHOD.

  METHOD backstage_sellin_lt10.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 2 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, 9, 22| ).
  ENDMETHOD.

  METHOD backstage_sellin_lt5.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 3 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, 4, 23| ).
  ENDMETHOD.

  METHOD backstage_sellin_lt0.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 4 ] )->description( )
                   exp = |Backstage passes to a TAFKAL80ETC concert, -1, 0| ).
  ENDMETHOD.





ENDCLASS.
