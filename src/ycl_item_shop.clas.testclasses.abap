*"* use this source file for your ABAP unit test classes
CLASS ltc_items_shop DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      checks_root_instance     FOR TESTING,
      checks_subcl_aged_brie   FOR TESTING,
      checks_subcl_backstage   FOR TESTING,
      checks_subcl_sulfuras    FOR TESTING,
      checks_subcl_common      FOR TESTING,
      checks_conjured_item     FOR TESTING
      .
ENDCLASS.


CLASS ltc_items_shop IMPLEMENTATION.

  METHOD checks_root_instance.
    "Arrange
    DATA(mo_aged_brie) = NEW ycl_item( iv_name = 'Aged Brie' iv_quality = 1 iv_sell_in = 1 ).
    "Act
    DATA(lv_result) = xsdbool( ycl_item_shop=>create_item( mo_aged_brie ) IS INSTANCE OF ycl_item_root ).
    "Assert
    cl_abap_unit_assert=>assert_true( act = lv_result ).
  ENDMETHOD.

  METHOD checks_subcl_aged_brie  .
    "Arrange
    DATA(mo_aged_brie) = NEW ycl_item( iv_name = 'Aged Brie' iv_quality = 1 iv_sell_in = 1 ).
    "Act
    DATA(lv_result) = xsdbool( ycl_item_shop=>create_item( mo_aged_brie ) IS INSTANCE OF ycl_aged_brie ).
    "Assert
    cl_abap_unit_assert=>assert_true( act = lv_result ).
  ENDMETHOD.

  METHOD checks_subcl_backstage.
    "Arrange
    DATA(mo_aged_brie) = NEW ycl_item( iv_name = 'Backstage passes to a TAFKAL80ETC concert' iv_quality = 1 iv_sell_in = 1 ).
    "Act
    DATA(lv_result) = xsdbool( ycl_item_shop=>create_item( mo_aged_brie ) IS INSTANCE OF ycl_backstage ).
    "Assert
    cl_abap_unit_assert=>assert_true( act = lv_result ).
  ENDMETHOD.

  METHOD checks_subcl_sulfuras.
    "Arrange
    DATA(mo_aged_brie) = NEW ycl_item( iv_name = 'Sulfuras, Hand of Ragnaros' iv_quality = 1 iv_sell_in = 1 ).
    "Act
    DATA(lv_result) = xsdbool( ycl_item_shop=>create_item( mo_aged_brie ) IS INSTANCE OF ycl_sulfuras ).
    "Assert
    cl_abap_unit_assert=>assert_true( act = lv_result ).
  ENDMETHOD.

  METHOD checks_subcl_common.
    "Arrange
    DATA(mo_aged_brie) = NEW ycl_item( iv_name = 'Common Item' iv_quality = 1 iv_sell_in = 1 ).
    "Act
    DATA(lv_result) = xsdbool( ycl_item_shop=>create_item( mo_aged_brie ) IS INSTANCE OF ycl_common_item ).
    "Assert
    cl_abap_unit_assert=>assert_true( act = lv_result ).
  ENDMETHOD.

  METHOD checks_conjured_item.
    "Arrange
    DATA(mo_aged_brie) = NEW ycl_item( iv_name = 'Conjured Cake' iv_quality = 1 iv_sell_in = 1 ).
    "Act
    DATA(lv_result) = xsdbool( ycl_item_shop=>create_item( mo_aged_brie ) IS INSTANCE OF ycl_conjured_cake ).
    "Assert
    cl_abap_unit_assert=>assert_true( act = lv_result ).
  ENDMETHOD.

ENDCLASS.
