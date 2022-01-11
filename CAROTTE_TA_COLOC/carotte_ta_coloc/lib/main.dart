import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[400],
          title: Text("Carotte Ta Coloc'"),
        ),
        body: Center(child: Image.asset('images/icons8-carrots-64.png'))),
  ));
}
