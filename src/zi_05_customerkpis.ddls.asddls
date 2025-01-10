@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds-05'


define view entity ZI_05_CustomerKPIs
  as select from Z05_I_TravelWithCustomer
{
  key CustomerId,
      CustomerName,
      Street,
      PostalCode,
      City,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      sum (TotalPriceInEuro + BookingFeeInEuro) as TotalRevenue,
      CurrencyCode,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg(DaysBetweenBeginAndEnd as abap.dec(16,0)) as AverageDuration,
      count (distinct AgencyId)                     as NumberOfDirrentAgencys





}
group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode

 having sum (TotalPriceInEuro + BookingFeeInEuro) > 50000
