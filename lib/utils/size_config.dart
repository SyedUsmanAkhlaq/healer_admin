import 'package:flutter/material.dart';

class SizeConfig {
  double _deviceHeight;
  double _deviceWidth;
  EdgeInsets _safeArea;

  SizeConfig._internal(this._deviceHeight, this._deviceWidth, this._safeArea);

  static SizeConfig init(context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final double deviceHeight = mediaQuery.size.height;
    final double deviceWidth = mediaQuery.size.width;
    final EdgeInsets safeArea = mediaQuery.padding;
    return SizeConfig._internal(deviceHeight, deviceWidth, safeArea);
  }

  double height(double size) {
    return _deviceHeight * size;
  }

  double width(double size) {
    return _deviceWidth * size;
  }

  EdgeInsets get safeArea => this._safeArea;
}
