import 'package:flutter_demo/home_page.dart';
import 'package:flutter_demo/pages/navs/nav_page.dart';
import 'package:flutter_demo/pages/navs/other_page.dart';

import 'package:flutter_demo/pages/navs/user_page.dart';
import 'package:flutter_demo/pages/states/state_page.dart';
import 'package:flutter_demo/pages/themes/theme_page.dart';
import 'package:flutter_demo/routes/app_routes.dart';
import 'package:get/route_manager.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => MyHomePage(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoutes.NAV,
      page: () => NavPage(),
    ),
    GetPage(
      name: AppRoutes.OTHER,
      page: () => OtherPage(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: AppRoutes.USER,
      page: () => UserPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: '${AppRoutes.USER}/:name',
      page: () => UserPage(),
    ),
    GetPage(
      name: AppRoutes.State,
      page: () => StatePage(),
    ),
    GetPage(
      name: AppRoutes.THEME,
      page: () => ThemePage(),
    ),
  ];
}
