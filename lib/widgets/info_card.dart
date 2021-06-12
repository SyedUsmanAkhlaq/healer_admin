import 'package:flutter/material.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/responsive.dart';

/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class InfoCard extends StatelessWidget {
  final String label;
  final String count;
  final Color color;
  const InfoCard(
      {Key? key, required this.label, required this.count, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          vertical: sizeConfig.height(.02),
          horizontal: sizeConfig.width(.01),
        ),
        width: sizeConfig.width(.25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: sizeConfig.height(.02),
                right: sizeConfig.width(.02),
                left: sizeConfig.width(.02),
                bottom: sizeConfig.height(.04),
              ),
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 18,
                      color: Color(0xFF707070),
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    // vertical: sizeConfig.height(.02),
                    horizontal: sizeConfig.width(.02),
                  ),
                  child: Text(
                    count,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color: Colors.black87,
                        ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: sizeConfig.width(.02),
                  ),
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => FittedBox(
                        fit: BoxFit.contain,
                        child: Icon(
                          Icons.leaderboard,
                          size: (Responsive.isDesktop(context)) ? 30 : 15,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
}
