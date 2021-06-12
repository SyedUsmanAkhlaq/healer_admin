import 'package:flutter/material.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/utils/responsive.dart';

/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class DrawerItems extends StatefulWidget {
  final IconData icon;
  final String label;
  final Function onPress;

  const DrawerItems(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPress})
      : super(key: key);

  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (event) => setState(() => _hover = true),
        onExit: (event) => setState(() => _hover = false),
        child: InkWell(
          onTap: () => widget.onPress,
          child: Container(
            height: sizeConfig.height(.08),
            color: _hover ? Color(0xFFF5F7F9) : Colors.transparent,
            margin: EdgeInsets.only(
              // left: sizeConfig.width(.01),
              top: sizeConfig.height(.02),
              bottom: sizeConfig.height(.02),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: sizeConfig.width(.003),
                    color: _hover
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                  ),
                  SizedBox(
                    width: sizeConfig.width(.01),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      right: sizeConfig.width(.01),
                    ),
                    child: Icon(
                      widget.icon,
                      color:
                          _hover ? Theme.of(context).primaryColor : Colors.grey,
                    ),
                  ),
                  Responsive.isMobile(context)
                      ? Container()
                      : Text(
                          widget.label,
                          style: Theme.of(context).textTheme.button!.copyWith(
                                color: Color(0xFF43425D),
                              ),
                        ),
                ],
              ),
            ),
          ),
        ),
      );
}
