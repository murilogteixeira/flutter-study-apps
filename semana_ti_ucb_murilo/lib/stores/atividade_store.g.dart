// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtividadeStore on _AtividadeStore, Store {
  final _$atividadesAtom = Atom(name: '_AtividadeStore.atividades');

  @override
  ObservableList<Atividade> get atividades {
    _$atividadesAtom.context.enforceReadPolicy(_$atividadesAtom);
    _$atividadesAtom.reportObserved();
    return super.atividades;
  }

  @override
  set atividades(ObservableList<Atividade> value) {
    _$atividadesAtom.context.conditionallyRunInAction(() {
      super.atividades = value;
      _$atividadesAtom.reportChanged();
    }, _$atividadesAtom, name: '${_$atividadesAtom.name}_set');
  }

  final _$_AtividadeStoreActionController =
      ActionController(name: '_AtividadeStore');

  @override
  dynamic addAtividade(Atividade _atividade) {
    final _$actionInfo = _$_AtividadeStoreActionController.startAction();
    try {
      return super.addAtividade(_atividade);
    } finally {
      _$_AtividadeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeAtividade(Atividade _atividade) {
    final _$actionInfo = _$_AtividadeStoreActionController.startAction();
    try {
      return super.removeAtividade(_atividade);
    } finally {
      _$_AtividadeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'atividades: ${atividades.toString()}';
    return '{$string}';
  }
}
