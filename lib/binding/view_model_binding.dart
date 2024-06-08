
import 'package:get/get.dart';
import 'package:wedevsdssignment/controllers/auth_controller.dart';
import 'package:wedevsdssignment/views/auth_screens/login_controller.dart';
import 'package:wedevsdssignment/views/auth_screens/registrasion_controller.dart';
import 'package:wedevsdssignment/views/cart_screens/cart_controller.dart';
import 'package:wedevsdssignment/views/category_screens/category_controller.dart';
import 'package:wedevsdssignment/views/dashboard_screens/dashboard_controller.dart';
import 'package:wedevsdssignment/views/home_screens/home_controller.dart';
import 'package:wedevsdssignment/views/profile_screens/profile_controller.dart';
import 'package:wedevsdssignment/views/search_screens/search_controller.dart';
import 'package:wedevsdssignment/views/spash_screens/splash_controller.dart';


class ViewModelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegistrasionController>(() => RegistrasionController(), fenix: true);
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
    Get.lazyPut<MySearchController>(() => MySearchController(), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);

    // Get.put(UserDi());
    // Get.put(NotificationControllerForApp());
  }
}