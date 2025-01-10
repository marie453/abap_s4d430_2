@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'abap-cds-03'


define view entity Z05_I_TravelWithCustomer
  as select from ZI_05_Customer
    inner join   ZI_05_Travel                                                 on ZI_05_Customer.CustomerId = ZI_05_Travel.CustomerId
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'/DMO/STATUS' ) on  ZI_05_Travel.Status                    = DDCDS_CUSTOMER_DOMAIN_VALUE_T.value_low
                                                                              and DDCDS_CUSTOMER_DOMAIN_VALUE_T.language = $session.system_language

{
  key ZI_05_Travel.TravelId,
      ZI_05_Customer.FirstName,
      ZI_05_Customer.LastName,
      ZI_05_Customer.Title,
      case when ZI_05_Customer.Title <> '' then concat_with_space( concat_with_space( ZI_05_Customer.Title, ZI_05_Customer.FirstName, 1 ), ZI_05_Customer.LastName, 1 )
      else concat_with_space( ZI_05_Customer.FirstName, ZI_05_Customer.LastName, 1 ) end as CustomerName,

      ZI_05_Customer.Street,
      ZI_05_Customer.PostalCode,
      ZI_05_Customer.City,
      ZI_05_Customer.CountryCode,
      ZI_05_Customer.PhoneNumber,
      ZI_05_Customer.EmailAddress,
      ZI_05_Travel.AgencyId,
      ZI_05_Travel.BeginDate,
      ZI_05_Travel.EndDate,
      dats_days_between( ZI_05_Travel.BeginDate, ZI_05_Travel.EndDate )    + 1           as DaysBetweenBeginAndEnd,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => ZI_05_Travel.TotalPrice,
      source_currency => ZI_05_Travel.CurrencyCode,
      target_currency => $projection.CurrencyCode,
      exchange_rate_date => ZI_05_Travel.BeginDate,
      error_handling => 'KEEP_UNCONVERTED' )                                             as TotalPriceInEuro,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => ZI_05_Travel.BookingFee,
      source_currency => ZI_05_Travel.CurrencyCode,
      target_currency => $projection.CurrencyCode,
      exchange_rate_date => ZI_05_Travel.BeginDate,
      error_handling => 'KEEP_UNCONVERTED' )                                             as BookingFeeInEuro,
      cast('EUR'as abap.cuky)                                                            as CurrencyCode,
      ZI_05_Travel.Description,
      ZI_05_Travel.Status,
      DDCDS_CUSTOMER_DOMAIN_VALUE_T.text                                                 as StatusText,
      ZI_05_Customer.CustomerId



}
where
  ZI_05_Customer.CountryCode = 'DE'
