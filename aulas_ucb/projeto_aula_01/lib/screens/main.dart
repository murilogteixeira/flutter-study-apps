import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:projetoaula01/screens/auth/login.dart';
import 'package:projetoaula01/screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      child: MaterialApp(
        title: 'Semana de TI UCB',
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
            primarySwatch: Colors.blue,
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.blue[700],
                textTheme: ButtonTextTheme.primary,
                height: 40
            )
        ),
        initialRoute: "home",
        routes: {
          "login": (context) => LoginScreen(),
          "home": (context) => HomeScreen(),
        },
        home: LoginScreen(),
      ),
    );
  }
}
