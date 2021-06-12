import 'package:flutter/material.dart';
import 'package:healer_admin_panel/utils/globals.dart';

/// Created by Usman Akhlaq on 16.03.2021
/// Copyright © 2021 Syed Usman All rights reserved.
/// Email: uakhlaq88@gmail.com

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: sizeConfig.height(.04),
      ),
      height: sizeConfig.height(.2),
      width: sizeConfig.height(.2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(90),
      ),
      child: Center(
        child: Text(
          'Logo',
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
