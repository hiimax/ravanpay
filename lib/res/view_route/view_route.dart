import '../import/import.dart';

class RouteNames {
  // All veiw route names
  static const splash = 'splash';
  static const signup = 'signup';
  static const login = 'login';
  static const home = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),

    // signup: (context) => SignupScreen1(),
    // login: (context) => LoginScreen(),
  };
}
