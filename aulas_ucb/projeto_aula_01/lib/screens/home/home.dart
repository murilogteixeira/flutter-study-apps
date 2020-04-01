import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projetoaula01/domain/atividade.dart';
import 'package:projetoaula01/service/atividade_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AtividadeService _atividadeService = AtividadeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semana de TI UCB"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue[800]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Murilo Teixeira", style: TextStyle(color: Colors.white),),
                  Text("murilogteixeira@gmail.com", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: _atividadeService.listaAtividades(),
        builder: (context, AsyncSnapshot<List<Atividade>> snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: Text("Carregando..."),
            );
          }

          return ListView(
            children: snapshot.data.map((atividade) {
              return Card(
                child: InkWell(
                  child: Container(
                    height: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.maxFinite,
                          height: 100,
                          child: Image.network(atividade.imagem, fit: BoxFit.cover,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          // Sempre que declarar um atributo para uma funcao, passar como const para melhorar a performance
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          child: Text(atividade.nome, style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          // Sempre que declarar um atributo para uma funcao, passar como const para melhorar a performance
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          child: Text(
                            atividade.descricao,
                            style: TextStyle(color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                        Padding(
                          // Sempre que declarar um atributo para uma funcao, passar como const para melhorar a performance
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          child: Text("Inicio: ${DateFormat("dd/MM/yyyy HH:mm").format(atividade.dataHorainicio)}", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          // Sempre que declarar um atributo para uma funcao, passar como const para melhorar a performance
                          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                          child: Text("Fim: ${DateFormat("dd/MM/yyyy HH:mm").format(atividade.dataHoraFim)}", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end, // Posicao que ele foi criado
                            crossAxisAlignment: CrossAxisAlignment.end, //Posicao contraria a que foi criada
                            children: <Widget>[
                              InkWell(
                                onTap: () {

                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text("Lembrar-me"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      )
    );
  }
}
