import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration:
                  InputDecoration(hintText: "Email ou nom d'utilisateur"),
              validator: (value) {
                return emailCheck(value);
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Mot de passe"),
              validator: (value) {
                return passwordCheck(value);
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: test,
                  child: Text("Se connecter")),
            )
          ],
        ));
  }

  void test() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "filipe.doutelsilva@hotmail.fr",
          password: "Rammstein1998@"
      );
      print(userCredential.user.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  String emailCheck(String value) {
    if (value.isEmpty) {
      return "L'email est obligatoire";
    }
    return null;
  }

  String passwordCheck(String value) {
    if (value.isEmpty) {
      return "L'email est obligatoire";
    }
    return null;
  }
}
