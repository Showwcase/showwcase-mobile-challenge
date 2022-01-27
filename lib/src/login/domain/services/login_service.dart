import 'package:flutter_challenge/src/login/domain/repository/login_repository.dart';

class LoginService implements LoginImpl {
  @override
  Future login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    return true;
  }
}
