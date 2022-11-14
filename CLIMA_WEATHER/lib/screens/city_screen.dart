import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: ((value) {
                    cityName = value;
                  }),
                  style: TextStyle(color: Colors.black),
                  decoration: kInputDecorationCitySearch,
                ),
              ),
              TextButton(
                onPressed: () async {
                  NetworkHelper networkHelper = NetworkHelper(url: 'https://api.unsplash.com/search/photos?client_id=7CK8VP1tiw5xlKeiPRE7harbdysXw0HM-dwf1YLk54w&page=1&query=$cityName');
                  var imageData = await networkHelper.getDatasFromInternet();
                  Navigator.pop(context, [cityName, imageData]);
                  print(imageData);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
