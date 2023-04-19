import 'package:get_it/get_it.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository.dart';
import 'package:weather/src/data/repositories/weather_repository/weather_repository_impl.dart';
import 'package:weather/src/domain/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather/src/domain/cubits/weather_forecast_cubit/weather_forecast_cubit.dart';
import 'package:weather/src/domain/services/weather_service/weather_service.dart';
import 'package:weather/src/domain/services/weather_service/weather_service_impl.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Register Repositories
  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());

  // Register Services
  getIt.registerLazySingleton<WeatherService>(
    () => WeatherServiceImpl(getIt<WeatherRepository>()),
  );

  // Register Cubits
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(getIt<WeatherService>()),
  );
  getIt.registerFactory<WeatherForecastCubit>(
    () => WeatherForecastCubit(getIt<WeatherService>()),
  );
}
