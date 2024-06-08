import 'package:get/get.dart';
import 'package:wedevsdssignment/views/cart_screens/cart_screen.dart';
import 'package:wedevsdssignment/views/category_screens/category_screen.dart';
import 'package:wedevsdssignment/views/dashboard_screens/dashboard_screen.dart';
import 'package:wedevsdssignment/views/search_screens/search_screen.dart';
import '../views/home_screens/home_screen.dart';
import '../views/auth_screens/login_screen.dart';
import '../views/profile_screens/profile_screen.dart';
import '../views/auth_screens/register_screen.dart';
import '../views/spash_screens/splash_screen.dart';
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
      name: AppRoutes.DashboardScreen,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.SearchScreen,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.CartScreen,
      page: () => CartScreen(),
    ),
    GetPage(
      name: AppRoutes.CategoryScreen,
      page: () => CategoryScreen(),
    ),
  ];
}
