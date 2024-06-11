import 'package:coffeskuyapp/pages/account_pages/account_screen.dart';
import 'package:coffeskuyapp/pages/home_screen.dart';
import 'package:coffeskuyapp/pages/controller/home_controller.dart';
import 'package:coffeskuyapp/pages/login_screen.dart';
import 'package:coffeskuyapp/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:coffeskuyapp/pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:coffeskuyapp/routes/pages_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.jaldiTextTheme(
          Theme.of(context).textTheme
        )

      ),

      home:LoginScreen(),
      getPages: PageRouteApp.pages,
//      routes: {
//        '/search': (context) => SearchScreen(),
//        '/home': (context) => HomeScreen(),
//        '/akun':(context) => AccountPage(),
//      },
    );
  }
}
