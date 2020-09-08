import 'package:app_masterclass_balta_io/controller/signup.controller.dart';
import 'package:app_masterclass_balta_io/view/home.view.dart';
import 'package:app_masterclass_balta_io/viewmodel/signup.viewmodel.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  static final route = '/signup';
  SignUpView({Key key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var _formKey = GlobalKey<FormState>();
  var _controller = SignUpController();
  var model = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastre-se'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Nome'),
                        validator: (value) {
                          if (value.isEmpty) return 'Nome inválido';
                          return null;
                        },
                        onSaved: (value) {
                          model.nome = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value.isEmpty) return 'Email inválido';
                          return null;
                        },
                        onSaved: (value) {
                          model.email = value;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Senha'),
                        validator: (value) {
                          if (value.isEmpty) return 'Senha inválida';
                          return null;
                        },
                        onSaved: (value) {
                          model.senha = value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                model.busy
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : RaisedButton(
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            setState(() {});
                            _controller.create(model).then((value) {
                              print(value.token);
                              setState(() {});
                              Navigator.of(context).pushNamed(HomeView.route);
                            });
                          }
                        },
                      ),
              ],
            )),
      ),
    );
  }
}
