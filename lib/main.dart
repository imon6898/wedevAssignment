import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/binding/view_model_binding.dart';
import 'package:wedevsdssignment/routes/app_pages.dart';
import 'package:wedevsdssignment/routes/app_routes.dart';
import 'package:wedevsdssignment/services/cache/cache_manager.dart';

import 'utils/text_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.initAuth((prefs){
    print("setToken = ${CacheManager.token}");
  });
  await initSecureStorage();
  runApp(MyApp());
}

Future<void> initSecureStorage() async {
  final secureStorage = FlutterSecureStorage();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: TextConst(),
      locale: const Locale('en', 'UK'),
      title: 'WeDevs Assignment',
      initialBinding: ViewModelBinding(),
      initialRoute: CacheManager.token.isEmpty? AppRoutes.loginScreen : AppRoutes.DashboardScreen,
      getPages: AppPages.list,
    );
  }
}
