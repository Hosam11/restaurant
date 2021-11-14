import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurant/screens/login/login_screen.dart';
import 'package:restaurant/screens/signup_screen.dart';

const loginScreen = '/login_screen';
const signupScreen = '/signup_screen';

final routes = <GetPage>[
  GetPage(name: loginScreen, page: () => const LoginScreen()),
  GetPage(name: signupScreen, page: () => const SignupScreen()),
];
