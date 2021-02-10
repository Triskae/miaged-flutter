import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Email ou nom d'utilisateur"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return emailCheck(value);
                },
                onSaved: (value) {
                  setState(() {
                    _email = value;
                  });
                }),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(hintText: "Mot de passe"),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) {
                  return passwordCheck(value);
                },
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                }),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child:
                  ElevatedButton(onPressed: test, child: Text("Se connecter")),
            )
          ],
        ));
  }

  void test() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email,
                password: _password);
        print(userCredential.user.uid);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  String emailCheck(String value) {
    if (value.isEmpty) {
      return "L'email est obligatoire";
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Email non valide';
    else
      return null;
  }

  String passwordCheck(String value) {
    if (value.isEmpty) {
      return "L'email est obligatoire";
    }
    return null;
  }
}
