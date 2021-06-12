import 'package:flutter/material.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:shimmer/shimmer.dart';

/// Created by Usman Akhlaq on 12.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class InfoCardShimmer extends StatelessWidget {
  const InfoCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(
          vertical: sizeConfig.height(.02),
          horizontal: sizeConfig.width(.01),
        ),
        height: sizeConfig.height(.16),
        width: sizeConfig.width(.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Color(0xFFeeeeee),
              highlightColor: Colors.grey[300]!,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.02),
                  vertical: sizeConfig.height(.02),
                ),
                height: sizeConfig.height(.04),
                width: sizeConfig.width(.15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(90),
                ),
              ),
            ),
            SizedBox(
              height: sizeConfig.height(.02),
            ),
            Shimmer.fromColors(
              baseColor: Color(0xFFeeeeee),
              highlightColor: Colors.grey[300]!,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: sizeConfig.width(.02),
                  // vertical: sizeConfig.height(.02),
                ),
                height: sizeConfig.height(.04),
                width: sizeConfig.width(.1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      );
}
