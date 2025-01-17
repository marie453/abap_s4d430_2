@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight'

define view entity ZR_06_Flight as select from /dmo/flight
{ key carrier_id as CarrierId,
  key connection_id as ConnectionId,
  key flight_date as FlightDate,
  price as Price,
  currency_code as CurrencyCode,
  plane_type_id as PlaneTypeId,
  seats_max as SeatsMax,
  seats_occupied as SeatsOccupied
  
}
