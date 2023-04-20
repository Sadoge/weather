import 'package:weather/src/data/repositories/cities_repository/cities_repository.dart';
import 'package:weather/src/domain/services/cities_service/cities_service.dart';

class CitiesServiceImpl implements CitiesService {
  final CitiesRepository citiesRepository;

  CitiesServiceImpl({required this.citiesRepository});

  @override
  Future<List<String>> getCities() async {
    return await citiesRepository.fetchCities();
  }

  @override
  Future<void> addCity({required String cityName}) async {
    await citiesRepository.addCity(cityName: cityName);
  }

  @override
  Future<void> removeCity({required String cityName}) async {
    await citiesRepository.removeCity(cityName: cityName);
  }
}
