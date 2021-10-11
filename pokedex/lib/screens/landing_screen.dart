import 'package:flutter/material.dart';
import 'package:pokedex/screens/home_screen.dart';
import 'package:pokedex/utilities/constants.dart';

class landingScreen extends StatelessWidget {
  const landingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/device.png",
                width: 200.0,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Image.asset(
                "assets/images/Pokedex.png",
                width: 200.0,
              ),
              const SizedBox(
                height: 64.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
        },
        label: Text('GET STARTED',
            style: TextStyle(color: kDarkGrey, fontWeight: FontWeight.w500)),
        backgroundColor: kOffWhite,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
