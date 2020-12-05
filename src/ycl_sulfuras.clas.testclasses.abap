CLASS ltc_gilded_rose DEFINITION FINAL FOR TESTING RISK LEVEL HARMLESS.
  PRIVATE SECTION.
    DATA: mo_cut   TYPE REF TO ycl_gilded_rose,
          mt_items TYPE ycl_gilded_rose=>tt_items.
    METHODS:
      setup,
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
    mt_items = VALUE ycl_gilded_rose=>tt_items( ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                                         iv_sell_in = 3
                                                         iv_quality = 80 ) )
                                                ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                                         iv_sell_in = 0
                                                         iv_quality = 80 ) )
                                                        ).

    mo_cut = NEW ycl_gilded_rose( it_items = mt_items ).
  ENDMETHOD.

  METHOD sulfuras_positive_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 1 ] )->description( )
                   exp = |Sulfuras, Hand of Ragnaros, 3, 80| ).
  ENDMETHOD.

  METHOD sulfuras_negative_sellin.
    mo_cut->update_quality( ).
    cl_abap_unit_assert=>assert_equals(
                   act = CAST ycl_item( mt_items[ 2 ] )->description( )
                   exp = |Sulfuras, Hand of Ragnaros, 0, 80| ).
  ENDMETHOD.

ENDCLASS.
