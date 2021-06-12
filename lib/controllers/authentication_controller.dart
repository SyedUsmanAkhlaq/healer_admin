import 'package:get/get.dart';
import 'package:healer_admin_panel/utils/authentication_interface.dart';
import 'package:healer_admin_panel/utils/mixins.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class AuthenticationController extends GetxController with ProcessMixin {
  late String firebaseUserID;

  Future<bool> login(String email, String password) async {
    start();
    bool success = await AuthenticationInterface.login(email, password);
    stop();
    return success;
  }
}
