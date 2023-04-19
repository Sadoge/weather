# Flutter Weather App

A simple weather app built with Flutter that displays current weather information for a specified city. The app makes use of the Weather API and demonstrates how to create and manage API calls, handle errors, and use the BLoC pattern for state management.

## Features

- Fetch and display current weather information for a city
- Show weather data, including temperature, humidity, and wind speed
- Error handling for API requests
- BLoC pattern for state management using `flutter_bloc`
- Dependency injection using `get_it`
- Secure API key storage using `flutter_dotenv`

## Setup

1. Clone this repository:

`git clone https://github.com/Sadoge/weather.git`


2. Install the dependencies:

`flutter pub get`

3. Create a `.env` file in the project root and add your Weather API key:

`WEATHER_API_KEY=your_api_key_here`

4. Run the app:

`flutter run`

5. Demo

A live version of the app is available [here](https://sadoge.github.io/weather/)

## Dependencies

- [http](https://pub.dev/packages/http) for API requests
- [json_annotation](https://pub.dev/packages/json_annotation) and [json_serializable](https://pub.dev/packages/json_serializable) for JSON serialization
- [freezed](https://pub.dev/packages/freezed) for creating immutable classes
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [get_it](https://pub.dev/packages/get_it) for dependency injection
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) for loading environment variables

## License

MIT License. See [LICENSE](LICENSE) for more information.
