import 'package:flutter/material.dart';
import 'package:haha_decision_maker/Theme/colors.dart';

import 'UI/decision_processing.dart';
import 'UI/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fately',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: purpleColor,
        accentColorBrightness: Brightness.light,
      ),
      home: HomePageWidget(),
    );
  }
}
