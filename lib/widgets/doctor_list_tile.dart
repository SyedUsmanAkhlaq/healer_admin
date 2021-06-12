import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healer_admin_panel/controllers/doctor_controller.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/models.dart';
import 'package:healer_admin_panel/widgets/image_tile.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'native_button.dart';

/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class DoctorListTile extends StatelessWidget {
  final Doctor doctor;

  const DoctorListTile({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.02),
          vertical: sizeConfig.height(.01),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.02),
        ),
        child: Row(
          children: [
            ImageTile(imageURL: doctor.profileImage),
            Expanded(
              child: _details(context),
            ),
            Spacer(),
            _actions(context),
          ],
        ),
      );

  /// Widgets
  _details(BuildContext context) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.01),
                horizontal: sizeConfig.width(.02),
              ),
              child: Text(
                doctor.fullName,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.01),
                horizontal: sizeConfig.width(.02),
              ),
              child: Text(
                'City:' + doctor.city,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.01),
                horizontal: sizeConfig.width(.02),
              ),
              child: Text(
                'Phone Number: ' + doctor.phone,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: sizeConfig.height(.01),
                horizontal: sizeConfig.width(.02),
              ),
              child: Text(
                'Clinic Address: ' + doctor.clinicAddress,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      );

  _actions(BuildContext context) => Container(
        child: Column(
          children: [
            NativeButton(
              label: 'Edit',
              height: sizeConfig.height(.05),
              width: sizeConfig.width(.09),
              color: Colors.white,
              textColor: Colors.black,
              hoverColor: Color(0xFFa7c4bc),
              splashColor: Color(0xFFcee5d0),
              borderRadius: 5,
              borderColor: Theme.of(context).primaryColor,
              onPress: () => QR.to('/main/profile'),
            ),
            SizedBox(
              height: sizeConfig.height(.02),
            ),
            NativeButton(
              label: 'Approve',
              height: sizeConfig.height(.05),
              width: sizeConfig.width(.09),
              color: Colors.white,
              textColor: Colors.black,
              hoverColor: Color(0xFFa7c4bc),
              splashColor: Color(0xFFcee5d0),
              borderRadius: 5,
              borderColor: Theme.of(context).primaryColor,
              onPress: _approveDoctor,
            )
          ],
        ),
      );

  void _approveDoctor() {
    print(doctor.id);
    Map map = {
      '_id': doctor.id,
      'status': true,
    };
    Get.find<DoctorController>().approveDoc(map);
  }
}
