CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Booking RESULT result.

    METHODS CancelBooking FOR MODIFY
      IMPORTING keys FOR ACTION Booking~CancelBooking RESULT result.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


  METHOD CancelBooking.


    " Read Travels
    READ ENTITY IN LOCAL MODE ZI_06_Booking
         ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(bookings).

    " Process Travels
    LOOP AT bookings REFERENCE INTO DATA(booking).
      " Validate Status and Create Error Message
       booking->BookingStatus = 'X'.

    ENDLOOP.

    " Modify Booking
    MODIFY ENTITY IN LOCAL MODE ZI_06_Booking
           UPDATE FIELDS ( BookingStatus )
           WITH VALUE #( FOR t IN bookings
                         ( %tky = t-%tky BookingStatus = t-BookingStatus ) ).

    " Set Result
    result = VALUE #( FOR t IN bookings
     ( %tky   = t-%tky
                        %param = t ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZI_06_Flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_06_Flight RESULT result.

ENDCLASS.

CLASS lhc_ZI_06_Flight IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
