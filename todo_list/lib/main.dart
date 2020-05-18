import 'package:flutter/material.dart';
import 'package:todo_list/view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final title = 'Lista de tarefas';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 2,
        child: Home(title: title),
      ),
    );
  }
}
