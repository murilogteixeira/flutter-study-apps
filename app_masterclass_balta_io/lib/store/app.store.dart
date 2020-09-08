import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  @observable
  String nome = '';
  @observable
  String email = '';
  @observable
  String picture = 'https://placehold.it/200';
  @observable
  String token = '';

  @action
  setUser(String nome, String email, String picture, String token) {
    this.nome = nome;
    this.email = email;
    this.picture = picture;
    this.token = token;
  }
}
