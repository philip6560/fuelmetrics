import '../modules/AddScreen/views/add_driver_view.dart';
import '../modules/EditScreen/views/edit_driver_view.dart';
import 'package:fuelmetrics_test/splash_view.dart';
import 'package:get/get.dart';

import '../modules/HomeScreen/views/home_view.dart';
import '../modules/LoginScreen/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: _Paths.ADD_DRIVER_SCREEN,
      page: () => const AddDriverView(),
    ),
    GetPage(
      name: _Paths.EDIT_DRIVER_SCREEN,
      page: () => const EditDriverView(),
    ),
  ];
}
