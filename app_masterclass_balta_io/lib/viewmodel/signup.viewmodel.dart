class SignupViewModel {
  String nome = '';
  String email = '';
  String senha = '';
  bool busy = false;

  @override
  String toString() => 'Nome: $nome, Email: $email, Senha: $senha';
}
