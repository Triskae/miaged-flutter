import 'package:Miaged/common/models/login-register-response.dart';

abstract class AuthServiceAbstraction {
  bool checkIfAuthenticated ();
  Future<LoginRegisterResponse> tryConnection (String email, String password);
  Future<LoginRegisterResponse> registrateUser (String email, String password);
  void persistConnection();
  String emailCheck(String emailToCheck);
  String passwordCheck(String passwordToCheck);
}