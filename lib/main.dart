import 'package:alwataniya/screens/calc_screen.dart';
import 'package:alwataniya/screens/home.dart';
import 'package:alwataniya/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(
      MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            debugShowCheckedModeBanner: false,

            // title: 'MyMarket',
            // themeMode: ThemeMode.dark,
            theme: ThemeData(
              primaryColor: Color.fromRGBO(0, 0, 255, 1),
              // primarySwatch: Colors.blue.shade100,
              primarySwatch: Colors.lightBlue,
              accentColor: Colors.orangeAccent,
              fontFamily: 'jf',

            ),
            home: HomeScreen(),

            routes: {
              CalculatorScreen.routeName: (_) => CalculatorScreen(),
               },

        );
  }
}


