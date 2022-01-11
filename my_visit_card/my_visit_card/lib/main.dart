import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/profile_picture.png', height: 200, width: 200),
            SizedBox(height: 16.0),
            Text(
              "Lucas Boitier",
              style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                      fontSize: 32.0, color: Colors.white, letterSpacing: 2.0)),
            ),
            SizedBox(height: 4.0),
            Text(
              "FLUTTER DEVELOPPER",
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: 32.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text(
                    '+33 6 46 98 76 72',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'lboitier1@gmail.com',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    )),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
