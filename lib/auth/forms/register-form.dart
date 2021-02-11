import 'package:Miaged/common/models/login-register-response.dart';
import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:flutter/material.dart';

import '../../service-locator.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  AuthServiceAbstraction _authService = locator<AuthServiceAbstraction>();
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.shopping_cart,
                size: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text("Créer un compte",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
            ),
            TextFormField(
                decoration:
                    InputDecoration(hintText: "Email ou nom d'utilisateur"),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  return _authService.emailCheck(value);
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
                  return _authService.passwordCheck(value);
                },
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                }),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: handleRegisterButton,
                  child: Text("Créer un compte")),
            )
          ],
        ));
  }

  void handleRegisterButton() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      LoginRegisterResponse response =
          await _authService.registrateUser(_email, _password);
      if (response.message.isNotEmpty) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(response.message)));
        Navigator.pop(context);
      } else {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Erreur inconnue')));
      }
    }
  }
}
