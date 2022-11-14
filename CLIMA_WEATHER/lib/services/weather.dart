import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import '../utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getWeatherFromUserInput(String city) async {
    NetworkHelper networkHelper = NetworkHelper(url: "$kOpenWeatherURL?q=$city&appid=$kOpenWeatherApiKey&units=metric");
    var weatherData = await networkHelper.getDatasFromInternet();
    print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url: "$kOpenWeatherURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kOpenWeatherApiKey&units=metric");
    var weatherData = await networkHelper.getDatasFromInternet();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
