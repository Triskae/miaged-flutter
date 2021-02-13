import 'package:Miaged/services/abastraction/auth-service-abstraction.dart';
import 'package:flutter/material.dart';

import '../service-locator.dart';

class Splashscreen extends StatelessWidget {
  AuthServiceAbstraction _authService = locator<AuthServiceAbstraction>();
  @override
  Widget build(BuildContext context) {
    _authService.checkIfAuthenticated().then((response) {
      print(response);
      if (response.isAllowedToEnterApp) {
        Navigator.pushReplacementNamed(context, '/feed');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }
}