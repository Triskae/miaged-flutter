import 'package:Miaged/common/models/login-register-response.dart';
import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends AuthServiceAbstraction {

  final String UID = "UID";
  final String EMAIL = "EMAIL";

  @override
  Future<LoginRegisterResponse> checkIfAuthenticated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String storedUid = prefs.getString(UID);
      final String storedEmail = prefs.getString(EMAIL);
      print(storedEmail);
      print(storedUid);
      if(storedUid != null) {
        // Logged in
        return new LoginRegisterResponse(true, null, storedUid, storedEmail);
      } else {
        // Not logged in
        return new LoginRegisterResponse(false, null, null, null);
      }
    } catch (e) {
      // Error
      return new LoginRegisterResponse(false, null, null, null);
    }
  }

  @override
  Future<void> persistConnection(String uid, String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(UID, uid);
    prefs.setString(EMAIL, email);
  }

  @override
  Future<LoginRegisterResponse> registrateUser(String email, String password) async {
   try {
     print("registrate");
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     print("done");
     return new LoginRegisterResponse(false, 'Veuillez maintenant vous connecter', null, null);
   } on FirebaseAuthException catch (e) {
     print(e.code);
   }
   return null;
  }

  @override
  Future<LoginRegisterResponse> tryConnection(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email,
          password: password);

      persistConnection(userCredential.user.uid, userCredential.user.email);
      return new LoginRegisterResponse(true, "", userCredential.user.uid, userCredential.user.email);

    } catch (e) {
      if (e.code == 'user-not-found') {
        return new LoginRegisterResponse(false, 'Email inconnu.', null, null);
      } else if (e.code == 'wrong-password') {
        return new LoginRegisterResponse(false, 'Le mot de passe est erroné.', null, null);
      } else {
        print(e.toString());
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
