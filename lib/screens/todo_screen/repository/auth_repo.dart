import 'package:drewardsystem/screens/todo_screen/model/auth_model.dart';

abstract class AuthRepo {
  AuthModel? authenticated(String name, String password);
  String logout();
}

class ApiAuthRepo implements AuthRepo {
  @override
  String logout() {
    return 'logout';
  }

  @override
  AuthModel? authenticated(String name, String password) {
    if (name == 'admin' && password == '123456') {
      return AuthModel(user: name);
    }
    return null;
  }
}

class TestAuthRepo implements AuthRepo {
  @override
  String logout() {
    return 'out';
  }

  @override
  AuthModel? authenticated(String name, String password) {
    if (name == 'user01' && password == '123456') {
      return AuthModel(user: name);
    }
    return null;
  }
}
