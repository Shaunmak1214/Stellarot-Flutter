import 'package:flutter/material.dart';

import './screens/Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stellarot',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
          fontFamily: 'Montserrat'),
      home: Dashboard(),
    );
  }
}
