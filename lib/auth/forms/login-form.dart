import 'package:Miaged/common/models/login-register-response.dart';
import 'package:Miaged/service-locator.dart';
import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
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
              child: Text("Connexion",
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
                  onPressed: handleConnectButton, child: Text("Se connecter")),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: GestureDetector(
                    child: Text("Créer un compte",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue)),
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    }))
          ],
        ));
  }

  void handleConnectButton() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      LoginRegisterResponse response =
          await _authService.tryConnection(_email, _password);
      if (response.isAllowedToEnterApp) {
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(response.userUID)));
      } else {
        if (response.message.isNotEmpty) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(response.message)));
        } else {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('Erreur inconnue')));
        }
      }
    }
  }
}
