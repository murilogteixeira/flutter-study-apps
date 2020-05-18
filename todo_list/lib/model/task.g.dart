// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Task on _TaskBase, Store {
  final _$titleAtom = Atom(name: '_TaskBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_TaskBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$deadlineAtom = Atom(name: '_TaskBase.deadline');

  @override
  DateTime get deadline {
    _$deadlineAtom.reportRead();
    return super.deadline;
  }

  @override
  set deadline(DateTime value) {
    _$deadlineAtom.reportWrite(value, super.deadline, () {
      super.deadline = value;
    });
  }

  final _$checkAtom = Atom(name: '_TaskBase.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  final _$_TaskBaseActionController = ActionController(name: '_TaskBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo =
        _$_TaskBaseActionController.startAction(name: '_TaskBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String value) {
    final _$actionInfo = _$_TaskBaseActionController.startAction(
        name: '_TaskBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDeadline(DateTime value) {
    final _$actionInfo =
        _$_TaskBaseActionController.startAction(name: '_TaskBase.setDeadline');
    try {
      return super.setDeadline(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCheck(bool value) {
    final _$actionInfo =
        _$_TaskBaseActionController.startAction(name: '_TaskBase.setCheck');
    try {
      return super.setCheck(value);
    } finally {
      _$_TaskBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
deadline: ${deadline},
check: ${check}
    ''';
  }
}
