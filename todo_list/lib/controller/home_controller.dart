import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/task.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Task> _list = ObservableList();

  @observable
  String nomeUsuario = "";

  @action
  addTask(Task task) async {
    _list.add(task);
    salvarListaSP();
  }

  @action
  updateTask(Task task) async {
    _list.forEach((element) {
      if (element.title == task.title) {
        element = task;
      }
    });
    salvarListaSP();
  }

  @action
  removeTask(Task task) {
    _list.removeWhere((value) => value.title == task.title);
    salvarListaSP();
  }

  @action
  checkTask(Task task, bool value) {
    task.setCheck(value);
    salvarListaSP();
  }

  getNomeSP() async {
    var prefs = await SharedPreferences.getInstance();
    var nome = prefs.getString('nome');
    nomeUsuario = nome;
    print(nome);
  }

  pendentes() {
    var tasks = ObservableList<Task>();
    _list.forEach((element) {
      if (!element.check) {
        tasks.add(element);
      }
    });
    return tasks;
  }

  concluidos() {
    var tasks = ObservableList<Task>();
    _list.forEach((element) {
      if (element.check) {
        tasks.add(element);
      }
    });
    return tasks;
  }

  salvarListaSP() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        "lista", _list.map((e) => jsonEncode(e.toJson())).toList());
  }

  getListaSP() async {
    var prefs = await SharedPreferences.getInstance();
    var listaString = prefs.getStringList("lista");
    var lista = ObservableList<Task>();
    if (listaString != null) {
      listaString
          .map((e) => lista.add(Task().fromJson(jsonDecode(e))))
          .toList();
    }
    _list = lista;
  }
}
