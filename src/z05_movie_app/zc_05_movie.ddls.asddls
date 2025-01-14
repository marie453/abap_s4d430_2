@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Movie'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_05_Movie
  provider contract transactional_query as projection on ZI_05_Movie
{
  key MovieUuid,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  Title,
  @Consumption.valueHelpDefinition: [{  entity: {name: 'ZI_05_GenreVH', element: 'Genre'}}]
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  AverageRating,
  AverageRatingCriticality,
  _Ratings: redirected to composition child ZC_05_Rating
}
