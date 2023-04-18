class WeatherServiceException implements Exception {
  final String message;

  WeatherServiceException(this.message);

  @override
  String toString() => 'WeatherServiceException: $message';
}
