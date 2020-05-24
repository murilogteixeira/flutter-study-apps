// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$_listAtom = Atom(name: '_HomeControllerBase._list');

  @override
  ObservableList<Task> get _list {
    _$_listAtom.reportRead();
    return super._list;
  }

  @override
  set _list(ObservableList<Task> value) {
    _$_listAtom.reportWrite(value, super._list, () {
      super._list = value;
    });
  }

  final _$nomeUsuarioAtom = Atom(name: '_HomeControllerBase.nomeUsuario');

  @override
  String get nomeUsuario {
    _$nomeUsuarioAtom.reportRead();
    return super.nomeUsuario;
  }

  @override
  set nomeUsuario(String value) {
    _$nomeUsuarioAtom.reportWrite(value, super.nomeUsuario, () {
      super.nomeUsuario = value;
    });
  }

  final _$addTaskAsyncAction = AsyncAction('_HomeControllerBase.addTask');

  @override
  Future addTask(Task task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  final _$updateTaskAsyncAction = AsyncAction('_HomeControllerBase.updateTask');

  @override
  Future updateTask(Task task) {
    return _$updateTaskAsyncAction.run(() => super.updateTask(task));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic removeTask(Task task) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkTask(Task task, bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.checkTask');
    try {
      return super.checkTask(task, value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeUsuario: ${nomeUsuario}
    ''';
  }
}
