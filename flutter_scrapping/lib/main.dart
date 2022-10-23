import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    elementsScrapped();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Row(
          children: [
            Text('Flutter Demo Home Page'),
          ],
        ),
      ),
    );
  }
}

void elementsScrapped() async {
  final webScraper = WebScraper('https://test_scrapping.surge.sh/');
  print(webScraper);
  if (await webScraper.loadWebPage('/')) {
    Object? elements = webScraper.getPageContent();
    print(elements);
  }
}
