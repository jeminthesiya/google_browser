import 'package:flutter/material.dart';
import 'package:google_broweser/google/provider/navigatinBar_Provider.dart';
import 'package:google_broweser/google/view/google.dart';
import 'package:google_broweser/google/view/show.dart';
import 'package:provider/provider.dart';

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({Key? key}) : super(key: key);

  @override
  State<Navigation_Bar> createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  List Screen = [
    Google_Screen(),
    Show_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Screen[Provider.of<Bar>(context, listen: true).i],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: Provider.of<Bar>(context, listen: true).i,
          elevation: 0,
          onTap: (value) {
            Provider.of<Bar>(context, listen: false).select(value);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.black,
              ),
              label: "Home",
            ),
          ],
        ),
      ),
    );
  }
}
