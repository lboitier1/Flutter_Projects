import 'package:flutter/material.dart';
import 'package:portfolio/utilities/constants.dart';
import 'package:pdfx/pdfx.dart';

class AProposView extends StatefulWidget {
  const AProposView({Key? key}) : super(key: key);

  @override
  State<AProposView> createState() => _AProposViewState();
}

final pdfController = PdfController(
  document: PdfDocument.openAsset('cv.pdf'),
);

class _AProposViewState extends State<AProposView> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  'a_propos/dessin.png',
                  width: screenWidth * 0.25,
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '| À PROPOS |',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.60,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Autodidacte, j’ai obtenu ma licence de communication à l’ISTC - école de communication globale à Lille - en 2019. J’y ai découvert deux passions : le graphisme et le web-design. Après plusieurs expériences professionnelles et associatives, je me suis perfectionné dans ses deux domaines. \n \n En janvier 2019, mon auto-entreprise a vu le jour. C’est alors que mes passions sont devenues mon travail au quotidien. J’accompagne mes clients à créer leurs identités visuelles & leurs sites internets, en tant que Graphiste et UX Designer.\n \n En avril 2021, j’ai la chance d’intégrer Le Wagon, une formation intensive pour devenir Développeur Web full-stack. ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        height: 2,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(
                        color: kYellow,
                        width: 2.0,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfView(
                          controller: pdfController,
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 16.0, left: 16.0, bottom: 16.0),
                    child: Text(
                      'DÉCOUVREZ MON CV',
                      style: TextStyle(
                        color: kYellow,
                        fontSize: 18.0,
                        height: 2,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
