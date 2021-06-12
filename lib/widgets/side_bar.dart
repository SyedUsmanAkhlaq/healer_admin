import 'package:flutter/material.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/responsive.dart';

import 'drawer_items.dart';

/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(
          maxWidth: Responsive.isMobile(context)
              ? sizeConfig.width(.1)
              : sizeConfig.width(.18),
        ),
        margin: EdgeInsets.only(
          top: sizeConfig.height(.01),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Responsive.isMobile(context) ? 5 : 15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerItems(
              icon: Icons.leaderboard_rounded,
              label: 'Dashboard',
              onPress: () {},
            ),
            DrawerItems(
              icon: Icons.dashboard_rounded,
              label: 'Appointments',
              onPress: () {},
            ),
            DrawerItems(
              icon: Icons.person_rounded,
              label: 'Registration',
              onPress: () {},
            ),
          ],
        ),
      );
}
