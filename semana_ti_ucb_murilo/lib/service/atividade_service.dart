import 'package:semanatiucbmurilo/domain/atividade.dart';
import 'package:semanatiucbmurilo/stores/atividade_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class AtividadeService {
  final AtividadeStore atividadeStore;

  AtividadeService(this.atividadeStore);

  Future<List<Atividade>> buscarAtividades() {
    return Future.value(atividadeStore.atividades);
  }

  Future<Atividade> salvar(Atividade atividade){
    atividadeStore.addAtividade(atividade);
    return Future.value(atividade);
  }

  void dispose(){

  }
}
