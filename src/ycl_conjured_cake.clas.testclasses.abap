CLASS ltc_common_item DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    DATA: mo_cut   TYPE REF TO ycl_gilded_rose,
          mt_items TYPE ycl_gilded_rose=>tt_items.
    METHODS:
      setup,
      "Given: sell-in is positive
      "When : item is conjured and sell-in remains positive
      "Then : quality decreases by 2
      conjured_positive_sellin FOR TESTING,
      "Given: sell-in is negative
      "When : item is conjured and sell-in goes negative
      "Then : quality decreases twice as fast
      conjured_negative_sellin FOR TESTING,
      "Given: sell-in is negative
      "When : item is conjured and sell-in goes negative, but quality goes never negative
      "Then : quality decreases twice as fast
      conj_no_negative_quality FOR TESTING.

ENDCLASS.

CLASS ltc_common_item IMPLEMENTATION.

  METHOD setup.
    mt_items = VALUE ycl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Conjured Cake|
                                                       iv_sell_in = 3
                                                       iv_quality = 6 ) )
                                                ( NEW #( iv_name    = |Conjured Cake|
                                                         iv_sell_in = 0
                                                         iv_quality = 6 ) )
                                                ( NEW #( iv_name    = |Conjured Cake|
                                                         iv_sell_in = 0
                                                         iv_quality = 1 ) )
                                                        ).

    mo_cut = NEW ycl_gilded_rose( it_items = mt_items ).
  ENDMETHOD.

  METHOD conjured_positive_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 1 ] )->description( )
                   exp = |Conjured Cake, 2, 4| ).
  ENDMETHOD.

  METHOD conjured_negative_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 2 ] )->description( )
                   exp = |Conjured Cake, -1, 2| ).
  ENDMETHOD.

  METHOD conj_no_negative_quality.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 3 ] )->description( )
                   exp = |Conjured Cake, -1, 0| ).
  ENDMETHOD.

ENDCLASS.
