import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/model/task.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Task> _list = ObservableList();

  @action
  addTask(Task task) async {
    _list.add(task);
    _salvarListaSP();
  }

  @action
  removeTask(Task task) {
    _list.removeWhere((value) => value.title == task.title);
    _salvarListaSP();
  }

  pendentes() {
    var tasks = ObservableList<Task>();
    // _getListaSP().then((value) => _list = value);
    _list.forEach((element) {
      if (!element.check) {
        tasks.add(element);
      }
    });
    return tasks;
  }

  concluidos() {
    var tasks = ObservableList<Task>();
    // _getListaSP().then((value) => _list = value);
    _list.forEach((element) {
      if (element.check) {
        tasks.add(element);
      }
    });
    return tasks;
  }

  _salvarListaSP() async {
    var json = _encondeToJson(_list);
    var jsonStr = jsonEncode(json);
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("lista", jsonStr);
  }

  Future<ObservableList<Task>> _getListaSP() async {
    var prefs = await SharedPreferences.getInstance();
    var listaStr = prefs.getString("lista");
    if (listaStr != null) {
      _list = _decodeFromJson(jsonDecode(listaStr)).asObservable();
      return _list;
    }
    return _list;
  }

  List<Task> _decodeFromJson(List json) {
    var taskList = List<Task>();
    json.map((e) => taskList.add(_fromJson(e))).toList();
    return taskList;
  }

  _encondeToJson(ObservableList<Task> list) {
    var jsonList = List();
    list.map((item) => jsonList.add(item.toJson())).toList();
    return jsonList;
  }

  _fromJson(Map<String, dynamic> json) {
    return Task(
        title: json["title"],
        description: json["description"],
        deadline: DateTime.fromMillisecondsSinceEpoch(json["deadline"]),
        check: json["check"]);
  }
}

// import 'dart:convert';

// import 'package:mobx/mobx.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_list/model/task.dart';
// part 'home_controller.g.dart';

// class HomeController = _HomeControllerBase with _$HomeController;

// abstract class _HomeControllerBase with Store {
//   @observable
//   ObservableList<Task> _list = ObservableList();

//   @action
//   addTask(Task task) async {
//     _list.add(task);
//     _salvarListaSP();
//   }

//   @action
//   removeTask(Task task) {
//     _list.removeWhere((value) => value.title == task.title);
//     _salvarListaSP();
//   }

// _salvarListaSP() async {
//   var json = _encondeToJson(_list);
//   var jsonStr = jsonEncode(json);
//   var prefs = await SharedPreferences.getInstance();
//   prefs.setString("lista", jsonStr);
// }

// Future<ObservableList<Task>> _getList() async {
//   var prefs = await SharedPreferences.getInstance();
//   var listaStr = prefs.getString("lista");
//   if (listaStr != null) {
//     _list = _decodeFromJson(jsonDecode(listaStr)).asObservable();
//     return _list;
//   }
//   return [].asObservable();
// }

// List<Task> _decodeFromJson(List json) {
//   var taskList = List<Task>();
//   json.map((e) => taskList.add(_fromJson(e))).toList();
//   return taskList;
// }

// _encondeToJson(ObservableList<Task> list) {
//   var jsonList = List();
//   list.map((item) => jsonList.add(item.toJson())).toList();
//   return jsonList;
// }

// _fromJson(Map<String, dynamic> json) {
//   return Task(
//       title: json["title"],
//       description: json["description"],
//       deadline: DateTime.fromMillisecondsSinceEpoch(json["deadline"]),
//       check: json["check"]);
// }

//   pendentes() {
//     var concluidos = ObservableList<Task>();
//     _getList().then((value) => value.forEach((element) {
//     // _list.forEach((element) {
//           if (element.check == false) {
//             concluidos.add(element);
//           }
//         }));
//     return concluidos;
//   }

//   concluidos() {
//     var concluidos = ObservableList<Task>();
//     _getList().then((value) => value.forEach((element) {
//     // _list.forEach((element) {
//           if (element.check == true) {
//             concluidos.add(element);
//           }
//         }));
//     return concluidos;
//   }
// }
