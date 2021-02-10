import 'feed.dart';
import 'auth/login-screen.dart';
import 'auth/register-screen.dart';

final routes = {
  '/': (context) => new Feed(),
  '/login': (context) => new LoginScreen(),
  '/register': (context) => new RegisterScreen(),
};
