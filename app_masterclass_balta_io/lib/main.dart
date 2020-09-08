import 'package:app_masterclass_balta_io/view/home.view.dart';
import 'package:app_masterclass_balta_io/view/signup.view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SignUpView.route,
      routes: {
        SignUpView.route: (context) => SignUpView(),
        HomeView.route: (context) => HomeView(),
      },
    );
  }
}
