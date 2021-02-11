import 'package:Miaged/auth/splashscreen.dart';

import 'feed.dart';
import 'auth/login-screen.dart';
import 'auth/register-screen.dart';

final routes = {
  '/': (context) => new Feed(),
  '/login': (context) => new LoginScreen(),
  '/register': (context) => new RegisterScreen(),
  '/splashscreen': (context) => new Splashscreen(),
};
