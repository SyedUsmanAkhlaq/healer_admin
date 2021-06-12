import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healer_admin_panel/controllers/doctor_controller.dart';
import 'package:healer_admin_panel/utils/constants.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/responsive.dart';
import 'package:healer_admin_panel/widgets/doctor_list_tile.dart';
import 'package:healer_admin_panel/widgets/info_card.dart';
import 'package:healer_admin_panel/widgets/info_card_shimmer.dart';
import 'package:healer_admin_panel/widgets/logo.dart';
import 'package:healer_admin_panel/widgets/side_bar.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController(text: 'All');

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFeeeeee),
        appBar: _appBar(context),
        body: _body(context),
      );

  _appBar(BuildContext context) => AppBar(
        leading: FittedBox(
          fit: BoxFit.contain,
          child: Logo(),
        ),
        actions: [
          TextButton(
            onPressed: _refresh,
            child: Text(
              'Refresh',
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          SizedBox(
            width: sizeConfig.width(.03),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_alert,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            width: sizeConfig.width(.01),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            width: sizeConfig.width(.01),
          ),
        ],
      );

  _body(BuildContext context) => Container(
        child: Row(
          children: [
            SideBar(),
            Expanded(
              child: Column(
                children: [
                  _registrationInfo(context),
                  _filters(context),
                  Expanded(
                    child: GetBuilder<DoctorController>(
                      builder: (value) => FutureBuilder(
                        future: value.loadData(_controller.text),
                        builder: (context, snap) {
                          if (snap.connectionState == ConnectionState.waiting)
                            return FittedBox(
                              fit: BoxFit.scaleDown,
                              child: CircularProgressIndicator(),
                            );
                          return Container(
                            margin: EdgeInsets.symmetric(
                              vertical: sizeConfig.height(.015),
                              horizontal: sizeConfig.width(.02),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.doctors.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  DoctorListTile(
                                doctor: value.doctors[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  _registrationInfo(BuildContext context) => GetBuilder<DoctorController>(
        builder: (value) => FutureBuilder(
          future: value.loadCountInfo(),
          builder: (context, snap) {
            if (!snap.hasData)
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    3,
                    (index) => InfoCardShimmer(),
                  ),
                ),
              );
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.005),
              ),
              height: Responsive.isDesktop(context)
                  ? sizeConfig.height(.2)
                  : sizeConfig.height(.2),
              width: sizeConfig.width(.82),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
// scrollDirection: Axis.horizontal,
                children: List.generate(
                  value.countInfo.length,
                  (index) => InfoCard(
                      label: value.countInfo.keys
                          .elementAt(index)
                          .toString()
                          .toUpperCase(),
                      count: value.countInfo.values.elementAt(index).toString(),
                      color: colorsList[index]),
                ),
              ),
            );
          },
        ),
      );

  _filters(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: sizeConfig.width(.017),
        ),
        padding: EdgeInsets.symmetric(
          vertical: sizeConfig.height(.01),
        ),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.height(.02),
                vertical: sizeConfig.height(.01),
              ),
              child: Text(
                'Filters',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(
              width: sizeConfig.width(.08),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizeConfig.width(.01),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              height: sizeConfig.height(.04),
              width: sizeConfig.width(.25),
              constraints: BoxConstraints(
                minHeight: sizeConfig.height(.04),
                maxWidth: sizeConfig.width(.18),
              ),
              child: DropdownButton<String>(
                isDense: true,
                isExpanded: true,
                dropdownColor: Colors.white,
                underline: Container(),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
                items: typeList
                    .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(
                          value.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                    .toList(),
                value: _controller.text,
                onChanged: (String? value) {
                  setState(() => _controller.text = value!);
                  Get.find<DoctorController>().loadData(_controller.text);
                },
              ),
            ),
          ],
        ),
      );

  void _refresh() {
    Get.find<DoctorController>().loadData(_controller.text);
    Get.find<DoctorController>().loadCountInfo();
  }
}
