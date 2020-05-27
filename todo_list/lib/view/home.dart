import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list/view/components/date_time_widget.dart';
import 'package:todo_list/view/components/task_widget.dart';
import 'package:todo_list/controller/home_controller.dart';
import 'package:todo_list/model/task.dart';

enum Opcao { add, update }

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
    controller.getNomeSP();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Pendentes"),
              Tab(text: "Concluídos"),
            ],
          ),
          title: Observer(builder: (_) {
            return Text("Tarefas de ${controller.nomeUsuario}");
          }),
          // automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TabBarView(
            children: [
              _pendentes(),
              _concluidos(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _dialogoNovaTask(null),
          // tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  _pendentes() {
    var tasks = controller.pendentes;
    controller.getListaSP();
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: tasks().length,
            itemBuilder: (_, i) {
              var task = tasks()[i];
              return TaskWidget(
                task: task,
                onClickRemoveTask: () {
                  // controller.removeTask(task);
                  _alertaRemoverTask(task);
                },
                onClickTask: () {
                  _dialogoNovaTask(task);
                },
                controller: controller,
              );
            });
      },
    );
  }

  _concluidos() {
    var concluidos = controller.concluidos;
    controller.getListaSP();
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: concluidos().length,
            itemBuilder: (_, i) {
              var task = concluidos()[i];
              return TaskWidget(
                task: task,
                onClickRemoveTask: () {
                  // controller.removeTask(task);
                  _alertaRemoverTask(task);
                },
                onClickTask: () {
                  _dialogoNovaTask(task);
                },
                controller: controller,
              );
            });
      },
    );
  }

  _alertaRemoverTask(Task task) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
                "Tem certeza que deseja excluir a tarefa \"${task.title}\""),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    controller.removeTask(task);
                    Navigator.pop(context);
                  },
                  child: Text("Excluir")),
            ],
          );
        });
  }

  _dialogoNovaTask(Task task) {
    Opcao opcao;

    if (task == null) {
      task = Task(deadline: DateTime.now());
      opcao = Opcao.add;
    } else {
      opcao = Opcao.update;
    }

    var title = opcao == Opcao.add ? "Nova Tarefa" : "Editar Tarefa";

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              width: 300,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    initialValue: task.title,
                    onChanged: task.setTitle,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Título"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: task.description,
                    onChanged: task.setDescription,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Descrição"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DateTimeWidget(task: task),
                ],
              ),
            ),
            actions: _actions(opcao, task),
          );
        });
  }

  _actions(Opcao opcao, Task task) {
    if (opcao == Opcao.add) {
      return [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Salvar"),
          onPressed: () {
            if (opcao == Opcao.add) {
              controller.addTask(task);
            } else {
              controller.updateTask(task);
            }
            Navigator.pop(context);
          },
        ),
      ];
    } else {
      return [
        FlatButton(
          child: Text("Concluído"),
          onPressed: () {
            controller.salvarListaSP();
            Navigator.pop(context);
          },
        ),
      ];
    }
  }
}
