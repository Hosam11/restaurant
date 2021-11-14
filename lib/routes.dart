import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/screens.dart';

const loginScreen = '/login_screen';
const signupScreen = '/signup_screen';
const homeScreen = '/home_screen';

final routes = <GetPage>[
  GetPage(name: loginScreen, page: () => const LoginScreen()),
  GetPage(name: signupScreen, page: () => const SignupScreen()),
  GetPage(name: homeScreen, page: () => const HomeScreen()),
];
