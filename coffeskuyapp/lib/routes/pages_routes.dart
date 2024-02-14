import 'package:coffeskuyapp/pages/home_screen.dart';
import 'package:coffeskuyapp/pages/data_screen.dart';
import 'package:coffeskuyapp/routes/route_name.dart';
import 'package:coffeskuyapp/pages/account_pages/account_screen.dart';
import 'package:coffeskuyapp/pages/login_screen.dart';
import 'package:coffeskuyapp/pages/register_screen.dart';
import 'package:get/get.dart';

class PageRouteApp {
  static final pages = [
    GetPage(
      name: RouteName.home_screen,
      page: () => HomeScreen(),
    ), // GetPage
    GetPage(
      name: RouteName.data_screen,
      page: () => DataScreen(),
    ), // GetPage
    GetPage(
      name: RouteName.profile_screen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: RouteName.login_screen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.register_screen,
      page: () => RegisterScreen(),
    ),    // GetPage
  ];
}