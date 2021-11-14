import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:restaurant/screens/login/login_screen.dart';

const loginScreen = '/login_screen';

final routes = <GetPage>[
  GetPage(name: loginScreen, page: () => const LoginScreen()),
];
