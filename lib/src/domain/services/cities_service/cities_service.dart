abstract class CitiesService {
  Future<List<String>> getCities();
  Future<void> addCity({required String cityName});
  Future<void> removeCity({required String cityName});
}
