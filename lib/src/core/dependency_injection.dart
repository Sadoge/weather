import 'package:get_it/get_it.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository_impl.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';
import 'package:weather/src/domain/services/weather_service/weather_service_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register WeatherRepository
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());

  // Register WeatherService
  getIt.registerLazySingleton<WeatherService>(
    () => WeatherServiceImpl(getIt<WeatherRepository>()),
  );

  // Register WeatherCubit
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt<WeatherService>()),
  );
}
