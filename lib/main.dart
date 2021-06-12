import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:healer_admin_panel/utils/app_theme.dart';
import 'package:healer_admin_panel/utils/routes.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() {
  QR.setUrlStrategy();
  runApp(AdminPanel());
}

class AdminPanel extends StatelessWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp.router(
        title: 'Usman\'s Portfolio',
        theme: AppTheme.data(),
        debugShowCheckedModeBanner: false,
        routeInformationParser: QRouteInformationParser(),
        routerDelegate: QRouterDelegate(
          AppRoutes().routes,
          initPath: '/',
        ),
      );
}
