
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'


@Metadata.allowExtensions: true
define view entity ZC_06_Booking as projection on ZI_06_Booking

{
 key TravelId,
 key BookingId,
 BookingDate,
 CustomerId,
 CarrierId,
 ConnectionId,
 FlightDate,
 FlightPrice,
 CurrencyCode,
 BookingStatus,
 LastChangedAt,
 
 
 /* Associations */
 _Flight: redirected to parent ZC_06_Flight
}
