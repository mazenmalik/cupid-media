class Urls {
  static const String baseUrl = 'https://api.stagingcupid.com/api/v1';
  static const String apiKey = 'sA,{tzUD=]dHvYNBJ4xVZ3c=&zS%.UqVc{But?kc';
  static const String userAgent =
      'com.stagingcupid.api/10.16.6 (Release) Android/31';
  static String getCountry = '$baseUrl/countries';
  static String getState(String countryId) => '$getCountry/$countryId/states';
}
