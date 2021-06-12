/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healer_admin_panel/utils/mixins.dart';

class ControllerDataLoader<T extends GetxController> extends StatelessWidget {
  final ContentBuilderCallback<T> contentBuilder;
  final Widget? loadingWidget;
  final Function? loader;

  const ControllerDataLoader(
      {required this.contentBuilder, this.loader, Key? key, this.loadingWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<T>(
        initState: (_) => loader,
        builder: (T controller) => ((controller as ProcessMixin).loading)
            ? Center(
                child: loadingWidget == null
                    ? CircularProgressIndicator()
                    : loadingWidget,
              )
            : contentBuilder(context, controller),
      );
}

typedef Widget ContentBuilderCallback<T>(BuildContext context, T controller);
