import 'package:Miaged/common/models/login-register-response.dart';
import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends AuthServiceAbstraction {
  @override
  bool checkIfAuthenticated() {
    // TODO: implement checkIfAuthenticated
    throw UnimplementedError();
  }

  @override
  bool persistConnection() {
    // TODO: implement persistCOnnection
    throw UnimplementedError();
  }

  @override
  Future<LoginRegisterResponse> registrateUser(String email, String password) {
    // TODO: implement registrateUser
    throw UnimplementedError();
  }

  @override
  Future<LoginRegisterResponse> tryConnection(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password);

      return new LoginRegisterResponse(true, "", userCredential.user.uid);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return new LoginRegisterResponse(false, 'Email inconnu.', null);
      } else if (e.code == 'wrong-password') {
        return new LoginRegisterResponse(false, 'Le mot de passe est erroné.', null);
      }
      return null;
    }

  }

  @override
  String emailCheck(String emailToCheck) {
    if (emailToCheck.isEmpty) {
      return "L'email est obligatoire";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(emailToCheck))
      return 'Email non valide';
    else
      return null;
  }

  @override
  String passwordCheck(String passwordToCheck) {
    if (passwordToCheck.isEmpty) {
      return "Le mot de passe est obligatoire";
    }
    return null;
  }

}