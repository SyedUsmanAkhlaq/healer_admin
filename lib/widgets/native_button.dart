import 'package:flutter/material.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/responsive.dart';

/// Created by Usman Akhlaq on 12.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class NativeButton extends StatelessWidget {
  final String label;
  final Color color;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? borderColor;
  final Color? hoverColor;
  final Color? splashColor;
  final GestureTapCallback onPress;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const NativeButton(
      {Key? key,
      required this.label,
      required this.color,
      this.textColor,
      required this.onPress,
      this.borderRadius,
      this.elevation,
      this.padding,
      this.margin,
      this.borderColor,
      this.height,
      this.width,
      this.hoverColor,
      this.splashColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        constraints: BoxConstraints(
          minWidth: Responsive.isMobile(context) ? sizeConfig.width(.2) : 0,
        ),
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
          color: Colors.transparent,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          child: MaterialButton(
            hoverColor: hoverColor,
            // focusColor: Color(0xFF5e8b7e),
            // highlightColor: Color(0xFF5e8b7e),
            splashColor: splashColor,
            padding: padding,
            minWidth: width,
            height: height,
            onPressed: onPress,
            child: Center(
              child: Text(
                label,
                maxLines: 1,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: textColor ?? Colors.white,
                    ),
              ),
            ),
          ),
        ),
      );
}
