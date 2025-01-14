CLASS lhc_Movie DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Movie RESULT result.
    METHODS validategenre FOR VALIDATE ON SAVE
      IMPORTING keys FOR movie~validategenre.
    METHODS ratemovie FOR MODIFY
      IMPORTING keys FOR ACTION movie~ratemovie.

ENDCLASS.

CLASS lhc_Movie IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD ValidateGenre.

    "Read Movies
    READ ENTITY IN LOCAL MODE ZI_05_Movie
    FIELDS ( Genre )
    WITH CORRESPONDING #( keys )
    RESULT DATA(movies).

    "Process Movies
    LOOP AT movies INTO DATA(movie).

      "Validate Genre
      SELECT SINGLE FROM ddcds_customer_domain_value_t( p_domain_name = 'ZABAP_GENRE' )
      FIELDS @abap_true AS Exists
      WHERE value_low = @movie-Genre
      INTO @DATA(exists).
      IF exists = abap_false.
        DATA(message) = NEW zcm_05_movie(
        textid   = zcm_05_movie=>invalid_field_value
          severity = if_abap_behv_message=>severity-error
          value    = CONV #( movie-Genre )
         field    = 'Genre'
        ).
        APPEND VALUE #( %tky = movie-%tky
                        %msg = message
                        %element-Genre = if_abap_behv=>mk-on ) TO reported-movie.
        "Create Message and add to failed
        APPEND CORRESPONDING #( movie ) TO failed-movie.


      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD RateMovie.

  LOOP AT keys into data(key).

    MODIFY ENTITY IN LOCAL MODE ZI_05_Movie
      CREATE BY \_Ratings
      FIELDS ( Rating RatingDate UserName )
      with VALUE #( ( %tky =  key-%tky
                    %target = value #( ( %cid = '1'
                                        Rating = key-%param-Rating
                                        RatingDate = sy-datum
                                        UserName = sy-uname ) ) ) ).

      ENDLOOP.

  ENDMETHOD.

ENDCLASS.
