
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'AverageRating'

define view entity ZI_05_AverageRating as select from ZR_05_Rating
{
key MovieUuid,
@EndUserText: { label: 'Average Rating', quickInfo: 'Average Rating'}
avg(Rating as abap.dec(4,1)) as AverageRating 
  
}
group by
  MovieUuid


