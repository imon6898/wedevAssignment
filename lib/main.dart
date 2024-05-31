import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:wedevsdssignment/routes/app_pages.dart';
import 'package:wedevsdssignment/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'weDevs Assignment',
      initialRoute: AppRoutes.registerScreen,
      getPages: AppPages.list,
    );
  }
}
