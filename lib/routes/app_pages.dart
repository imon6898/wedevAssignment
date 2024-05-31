import 'package:get/get.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';
import '../views/profile_screen.dart';
import '../views/register_screen.dart';
import '../views/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final list = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
