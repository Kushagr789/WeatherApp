import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherapp/Fav.dart';
import 'package:weatherapp/Home.dart';
import 'package:weatherapp/HomePage.dart';
import 'package:weatherapp/You.dart';
class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List screens=[
    Home(),
    HomePage(),
    Fav(),
    You(),
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex=value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
              size: 25,
              color: Colors.blue,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.home,
              size: 25,
              color: Colors.pink,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.map,
              color: Colors.blue,
              size: 25,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.map,
              color: Colors.pink,
              size: 25,
            ),
            label: "Atlas"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.blue,
              size: 25,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.pink,
              size: 25,
            ),
            label: "Fav"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.blue,
              size: 25,
            ),
            activeIcon: Icon(
              FontAwesomeIcons.bars,
              color: Colors.pink,
              size: 25,
            ),
            label: "My"
          ),
        ],
      ),
    );
  }
}