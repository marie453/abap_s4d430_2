@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '05 Travel'


define view entity ZI_05_Travel as select from /dmo/travel
{
  key travel_id as TravelId,
  agency_id as AgencyId,
  customer_id as CustomerId,
  begin_date as BeginDate,
  end_date as EndDate,
  booking_fee as BookingFee,
  total_price as TotalPrice,
  currency_code as CurrencyCode,
  description as Description,
  status as Status
}
