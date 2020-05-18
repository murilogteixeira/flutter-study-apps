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

  final _$addTaskAsyncAction = AsyncAction('_HomeControllerBase.addTask');

  @override
  Future addTask(Task task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
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
  String toString() {
    return '''

    ''';
  }
}
