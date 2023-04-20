abstract class CitiesRepository {
  Future<List<String>> fetchCities();
  Future<void> addCity({required String cityName});
  Future<void> removeCity({required String cityName});
}
