import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    checkIfAuthenticated().then((success) {
      if (success) {
        Navigator.pushReplacementNamed(context, '/');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  checkIfAuthenticated() async {
    await Future.delayed(Duration(seconds: 5));  // could be a long running task, like a fetch from keychain
    return false;
  }
}