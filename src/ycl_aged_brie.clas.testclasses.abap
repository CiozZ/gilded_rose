CLASS ltc_aged_grie DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    DATA: mo_cut   TYPE REF TO ycl_gilded_rose,
          mt_items TYPE ycl_gilded_rose=>tt_items.
    METHODS:
      setup,
      "Given: sell-in is positive
      "When : item is brie and sell-in remains positive
      "Then : quality increases
      brie_positive_sellin FOR TESTING,
      "Given: sell-in is positive
      "When : item is brie and sell-in goes negative
      "Then : quality increases twice as fast
      brie_negative_sellin FOR TESTING.
ENDCLASS.

CLASS ltc_aged_grie IMPLEMENTATION.

  METHOD setup.
    mt_items = VALUE ycl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Aged Brie|
                                                         iv_sell_in = 4
                                                         iv_quality = 2 ) )
                                                ( NEW #( iv_name    = |Aged Brie|
                                                         iv_sell_in = 0
                                                         iv_quality = 2 ) )
                                                        ).

    mo_cut = NEW ycl_gilded_rose( it_items = mt_items ).
  ENDMETHOD.

  METHOD brie_positive_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 1 ] )->description( )
                   exp = |Aged Brie, 3, 3| ).
  ENDMETHOD.

  METHOD brie_negative_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 2 ] )->description( )
                   exp = |Aged Brie, -1, 4| ).
  ENDMETHOD.













ENDCLASS.
