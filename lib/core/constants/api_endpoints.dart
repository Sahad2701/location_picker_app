class ApiEndpoints {
  static const String countries = '/countries';

  static String statesByCountryId(int countryId) =>
      '$countries/$countryId/states';
}
