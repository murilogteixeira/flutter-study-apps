import 'package:flutter/services.dart';
import 'package:projetoaula01/domain/User.dart';

class UserService {
  Future<User> login(String email, String password) {
    throw PlatformException(message: "Error");
  }
}