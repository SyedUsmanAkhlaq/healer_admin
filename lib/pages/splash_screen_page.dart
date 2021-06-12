import 'package:flutter/material.dart';
import 'package:healer_admin_panel/controllers/authentication_controller.dart';
import 'package:healer_admin_panel/controllers/doctor_controller.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/size_config.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:get/get.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.put<DoctorController>(DoctorController());
    Future.delayed(
        Duration(seconds: 0), () => QR.to('/main/profile') //QR.to('/main'),
        );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeConfig = SizeConfig.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(),
      );

  _body() => Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
