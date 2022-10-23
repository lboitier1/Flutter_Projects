import 'package:flutter/material.dart';
import 'package:portfolio/content_view.dart';
import 'package:portfolio/views/a_propos.dart';
import 'package:portfolio/views/accueil.dart';
import 'package:portfolio/views/portfolio.dart';

import 'custom_tab.dart';
import 'custom_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabBarController;
  double? screenHeight;
  double? screenWidth;
  double? topPadding;
  double? bottomPadding;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<ContentView> contentViews = [
    ContentView(
      tab: const CustomTab(title: 'ACCUEIL'),
      content: const AccueilView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'À PROPOS'),
      content: const AProposView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'PORTFOLIO'),
      content: const PortfolioView(),
    ),
    ContentView(
      tab: const CustomTab(title: 'CONTACT'),
      content: const Text('CONTACT'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabBarController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight! * 0.05;
    bottomPadding = screenHeight! * 0.01;
    return Scaffold(
      key: scaffoldKey,
      endDrawer: drawer(),
      backgroundColor: const Color(0xff2D418D),
      body: Padding(
        padding: EdgeInsets.only(top: topPadding!, bottom: bottomPadding!),
        child: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 715) {
            return desktopView();
          } else {
            return mobileView();
          }
        }),
      ),
    );
  }

  Widget desktopView() {
    // return const Text('Mobile View');
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.center,
      children: [
        Image.asset(
          'logo.png',
          width: screenWidth! * 0.08,
        ),
        CustomTabBar(
          controller: tabBarController,
          tabs: contentViews.map((e) => e.tab).toList(),
        ),
        SizedBox(
          height: screenHeight! * 0.80,
          child: TabBarView(
            controller: tabBarController,
            children: contentViews.map((e) => e.content).toList(),
          ),
        )
      ],
    );
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(right: screenWidth! * 0.05, left: screenWidth! * 0.05),
      child: SizedBox(
          width: screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                iconSize: screenWidth! * 0.08,
                onPressed: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
                icon: const Icon(Icons.menu_rounded),
                color: Colors.white,
              ),
            ],
          )),
    );
  }

  Widget drawer() {
    return Drawer(
        child: ListView(
      children: [
            Container(
              height: screenHeight! * 0.1,
            )
          ] +
          contentViews.map((e) {
            return Container(
              child: ListTile(
                title: Text(e.tab.title),
                onTap: () {},
              ),
            );
          }).toList(),
    ));
  }
}
