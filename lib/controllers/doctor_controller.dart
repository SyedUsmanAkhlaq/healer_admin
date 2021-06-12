import 'package:get/get.dart';
import 'package:healer_admin_panel/utils/firebase_cloud_interface.dart';
import 'package:healer_admin_panel/utils/mixins.dart';
import 'package:healer_admin_panel/utils/models.dart';

/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class DoctorController extends GetxController with ProcessMixin {
  late List<Doctor> _doctors;
  late Map _countInfo;

  List<Doctor> get doctors => _doctors;
  Map get countInfo => _countInfo;

  set doctors(List<Doctor> doctors) {
    _doctors = doctors;
    update();
  }

  set countInfo(Map countInfo) {
    _countInfo = countInfo;
    update();
  }

  Future loadData(String status) async {
    return _doctors = await CloudInterface.docByStatus(status);
  }

  Future loadCountInfo() async {
    return _countInfo = await CloudInterface.countInfo();
  }

  void approveDoc(Map map) async {
    start();
    await CloudInterface.approveDoc(map);
    stop();
  }
}
