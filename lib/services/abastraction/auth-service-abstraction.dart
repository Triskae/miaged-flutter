import 'package:Miaged/common/models/login-register-response.dart';

abstract class AuthServiceAbstraction {
  Future<LoginRegisterResponse> checkIfAuthenticated ();
  Future<LoginRegisterResponse> tryConnection (String email, String password);
  Future<LoginRegisterResponse> registrateUser (String email, String password);
  Future<void> persistConnection(String uid, String email);
  String emailCheck(String emailToCheck);
  String passwordCheck(String passwordToCheck);
  Future<void> signOut();
}
