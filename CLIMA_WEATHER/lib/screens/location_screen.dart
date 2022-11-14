import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';
import 'dart:math';

class LocationScreen extends StatefulWidget {
  LocationScreen({@required this.weatherData});
  final dynamic weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String cityName;
  String weatherIcon;
  String weatherMessage;
  WeatherModel weatherModel = WeatherModel();
  String imageBackgroundUrl;

  void updateImage(dynamic imageData) {
    if (imageData == null) {
      imageBackgroundUrl = 'https://unsplash.com/photos/GFd4Otih4Hk';
    } else {
      final _random = new Random();
      int next(int min, int max) => min + _random.nextInt(max - min);
      imageBackgroundUrl = imageData['results'][next(1, 5)]['urls']['regular'];
      print(imageBackgroundUrl);
    }
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = 0;
      weatherIcon = 'Error';
      weatherMessage = 'Unable to retrieve datas from Internet';
      cityName = '';
      return;
    }
    setState(() {
      final temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      cityName = weatherData['name'];

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(temperature);
    });
  }

  @override
  void initState() {
    updateUI(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageBackgroundUrl != null ? NetworkImage(imageBackgroundUrl) : NetworkImage(''),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => CityScreen()),
                        ),
                      );
                      if (typedName != null) {
                        var weatherData = await weatherModel.getWeatherFromUserInput(typedName[0]);
                        setState(() {
                          updateUI(weatherData);
                        });
                        setState(() {
                          updateImage(typedName[1]);
                        });
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      temperature.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Center(
                  child: Text(
                    '$weatherMessage in $cityName',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double convertKelvinToCelsius(double kelvinTemperature) {
    return (kelvinTemperature - 273.15).roundToDouble();
  }
}
