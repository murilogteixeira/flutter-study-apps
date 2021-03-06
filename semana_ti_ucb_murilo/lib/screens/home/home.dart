import 'package:semanatiucbmurilo/domain/atividade.dart';
import 'package:semanatiucbmurilo/service/atividade_service.dart';
import 'package:semanatiucbmurilo/service/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AtividadeService _atividadeService;
  UsuarioService _usuarioService;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _usuarioService = Provider.of<UsuarioService>(context);
    _atividadeService = Provider.of<AtividadeService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Semana TI Católica 2020"),
          actions: <Widget>[
            Observer(
                builder: (context) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        _atividadeService.atividadeStore.qtdAtividade
                            .toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[800]),
                child: Observer(
                  builder: (ctx) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 60,
                        height: 60,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(this._usuarioService.usuarioStore.usuario.nome,
                          style: TextStyle(color: Colors.white)),
                      Text(this._usuarioService.usuarioStore.usuario.email,
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  _usuarioService.logout();
                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
              )
            ],
          ),
        ),
        floatingActionButton: Observer(
          builder: (ctx) {
            if (_usuarioService.usuarioStore.usuario.admin) {
              return FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("atividade");
                },
                child: Icon(Icons.add),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        body: _listarAtividades());
  }

  _listarAtividades() {
    return Observer(
      builder: (_) {
        if (_atividadeService.atividadeStore.qtdAtividade == 0) {
          return Center(
            child: Text("Nenhuma atividade."),
          );
        }

        return ListView(
          children:
              _atividadeService.atividadeStore.atividades.map((atividade) {
            return Card(
              child: InkWell(
                child: Container(
                  height: 370,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.maxFinite,
                        height: 150,
                        child: Image.network(
                          atividade.foto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Text(
                          atividade.nome,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Text(atividade.descricao,
                            style: TextStyle(color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Text(
                            "Início: ${DateFormat("dd/MM/yyyy HH:mm").format(atividade.dataHoraInicio)}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Text(
                            "Término: ${DateFormat("dd/MM/yyyy HH:mm").format(atividade.dataHoraFim)}",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Observer(
                              builder: (ctx) {
                                if (_usuarioService
                                    .usuarioStore.usuario.admin) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Text("Editar"),
                                    ),
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              },
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text("Avise-me"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
