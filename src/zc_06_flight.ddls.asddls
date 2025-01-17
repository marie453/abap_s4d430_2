@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'

@Metadata.allowExtensions: true
define root view entity ZC_06_Flight
  provider contract transactional_query as projection on ZI_06_Flight
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  Price,
  CurrencyCode,
  PlaneTypeId,
  SeatsMax,
  SeatsOccupied,
  Seatutilization,
  _Bookings:redirected to composition child ZC_06_Booking
 
}
where FlightDate> $session.system_date

