import 'package:Miaged/app-frame.dart';
import 'package:Miaged/auth/splashscreen.dart';
import 'package:Miaged/feed/detail.dart';

import 'feed/feed.dart';
import 'auth/login-screen.dart';
import 'auth/register-screen.dart';

final routes = {
  '/': (context) => new Splashscreen(),
  '/login': (context) => new LoginScreen(),
  '/register': (context) => new RegisterScreen(),
  '/feed': (context) => new MainFrame(),
  '/detail': (context) => new Detail(),
};
