import 'package:app_masterclass_balta_io/model/user.model.dart';
import 'package:app_masterclass_balta_io/repository/account.repository.dart';
import 'package:app_masterclass_balta_io/viewmodel/signup.viewmodel.dart';

class SignUpController {
  AccountRepository repository;

  SignUpController() {
    repository = AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await repository.createAccount(model);
    model.busy = false;
    return user;
  }
}
