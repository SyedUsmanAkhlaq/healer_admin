import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healer_admin_panel/controllers/authentication_controller.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/widgets/logo.dart';
import 'package:healer_admin_panel/widgets/primary_button.dart';
import 'package:healer_admin_panel/widgets/process_handler.dart';
import 'package:qlevar_router/qlevar_router.dart';

/// Created by Usman Akhlaq on 09.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
      ProcessHandler<AuthenticationController>(
        child: Scaffold(
          body: _body(context),
        ),
      );

  _body(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.02),
                ),
                child: Text(
                  'Welcome to Admin Panel',
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 25,
                      ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: sizeConfig.width(.6),
                  minWidth: sizeConfig.width(.3),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.05),
                ),
                child: TextFormField(
                  controller: _emailController,
                  style: Theme.of(context).textTheme.headline5,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String? input) => input == null || input.isEmpty
                      ? "Please enter your email address."
                      : input.contains(
                              RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
                          ? null
                          : "Please enter a valid email address.",
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: sizeConfig.width(.6),
                  minWidth: sizeConfig.width(.3),
                ),
                margin: EdgeInsets.symmetric(
                  vertical: sizeConfig.height(.01),
                  horizontal: sizeConfig.width(.05),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: Theme.of(context).textTheme.headline5,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (String? input) =>
                      input!.isEmpty ? "Please enter your password." : null,
                ),
              ),
              PrimaryButton(
                label: 'Login',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                borderRadius: 10,
                margin: EdgeInsets.only(
                  top: sizeConfig.height(.05),
                ),
                padding: EdgeInsets.symmetric(
                  // horizontal: sizeConfig.width(.3),
                  vertical: sizeConfig.height(.03),
                ),
                constrainedBox: BoxConstraints(
                  maxWidth: sizeConfig.width(.6),
                  minWidth: sizeConfig.width(.3),
                ),
                onPress: _login,
              )
            ],
          ),
        ),
      );

  void _login() async {
    if (_formKey.currentState!.validate()) {
      bool success = await Get.find<AuthenticationController>()
          .login(_emailController.text, _passwordController.text);
      if (success) QR.to('/main');
    }
  }
}
