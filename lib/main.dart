import 'package:flutter/material.dart';
import 'package:news_app_sat/home/HomeScreen.dart';
import 'package:news_app_sat/ThemeProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primaryColor: MyThemeData.primaryColor,
          scaffoldBackgroundColor: Colors.transparent),
      routes: {
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
