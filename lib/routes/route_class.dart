import 'package:get/get.dart';
import 'package:parkinn/Screens/auth_screen/auth_screen.dart';
import 'package:parkinn/Screens/auth_screen/auth_binding.dart';

class RouteClass {
  static List<GetPage> routes = [
    GetPage(
        name: '/authScreen',
        page: () => const AuthScreen(),
        binding: SetAuthBinding()
    ),
  ];
}
