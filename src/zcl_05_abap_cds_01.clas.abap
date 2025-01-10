CLASS zcl_05_abap_cds_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_05_abap_cds_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM /DMO/C_Booking_Approver_M
    FIELDS *
    WHERE CarrierID = ' LH ' AND ConnectionID = '0400'
    INTO TABLE @DATA(flights).

    out->write( flights ).



  ENDMETHOD.
ENDCLASS.
