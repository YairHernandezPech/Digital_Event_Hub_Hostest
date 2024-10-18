import 'package:flutter/material.dart';
import 'package:hostess_digital/Login/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Event Hub',
      home: SignInScreen(),
      color: Colors.white,
      debugShowCheckedModeBanner: false,
    );
  }
}
