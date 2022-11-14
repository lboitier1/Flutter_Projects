import 'package:clima/screens/location_screen.dart';

import 'package:flutter/material.dart';
import '../services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    dynamic weatherData = await weatherModel.getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return SpinKitRotatingCircle(
      color: Colors.white,
      size: 50.0,
    );
  }
}
