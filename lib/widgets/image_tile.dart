import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:healer_admin_panel/utils/globals.dart';

/// Created by Usman Akhlaq on 12.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class ImageTile extends StatelessWidget {
  final imageURL;

  const ImageTile({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageURL,
      (int _) => ImageElement()..src = imageURL,
    );
    return Container(
      height: sizeConfig.height(.13),
      width: sizeConfig.height(.13),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: HtmlElementView(
            viewType: imageURL,
          ),
        ),
      ),
    );
  }
}
