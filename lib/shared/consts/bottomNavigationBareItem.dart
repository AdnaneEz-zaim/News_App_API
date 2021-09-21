import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/SettingsScreen/SettingsScreen.dart';
import 'package:news_app/modules/business/busniss_screen.dart';
import 'package:news_app/modules/sciences/sciences_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

//l'index de la page
int currentIndex=0;

//la liste des itms de la bottomnav
List<BottomNavigationBarItem> listeNavigationBar=[
  BottomNavigationBarItem(
    icon: Icon(Icons.business_center_outlined),
    label: "Business",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.science_outlined),
    label: "Science",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.sports_baseball_outlined),
    label: "Sports",
  ),
  // BottomNavigationBarItem(
  //   icon: Icon(Icons.settings_accessibility),
  //   label: "Settings",
  // ),
];

//la liste des screens de l'application

List<Widget> listScreens=[
  BusinessScreen(),
  SciencesScreen(),
  SportsScreen(),
  //SettingsScreen(),
];