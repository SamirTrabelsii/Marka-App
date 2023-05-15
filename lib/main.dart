import 'package:flutter/material.dart';
import 'package:marka_app/GamePage.dart';
import 'package:marka_app/MarkaHome.dart';
import 'package:marka_app/ChatBotPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:marka_app/nameprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NameProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarkaHome(),
    );
  }
}
