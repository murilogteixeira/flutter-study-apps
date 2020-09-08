class UserModel {
  String id;
  String nome;
  String email;
  String picture;
  String role;
  String token;

  UserModel({
    this.id,
    this.nome,
    this.email,
    this.picture,
    this.role,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    picture = json['picture'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['picture'] = this.picture;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
