import 'package:flutter/material.dart';
import 'package:portfolio/render_personal_projects.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({Key? key}) : super(key: key);

  @override
  State<PortfolioView> createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.6,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      '| PORTFOLIO |',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset('portfolio/mockup_anav.png', width: screenWidth * 0.40),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ANAV',
                        style: TextStyle(fontSize: 32.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ANAV est une solution web et mobile proposant aux chefs d’entreprise, et à leurs équipes, d’anticiper facilement la charge de travail.L’application mobile ANAV, couplée à notre application web, vous offre de nouvelles possibilités d’anticipation : \n\n - Mettez à jour, en temps réel, votre planning de charge avec les informations partagées par les collaborateurs.  \n\n - Visualisez, en un coup d’œil, les tâches journalières planifiées pour chacun des collaborateurs. \n\n - Retrouvez, pour chacune des opérations et chacun des collaborateurs, le temps de travail effectif.  \n\n - Renseignez, selon le niveau de détail souhaité, l’avancement des tâches planifiées.',
                            style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.white, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      const Text(
                        "Compétences utilisées :",
                        style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const Text(
                        "Flutter • Dart • Gitlab • Riverpod (V2) • QRScanner • intl • Redux (V1) ",
                        style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset('portfolio/bunnyhop.png', width: screenWidth * 0.40),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Carotte Ta Coloc'",
                        style: TextStyle(fontSize: 32.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "C’est une application mobile permettant de gérer de manière efficace et ludique les tâches ménagères en coloc’ ! 😎' \n\n En gros, le papier sur le frigo c’est du passé 🌬 \n\n Chaque semaine, des tâches sont réparties de manière aléatoire et équitable à chaque cooloc’. \n\n Une tâche réalisée = des carottes gagnées. \n\nTu ne veux pas faire une de tes tâches ? Dépense tes carottes pour la refiler à un de tes coolocs!",
                            style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.white, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      const Text(
                        "Compétences utilisées :",
                        style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const Text(
                        "Flutter • Dart • Firebase • Github • Riverpod • RubyOnRails (V1) • Heroku (V1)",
                        style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset('portfolio/newdaycare.png', width: screenWidth * 0.40),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'NewDay.Care',
                        style: TextStyle(fontSize: 32.0, color: Colors.white),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(10),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Newday Care est une application qui propose des parcours utilisateurs composés de tests, de podcasts, d’articles et de citations inspirantes, pour renforcer la confiance en soi, augmenter le niveau d’énergie, la motivation, la concentration, l’épanouissement et améliorer la gestion du stress ressenti et le sommeil des utilisateurs (salarié.e.s et particuliers).",
                            style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.white, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      const Text(
                        "Compétences utilisées :",
                        style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.w400, decoration: TextDecoration.underline),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const Text(
                        "Flutter • Dart • Firebase • Github • UX/UI • Algorythme",
                        style: TextStyle(fontSize: 17.0, color: Colors.white, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                )
              ],
            ),
            projects()
          ],
        ),
      ),
    );
  }
}
