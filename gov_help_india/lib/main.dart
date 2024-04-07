import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gov_help_india/features/authentication/views/auth.dart';
import 'package:gov_help_india/navigation_menu.dart';
import 'package:gov_help_india/services/repository/auth_repo.dart';
import 'common/loader/circular_loader.dart';
import 'firebase_options.dart';
import 'package:gov_help_india/utils/theme/theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
  Get.put(AuthenticationRepository());
  }) ;

  // init storage
  await GetStorage.init();


  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home:NavigationMenu()
    );
  }
}

