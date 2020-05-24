import 'package:flutter/material.dart';
import 'package:todo_list/view/home.dart';
import 'package:todo_list/view/login.dart';
import 'package:todo_list/view/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final homeTitle = 'Lista de tarefas';
  final loginTitle = 'Bem Vindo!';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: homeTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
      routes: {
        '/home': (context) => Home(title: homeTitle),
        '/login': (context) => Login(title: loginTitle),
      },
    );
  }
}
