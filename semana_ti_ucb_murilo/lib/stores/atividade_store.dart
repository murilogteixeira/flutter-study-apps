import 'package:semanatiucbmurilo/domain/atividade.dart';
import 'package:mobx/mobx.dart';
part 'atividade_store.g.dart';

class AtividadeStore = _AtividadeStore with _$AtividadeStore;

abstract class _AtividadeStore with Store {
  @observable
  ObservableList<Atividade> atividades = List<Atividade>().asObservable();

  @computed
  int get qtdAtividade => atividades.length;

  @action
  addAtividade(Atividade _atividade) => atividades.add(_atividade);

  @action
  removeAtividade(Atividade _atividade) =>  atividades.remove(_atividade);
}