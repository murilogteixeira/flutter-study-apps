import 'package:flutter/material.dart';
import 'package:projetoaula01/service/user_service.dart';
import 'package:projetoaula01/utils/message_utils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userService = UserService();

  bool _showPassword = false;

  String _nome;
  String _email;
  String _password;

  FocusNode _focusNome;
  FocusNode _focusEmail;
  FocusNode _focusSenha;


  @override
  void initState() {
    super.initState();
    this._focusNome = FocusNode();
    this._focusEmail = FocusNode();
    this._focusSenha = FocusNode();
  }

  @override
  void dispose() {
    this._focusNome.dispose();
    this._focusEmail.dispose();
    this._focusSenha.dispose();

    super.dispose();
  }

  _register() {
    try{
      if(_formKey.currentState.validate()) {
        _formKey.currentState.save();
        _userService.criarUsuario(_nome, _email, _password).then((user) {
            Navigator.of(context).pushReplacementNamed("home");
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
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green,
          ),

          Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextFormField(
                    autofocus: true,
                    focusNode: this._focusNome,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "", labelText: "email", icon: Icon(Icons.account_box)),
                    validator: (nome) {
                      if(nome.isEmpty) {
                        return "Informe o email";
                      }
                      return null;
                    },
                    onFieldSubmitted: (nome) {
                      this._focusNome.unfocus();
                      this._focusEmail.requestFocus();
                    },
                    onSaved: (nome) {
                      _nome = nome;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: _focusEmail,
                    decoration: InputDecoration(hintText: "", labelText: "email", icon: Icon(Icons.email)),
                    validator: (email) {
                      if(email.isEmpty) {
                        return "Informe o email";
                      }
                      return null;
                    },
                    onFieldSubmitted: (email) {
                      this._focusEmail.unfocus();
                      this._focusSenha.requestFocus();
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
                    textInputAction: TextInputAction.done,
                    focusNode: _focusSenha,
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
                    onFieldSubmitted: (senha) {
                      this._focusSenha.unfocus();
                      this._register();
                    },
                    onSaved: (password) {
                      _password = password;
                    },
                  ),
                ),

                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Cadastrar", textAlign: TextAlign.center, style: TextStyle(color: Colors.blue[700]),),
                  ),
                  onTap: () {

                  },
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
