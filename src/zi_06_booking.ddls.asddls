
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'

define view entity ZI_06_Booking as select from ZR_06_Booking
association to parent ZI_06_Flight as _Flight on $projection.CarrierId = _Flight.CarrierId 
and $projection.ConnectionId = _Flight.ConnectionId 
and $projection.FlightDate = _Flight.FlightDate
{
 
  key ZR_06_Booking.TravelId,
  key ZR_06_Booking.BookingId,
  ZR_06_Booking.BookingDate,
  ZR_06_Booking.CustomerId,
  ZR_06_Booking.CarrierId,
  ZR_06_Booking.ConnectionId,
  ZR_06_Booking.FlightDate,
  ZR_06_Booking.FlightPrice,
  ZR_06_Booking.CurrencyCode,
  ZR_06_Booking.BookingStatus,
  ZR_06_Booking.LastChangedAt,
  _Flight
}
