
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'

define root view entity ZI_06_Flight as select from ZR_06_Flight
composition [0..*] of ZI_06_Booking as _Bookings
{
  key CarrierId,
  key ConnectionId,
  key FlightDate,
  Price,
  CurrencyCode,
  PlaneTypeId,
  SeatsMax,
  SeatsOccupied,
  @EndUserText.label: 'Seatutilization'
  @EndUserText.quickInfo: 'Seatutilization'
  cast(100 * (SeatsOccupied / SeatsMax) as abap.dec(16,2)) as Seatutilization,
  _Bookings
}
