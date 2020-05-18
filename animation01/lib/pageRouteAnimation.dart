import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageRouteAnimation extends StatefulWidget {
  MyPageRouteAnimation({Key key}) : super(key: key);

  @override
  _MyPageRouteAnimationState createState() => _MyPageRouteAnimationState();
}

class _MyPageRouteAnimationState extends State<MyPageRouteAnimation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Route Animation"),
      ),
      body: Center(
      ),
    );
  }
}
