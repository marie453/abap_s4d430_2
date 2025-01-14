@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds-07'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity ZI_05_CustomerWithTravels as select from ZI_05_Customer
  association [0..*] to ZI_05_Travel  as _Travels on ZI_05_Customer.CustomerId = _Travels.CustomerId

{
  key ZI_05_Customer.CustomerId,
  ZI_05_Customer.FirstName,
  ZI_05_Customer.LastName,
  ZI_05_Customer.Title,
  ZI_05_Customer.Street,
  ZI_05_Customer.PostalCode,
  ZI_05_Customer.City,
  ZI_05_Customer.CountryCode,
  ZI_05_Customer.PhoneNumber,
  ZI_05_Customer.EmailAddress,
  /* */
  _Travels
}
where ZI_05_Customer.CountryCode = 'DE'
