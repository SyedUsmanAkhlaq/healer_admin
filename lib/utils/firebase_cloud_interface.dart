import 'package:cloud_functions/cloud_functions.dart';
import 'models.dart';

/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class CloudInterface {
  static final FirebaseFunctions _firebaseFunctions =
      FirebaseFunctions.instanceFor(region: 'asia-south1');

  static Future<bool> createMongodbDoc(Doctor doctor) async {
    try {
      HttpsCallable callable = _firebaseFunctions.httpsCallable('enterData');
      await callable.call(doctor.toJSON());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<List<Doctor>> docByStatus(String type) async {
    try {
      HttpsCallable callable =
          _firebaseFunctions.httpsCallable('docListByStatus');
      final result = await callable.call(type);
      List<Doctor> docList = [];
      result.data?.forEach((element) {
        docList.add(Doctor.fromJSON(element));
      });
      print(docList);
      return docList;
    } catch (e, s) {
      print('Cloud Interface: docByStatus: $e,$s');
      return [];
    }
  }

  static Future<Map> countInfo() async {
    try {
      HttpsCallable callable = _firebaseFunctions.httpsCallable('countInfo');
      final result = await callable.call();
      Map map = result.data;
      print('This is Map: ${result.data}');
      return map;
    } catch (e, s) {
      print('Cloud Interface: CountInfo: $e,$s');
      return {};
    }
  }

  static Future<bool> approveDoc(Map map) async {
    try {
      HttpsCallable callable =
          _firebaseFunctions.httpsCallable('updateDocStatus');
      await callable.call(map);
      return true;
    } catch (e, s) {
      print('Cloud Interface: CountInfo: $e,$s');
      return false;
    }
  }
}
