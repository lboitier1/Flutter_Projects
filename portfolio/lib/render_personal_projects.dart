import 'package:flutter/material.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _openUrl(String url) async {
  final isLaunchable = await canLaunch(url);
  if (isLaunchable) {
    launch(url);
  }
}

Widget _renderProjectCard({
  required String imageUrl,
  required String title,
  required String description,
  String? visitLink,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 10.0),
    constraints: const BoxConstraints(maxWidth: 350),
    child: SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
            color: kBlue,
          ),
        ),
        elevation: 2.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: 350,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(color: kDarkBlue, fontWeight: FontWeight.w800, fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            if (visitLink != null)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => _openUrl(visitLink),
                      child: const Text('VISIT'),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    ),
  );
}

Widget projects() {
  return Container(
    color: kLightBlue,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 52.0, horizontal: 16.0),
    child: Column(
      children: [
        const Text(
          'Projets personnels',
          style: TextStyle(
            color: kDarkBlue,
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          alignment: WrapAlignment.center,
          children: [
            _renderProjectCard(imageUrl: "projects/pokedex.png", title: "Pokedex", description: "Pokemon explorer built with Flutter", visitLink: "https://pokedexweb.surge.sh"),
            _renderProjectCard(imageUrl: "projects/cryptospace.png", title: "Cryptospace", description: "Cryptocurrency tracker", visitLink: "https://cryptospace.surge.sh"),
            _renderProjectCard(imageUrl: "projects/notable.png", title: "Notable", description: "Note-taking made simple", visitLink: "https://notable.surge.sh"),
            _renderProjectCard(imageUrl: "projects/chatly.png", title: "Chatly", description: "Real-time chat", visitLink: "https://chatly.surge.sh"),
          ],
        ),
      ],
    ),
  );
}
