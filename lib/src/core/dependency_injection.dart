import 'package:get_it/get_it.dart';
import 'package:weather/src/data/repositories/cities_repository/cities_repository.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository_impl.dart';
import 'package:weather/src/domain/cubits/cities_cubit/cities_cubit.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/src/domain/cubits/weather_forecast_cubit/weather_forecast_cubit.dart';
import 'package:weather/src/domain/services/cities_service/cities_service.dart';
import 'package:weather/src/domain/services/cities_service/cities_service_impl.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';
import 'package:weather/src/domain/services/weather_service/weather_service_impl.dart';

import '../data/repositories/cities_repository/cities_repository_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register Repositories
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());
  getIt.registerLazySingleton<CitiesRepository>(() => CitiesRepositoryImpl());

  // Register Services
  getIt.registerLazySingleton<WeatherService>(
    () => WeatherServiceImpl(getIt<WeatherRepository>()),
  );
  getIt.registerLazySingleton<CitiesService>(
    () => CitiesServiceImpl(citiesRepository: getIt<CitiesRepository>()),
  );

  // Register Cubits
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt<WeatherService>()),
  );
  getIt.registerFactory<WeatherForecastCubit>(
    () => WeatherForecastCubit(getIt<WeatherService>()),
  );
  getIt.registerFactory<CitiesCubit>(
    () => CitiesCubit(
      citiesService: getIt<CitiesService>(),
      weatherService: getIt<WeatherService>(),
    ),
  );
}
