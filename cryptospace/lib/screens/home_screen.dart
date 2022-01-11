import 'dart:convert';
import 'package:cryptospace/models/crypto.dart';
import 'package:cryptospace/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<Crypto> fetchCrypto() async {
  final response =
      await http.get(Uri.parse('https://api.coincap.io/v2/assets'));
  print(response.body.runtimeType);
  print(response.body);
  // print('waiting for connexion');
  if (response.statusCode == 200) {
    // print(response["data"]);
    return Crypto.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load crypto');
  }
}

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Crypto> futureCrypto;

  @override
  void initState() {
    super.initState();
    futureCrypto = fetchCrypto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CryptoSpace',
          style: TextStyle(
            color: kGreenColor,
          ),
        ),
        elevation: 0,
        backgroundColor: kBlackColor,
        centerTitle: false,
        bottom: PreferredSize(
          child: Container(
            color: Colors.grey[400],
            height: 0.1,
          ),
          preferredSize: Size.fromHeight(0.1),
        ),
      ),
      backgroundColor: kBlackColor,
      body: Center(
        child: FutureBuilder<Crypto>(
            future: futureCrypto,
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.hasData) {
                // print(snapshot.data!.name.toString());
                return Text(snapshot.data!.name.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
