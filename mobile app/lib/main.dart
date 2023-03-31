import 'package:flutter/material.dart';

import 'package:mapiol/res/view/pages/opening/opening.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Equalizer',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: "Inter"),
      home: const OpeningPage(title: 'Opening Page'),
    );
  }
}
