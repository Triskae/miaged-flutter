import 'package:Miaged/common/error.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'common/loading.dart';
import 'routing.dart';
import 'service-locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        // Fully loaded
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              initialRoute: '/',
              routes: routes
          );
        }

        // Meanwhile loading
        return Loading();
      },
    );
  }
}