import 'package:flutter/material.dart';
import 'package:portfolio/homepage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: const HomePage(),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const HomePage();
}

// class Portfolio extends StatelessWidget {
//   const Portfolio({Key? key}) : super(key: key);



// Widget _header() {
//   return SizedBox(
//     width: double.infinity,
//     child: Column(
//       children: [
//         const SizedBox(height: 32),
//         CircleAvatar(
//           backgroundImage: AssetImage('assets/images/me.png'),
//           radius: 130,
//         ),
//         const SizedBox(height: 24),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text("Hello World, I'm Lucas", style: TextStyle(color: kDarkBlue, fontSize: 22, fontWeight: FontWeight.w500)),
//         ),
//         const SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             "Front-End Developper passionate about building web and mobile applications",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: kMediumBlue),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         const SizedBox(height: 16.0),
//         Wrap(
//           spacing: 16.0,
//           runSpacing: 16.0,
//           alignment: WrapAlignment.center,
//           children: [
//             IconButton(
//               onPressed: () => _openUrl("https://www.linkedin.com/in/lucas-boitier/"),
//               icon: const FaIcon(
//                 FontAwesomeIcons.linkedin,
//                 color: kDarkGreen,
//               ),
//             ),
//             IconButton(
//               onPressed: () => _openUrl("https://www.facebook.com/lucas.boitier/"),
//               icon: const FaIcon(
//                 FontAwesomeIcons.facebook,
//                 color: kDarkGreen,
//               ),
//             ),
//             IconButton(
//               onPressed: () => _openUrl("https://github.com/lboitier1"),
//               icon: const FaIcon(
//                 FontAwesomeIcons.github,
//                 color: kDarkGreen,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget _badges() {
//   const technologies = [
//     'flutter',
//     'dart',
//     'riverpod',
//     'git',
//     'firebase',
//   ];

//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//     child: Wrap(
//       alignment: WrapAlignment.center,
//       children: technologies
//           .map(
//             (technology) => Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/badges/$technology.png",
//                       width: 48.0,
//                     ),
//                     Text(technology),
//                   ],
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//     ),
//   );
// }


// Widget _footer() {
//   return Container(
//     color: kDarkBlue,
//     padding: const EdgeInsets.all(32.0),
//     child: Row(
//       children: [
//         Text('Made By Lucas Boitier', style: TextStyle(color: Colors.white)),
//       ],
//     ),
//   );
// }


// }
