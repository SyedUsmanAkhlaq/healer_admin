import 'package:healer_admin_panel/pages/edit_doc_profile.dart';
import 'package:healer_admin_panel/pages/main_page.dart';
import 'package:healer_admin_panel/pages/sign_in_page.dart';
import 'package:healer_admin_panel/pages/splash_screen_page.dart';
import 'package:qlevar_router/qlevar_router.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class AppRoutes {
  static String productsPage = 'ProductsPage';
  static String singleProductPage = 'SingleProductPage';

  final routes = [
    QRoute(
      path: '/',
      builder: () => SplashScreenPage(),
    ),
    QRoute(
      path: '/login',
      builder: () => SignInPage(),
    ),
    QRoute(
      path: '/main',
      builder: () => MainPage(),
      children: [
        QRoute(
          path: '/profile',
          builder: () => EditDocProfile(),
        ),
      ],
    ),
  ];
}
