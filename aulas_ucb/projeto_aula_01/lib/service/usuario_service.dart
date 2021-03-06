import 'dart:async';
import 'dart:convert';

import 'package:catolica/domain/usuario.dart';
import 'package:catolica/stores/usuario_store.dart';
import 'package:catolica/utils/navigator_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioService {
  final UsuarioStore usuarioStore;
  StreamSubscription<StatusLogin> _statusLoginSubscription;
  SharedPreferences _preferences;

  UsuarioService(this.usuarioStore) {
    this._statusLoginSubscription = usuarioStore.statusSubject.listen((value) {
      if (value == StatusLogin.logado) {
        NavigatorUtils.nav.currentState.pushReplacementNamed("home");
      } else {
        NavigatorUtils.nav.currentState.pushReplacementNamed("login");
      }
    });
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  Future<Usuario> entrarComEmailSenha(String email, String senha) async {
    Usuario usuarioLogado = Usuario(nome: "Diego Ferreira", email: email);
    _preferences.setString("usuario_logado", jsonEncode(usuarioLogado.toJson()));
    usuarioStore.setUsuario(usuarioLogado);
    return Future.value(usuarioLogado);
  }

  Future<Usuario> criarUsuario(String nome, String email, String senha) {
    return Future.value(Usuario(nome: nome, email: email));
  }

  Future<void> logout() {
    _preferences.remove("usuario_logado");
    usuarioStore.setStatusLogin(StatusLogin.nao_logado);
  }

  Future<Usuario> verificarUsuarioAutenticado() async {
    return Future.delayed(Duration(seconds: 10), () {
      String usuarioStr = _preferences.getString("usuario_logado");
      if (usuarioStr != null) {
        Usuario usuarioLogado = Usuario.fromJson(jsonDecode(usuarioStr));
        usuarioStore.setUsuario(usuarioLogado);
        usuarioStore.setStatusLogin(StatusLogin.logado);
        return usuarioLogado;
      } else {
        usuarioStore.setStatusLogin(StatusLogin.nao_logado);
        return null;
      }
    });
  }

  void dispose() {
    _statusLoginSubscription.cancel();
  }
}
