import 'package:flutter/material.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class PrimaryButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Color? textColor;
  final GestureTapCallback? onPress;
  final double? borderRadius;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? constrainedBox;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPress,
    required this.color,
    this.textColor,
    this.borderRadius,
    this.elevation,
    this.padding,
    this.margin,
    this.constrainedBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: color,
        ),
        width: constrainedBox!.widthConstraints().maxWidth,
        constraints: constrainedBox,
        margin: margin,
        // padding: padding,
        child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: textColor ?? Theme.of(context).primaryColor),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
              (states) => padding ?? EdgeInsets.zero,
            ),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => color ?? Colors.white),
            shape: MaterialStateProperty.resolveWith(
              (states) => RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
              ),
            ),
            elevation: MaterialStateProperty.all(elevation ?? 0),
          ),
        ),
      );
}
