import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  MyAnimatedContainer({Key key}) : super(key: key);

  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  Color _cor;
  double _raioBorda;
  double _margem;

  @override
  void initState() {
    super.initState();
    _cor = Colors.deepPurple;
    _raioBorda = 10;
    _margem = 5;
  }

  _alterarContainerr() {
    setState(() {
      _margem = Random().nextDouble() * 65;
      _cor = Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
      _raioBorda = Random().nextDouble() * 65;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: Column(children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                width: 200,
                height: 200,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(_margem),
                  decoration: BoxDecoration(
                    color: _cor,
                    borderRadius: BorderRadius.circular(_raioBorda),
                  ),
                  duration: Duration(milliseconds: 500),
                ),
              ),
            ),
          ),
          RaisedButton(
            child: Text("Alterar"),
            onPressed: () => _alterarContainerr(),
          ),
        ]),
      ),
    );
  }
}
