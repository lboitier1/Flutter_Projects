import 'package:flutter/material.dart';

void main() {
  runApp(CryptoSpace());
}

class CryptoSpace extends StatelessWidget {
  const CryptoSpace ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(),
    );
  }
}