import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AccueilView extends StatefulWidget {
  const AccueilView({Key? key}) : super(key: key);

  @override
  State<AccueilView> createState() => _AccueilViewState();
}

Future<void> _openUrl(String url) async {
  final isLaunchable = await canLaunch(url);
  if (isLaunchable) {
    launch(url);
  }
}

class _AccueilViewState extends State<AccueilView> {
  Widget _header() {
    return Center(
      child: Row(
        children: [
          IconButton(
            onPressed: () => _openUrl("https://www.linkedin.com/in/lucas-boitier/"),
            icon: const FaIcon(
              FontAwesomeIcons.linkedin,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => _openUrl("https://github.com/lboitier1"),
            icon: const FaIcon(
              FontAwesomeIcons.github,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => _openUrl("https://www.malt.fr/profile/lucasboitier"),
            icon: Image.asset('accueil/malt.png'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.05,
        ),
        child: SizedBox(
          width: screenWidth * 0.9,
          child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DÉVELOPPEUR',
                      style: TextStyle(color: Colors.white, fontSize: 88.0, decoration: TextDecoration.lineThrough),
                    ),
                    const Text(
                      'MOBILE',
                      style: TextStyle(color: Colors.white, fontSize: 88.0, decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      'FREELANCE',
                      style: TextStyle(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.5
                          ..color = kYellow,
                        fontSize: 88.0,
                      ),
                    ),
                    _header(),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'accueil/mock_up.png',
                      width: screenWidth * 0.20,
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
