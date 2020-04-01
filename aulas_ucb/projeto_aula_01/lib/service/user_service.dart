import 'package:projetoaula01/domain/user.dart';

class UserService {
  Future<User> login(String email, String password) {
    return Future.value(User(name: "Murilo", email: "murilogteixeira@gmail.com"));
  }
  Future<User> criarUsuario(String nome, String email, String password) {
    return Future.value(User(name: nome, email: email));
  }
}