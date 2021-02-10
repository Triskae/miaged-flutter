import 'package:Miaged/auth/forms/login-form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Form(child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   LoginForm()
                 ]
             ))
            ],
          ),
        ),
      ),
    );
  }
}