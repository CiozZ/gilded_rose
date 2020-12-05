CLASS ycl_texttest_fixture DEFINITION
  PUBLIC
  FINAL.

  PUBLIC SECTION.
    CLASS-METHODS main.
ENDCLASS.

CLASS ycl_texttest_fixture IMPLEMENTATION.
  METHOD main.
    DATA(lo_out) = cl_demo_output=>new( )->write_text( |OMGHAI!| ).

    DATA(lt_items) = VALUE ycl_gilded_rose=>tt_items(
                        ( NEW #( iv_name    = |+5 Dexterity Vest|
                                 iv_sell_in = 10
                                 iv_quality = 20 ) )
                        ( NEW #( iv_name    = |Aged Brie|
                                 iv_sell_in = 2
                                 iv_quality = 0 ) )
                        ( NEW #( iv_name    = |Elixir of the Mongoose|
                                 iv_sell_in = 5
                                 iv_quality = 7 ) )
                        ( NEW #( iv_name    = |Sulfuras, Hand of Ragnaros|
                                 iv_sell_in = 0
                                 iv_quality = 80 ) )
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 15
                                 iv_quality = 20 ) )
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 10
                                 iv_quality = 49 ) )
                        ( NEW #( iv_name    = |Backstage passes to a TAFKAL80ETC concert|
                                 iv_sell_in = 5
                                 iv_quality = 49 ) )
                        "This conjured item does not work properly yet
                        ( NEW #( iv_name    = |Conjured Mana Cake|
                                 iv_sell_in = 3
                                 iv_quality = 6 ) ) ).

    DATA(lo_app) = NEW ycl_gilded_rose( it_items = lt_items ).

    DATA(lv_days) = 2.
    cl_demo_input=>request( EXPORTING text = |Number of Days?|
                            CHANGING field = lv_days ).

    DO lv_days TIMES.
      lo_out->next_section( |-------- day { sy-index } --------| ).
      lo_out->write_text( |Name, Sell_In, Quality| ).
      LOOP AT lt_items INTO DATA(lo_item).
        lo_out->write_text( lo_item->description( ) ).
      ENDLOOP.
      lo_app->update_quality( ).
    ENDDO.

    lo_out->display( ).

  ENDMETHOD.
ENDCLASS.
