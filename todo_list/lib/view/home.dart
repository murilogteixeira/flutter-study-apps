import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/components/task_widget.dart';
import 'package:todo_list/controller/home_controller.dart';
import 'package:todo_list/model/task.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(text: "Pendentes"),
            Tab(text: "Concluídos"),
          ],
        ),
        title: Text(widget.title),
      ),
      body: TabBarView(
        children: [
          _pendentes(),
          _concluidos(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _dialog,
        // tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _pendentes() {
    var tasks = controller.pendentes;

    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: tasks().length,
            itemBuilder: (_, i) {
              var task = tasks()[i];
              return TaskWidget(
                task: task,
                onClickRemoveTask: () {
                  controller.removeTask(task);
                },
                onClickTask: () {
                  _dialog();
                },
              );
            });
      },
    );
  }

  _concluidos() {
    var concluidos = controller.concluidos;

    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: concluidos().length,
            itemBuilder: (_, i) {
              var task = concluidos()[i];
              return TaskWidget(
                task: task,
                onClickRemoveTask: () {
                  controller.removeTask(task);
                },
              );
            });
      },
    );
  }

  _dialog() {
    Task task = Task(deadline: DateTime.now());

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Nova Tarefa"),
            content: Container(
              width: 300,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    onChanged: task.setTitle,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Título"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: task.setDescription,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Descrição"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DateTimeField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Prazo"),
                    format: DateFormat("dd/MM/yyyy HH:mm"),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        var value = DateTimeField.combine(date, time);
                        task.setDeadline(value);
                        return value;
                      } else {
                        return currentValue;
                      }
                    },
                  )
                ],
              ),
            ),
            actions: [
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("Salvar"),
                onPressed: () {
                  controller.addTask(task);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
