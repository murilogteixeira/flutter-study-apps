import 'package:app_masterclass_balta_io/model/user.model.dart';
import 'package:app_masterclass_balta_io/viewmodel/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(Duration(milliseconds: 1500));
    return UserModel(
      id: '1',
      nome: 'Murilo Teixeira',
      email: 'murilo@murilo.com',
      picture: 'https://picsum.photos/200',
      role: 'student',
      token: 'xpto',
    );
  }
}
