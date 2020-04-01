import 'package:projetoaula01/domain/atividade.dart';

class AtividadeService {

  Future<List<Atividade>> listaAtividades() {
    return Future.delayed(Duration(seconds: 5), () {
      return Future.value([
        Atividade(
            nome: "Evento 1",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as adfa sdf asdf asf asdf sdf asdf asdf asdf asd f asd asd fasfd sfa d fasdf asd"
                "asdfas df asdf asdf asdf asd asd asdf sad"
                "adfasdfasdfasdfasdf"
                "asdfasdfasdfasdfasdfasdfas"
                "dfasdfasdfasdfasfasdfasdfas"
                "dfasdfasdfasdfasdfasdfsadfsadf",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
        Atividade(
            nome: "Evento 2",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
        Atividade(
            nome: "Evento 3",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
        Atividade(
            nome: "Evento 4",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
        Atividade(
            nome: "Evento 5",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
        Atividade(
            nome: "Evento 6",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
        Atividade(
            nome: "Evento 7",
            dataHorainicio: DateTime.now(),
            dataHoraFim: DateTime.now(),
            descricao: "asdfad asd asdf as",
            local: "lab 2",
            imagem: "https://picsum.photos/300/150"
        ),
      ]);
    });

  }

}