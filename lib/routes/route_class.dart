import 'package:get/get.dart';
import 'package:parkinn/Screens/add_vehicle_screen/add_vehicle_binding.dart';
import 'package:parkinn/Screens/add_vehicle_screen/add_vehicle_screen.dart';
import 'package:parkinn/Screens/auth_screen/auth_screen.dart';
import 'package:parkinn/Screens/auth_screen/auth_binding.dart';
import 'package:parkinn/Screens/history_screen/history_binding.dart';
import 'package:parkinn/Screens/history_screen/history_screen.dart';
import 'package:parkinn/Screens/home_screen/home_binding.dart';
import 'package:parkinn/Screens/home_screen/home_screen.dart';
import 'package:parkinn/Screens/splash_screen/splash_screen.dart';
import 'package:parkinn/Screens/splash_screen/splash_screen_binding.dart';
import 'package:parkinn/Screens/transaction_qr_screen/transaction_qr_screen.dart';

import '../Screens/transaction_qr_screen/transaction_qr_binding.dart';

class RouteClass {
  static List<GetPage> routes = [
    GetPage(
        name: '/authScreen',
        page: () => const AuthScreen(),
        binding: SetAuthBinding()),
    GetPage(
        name: '/homeScreen',
        page: () => HomeScreen(),
        binding: SetHomeBinding()),
    GetPage(
        name: '/addScreen',
        page: () => AddVehicleScreen(),
        binding: SetAddVehicleController()),
    GetPage(
        name: '/historyScreen',
        page: () => History(),
        binding: SetHistoryBinding()),
    GetPage(
        name: '/transactionQr',
        page: () => TransactionQr(),
        binding: SetTransactionQr()),
    GetPage(
        name: '/splashScreen' ,
        page: () => SplashScreen(),
        binding: SetSplashBinding())

  ];
}
