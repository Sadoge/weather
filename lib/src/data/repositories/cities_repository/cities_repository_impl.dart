import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/src/data/repositories/cities_repository/cities_repository.dart';

class CitiesRepositoryImpl implements CitiesRepository {
  static const String _citiesKey = 'cities';

  @override
  Future<List<String>> fetchCities() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_citiesKey) ?? [];
  }

  @override
  Future<void> addCity({required String cityName}) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cities = prefs.getStringList(_citiesKey) ?? [];
    cities.add(cityName);
    await prefs.setStringList(_citiesKey, cities);
  }

  @override
  Future<void> removeCity({required String cityName}) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cities = prefs.getStringList(_citiesKey) ?? [];
    cities.remove(cityName);
    await prefs.setStringList(_citiesKey, cities);
  }
}
