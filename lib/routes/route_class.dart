import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_screen.dart';
import 'package:parkinn/Screens/auth_screen/auth_binding.dart';
import 'package:parkinn/Screens/home_screen/home_binding.dart';
import 'package:parkinn/Screens/home_screen/home_screen.dart';

class RouteClass {
  static List<GetPage> routes = [
    GetPage(
        name: '/authScreen',
        page: () => const AuthScreen(),
        binding: SetAuthBinding()),
    GetPage(
        name: '/homeScreen',
        page: () => HomeScreen(),
        binding: SetHomeBinding())
  ];
}
