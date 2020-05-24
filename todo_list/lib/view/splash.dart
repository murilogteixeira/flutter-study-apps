import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _verificaLogado() {
    return Future.delayed(Duration(seconds: 2), () async {
      var prefs = await SharedPreferences.getInstance();
      var logado = prefs.getBool("logado");
      if (logado != null && logado) {
        Navigator.pushReplacementNamed(context, '/home');
        return true;
      }
      Navigator.pushReplacementNamed(context, '/login');
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _verificaLogado();
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'To do list',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,),
          Text(
            'Carregando...',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ])),
      ),
    );
  }
}
