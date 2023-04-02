import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_care/data/data_sources/shared_preferences/shared_preferences_manager.dart';
import 'package:share_care/presentation/view/login_page/login_page.dart';
import 'package:share_care/presentation/view_models/home_controller.dart';

import 'data/repositories/home_repo.dart';
import 'data/repositories_impl/home_repo_impl.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesManager();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,initialBinding: InitialBindings(),

      home:  LoginPage(),
    );
  }
}
class InitialBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeRepo>(() => HomepageRepoImpl(), fenix: true);
    Get.lazyPut(() => HomeController(Get.find()), fenix: true);
  }

}

