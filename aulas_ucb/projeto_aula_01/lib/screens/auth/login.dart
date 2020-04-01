import 'package:flutter/material.dart';
import 'package:projetoaula01/service/user_service.dart';
import 'package:projetoaula01/utils/message_utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService();

  bool _showPassword = false;

  String _email;
  String _password;

  _login() {
    try{
      if(_formKey.currentState.validate()) {
        _formKey.currentState.save();
        _userService.login(_email, _password).then((user) {
          if(user != null) {
            Navigator.of(context).pushReplacementNamed("home");
          }
          else {
            showError("Usuario nao cadastrado");
          }
        }).catchError((error) {
          showError("Erro ao realizar login");
        });
      }
    }
    catch(e) {
      showError("Erro ao realizar login");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1 ,
            child: Container(
              color: Colors.green,
            ),
          ),

          Expanded(
            flex: 2,
            child: Form(
              key: _formKey,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: "", labelText: "email", icon: Icon(Icons.email)),
                      validator: (email) {
                        if(email.isEmpty) {
                          return "Informe o email";
                        }
                        return null;
                      },
                      onSaved: (email) {
                        _email = email;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: "", labelText: "senha",
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(icon: _showPassword ? Icon(Icons.visibility_off) : Icon(Icons.visibility), onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },)
                      ),
                      obscureText: !_showPassword,
                      validator: (password) {
                      if(password.isEmpty) {
                        return "Informe a senha";
                      }
                        return null;
                      },
                      onSaved: (password) {
                        _password = password;
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 5),
                    child: RaisedButton(
                      child: Text("Entrar"),
                      onPressed: () {
                        _login();
                      },
                    ),
                  ),

                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Esqueci a senha", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue[700]),),
                    ),
                    onTap: () {

                    },
                  ),

                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text("Cadastrar", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue[700]),),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("register");
                    },
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
