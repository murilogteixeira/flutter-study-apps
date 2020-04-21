import 'package:semanatiucbmurilo/domain/atividade.dart';
import 'package:mobx/mobx.dart';
part 'atividade_store.g.dart';

class AtividadeStore = _AtividadeStore with _$AtividadeStore;

abstract class _AtividadeStore with Store {
  @observable
  ObservableList<Atividade> atividades = [
    Atividade(nome: "nome", descricao: "descricao", foto: "https://picsum.photos/200", dataHoraInicio: DateTime.now(), dataHoraFim: DateTime.now()),
  ].asObservable();

  @action
  addAtividade(Atividade _atividade) => atividades.add(_atividade);

  @action
  removeAtividade(Atividade _atividade) =>  atividades.remove(_atividade);
}