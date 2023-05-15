import 'package:flutter/material.dart';
import 'package:marka_app/GamePage.dart';
import 'package:marka_app/HomePage.dart';
import 'package:marka_app/ChatBotPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MarkaHome extends StatefulWidget {
  @override
  State<MarkaHome> createState() => _MarkaHomeState();
}

class _MarkaHomeState extends State<MarkaHome> {
  int indexe = 1;
  final screens = [
    ChatBotPage(),
    HomePage(),
    GamePage(),
  ];
  final items = <Widget>[
    Icon(Icons.electric_bolt_rounded, size: 30, color: Colors.white),
    Icon(Icons.home, size: 30, color: Colors.white),
    ImageIcon(
      AssetImage('images/cardsicon.png'),
      size: 30,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الماركة',
          style: TextStyle(fontFamily: 'Blaka', fontSize: 40),
        ),
        elevation: 10,
        centerTitle: true,
        backgroundColor: Color(0xFFfa5f74),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 300),
        buttonBackgroundColor: Color(0xFFfa5f74),
        color: Color(0xFFfa5f74),
        backgroundColor: Colors.transparent,
        height: 60,
        index: 1,
        items: items,
        onTap: (index) {
          setState(() {
            indexe = index;
          });
        },
      ),
      body: screens[indexe],
      backgroundColor: Color(0xFFF7ECDE),
    );
  }
}
