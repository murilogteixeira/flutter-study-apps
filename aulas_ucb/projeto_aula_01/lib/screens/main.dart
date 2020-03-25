import 'package:flutter/material.dart';
import 'package:projetoaula01/screens/auth/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Semana de TI UCB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue[700],
          textTheme: ButtonTextTheme.primary,
          height: 40
        )
      ),
      home: LoginScreen(),
    );
  }
}
