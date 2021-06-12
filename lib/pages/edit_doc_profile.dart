import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healer_admin_panel/utils/constants.dart';
import 'package:healer_admin_panel/utils/globals.dart';
import 'package:healer_admin_panel/widgets/image_tile.dart';

/// Created by Usman Akhlaq on 12.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class EditDocProfile extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _clinicNameController = TextEditingController();
  final TextEditingController _clinicAddressController =
      TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _studyController = TextEditingController();
  final TextEditingController _practiceController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();

  EditDocProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _body(context),
      );

  _body(BuildContext context) => Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text('Profile Image'),
                  ImageTile(imageURL: url),
                ],
              ),
            ),
          ],
        ),
      );

  _infoRow1(BuildContext context) => Column(
        children: [
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
              controller: _titleController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              validator: (String? input) =>
                  input == null || input.isEmpty ? 'Please enter title' : null,
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
                controller: _nameController,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
                validator: (String? input) => input == null || input.isEmpty
                    ? "Please enter full name."
                    : null),
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
                  ? "Please enter  email address."
                  : input.contains(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"))
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
              controller: _phoneController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
              validator: (String? input) =>
                  input == null || input.isEmpty || !input.isNum
                      ? 'Please enter Phone Number'
                      : null,
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
              controller: _registrationController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Registration Number',
              ),
              validator: (String? input) => input == null || input.isEmpty
                  ? 'Please enter Registration Number'
                  : null,
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
              controller: _clinicNameController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Clinic Name',
              ),
              validator: (String? input) => input == null || input.isEmpty
                  ? 'Please enter Clinic Name'
                  : null,
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
              controller: _clinicAddressController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Clinic Address',
              ),
              validator: (String? input) => input == null || input.isEmpty
                  ? 'Please enter Clinic Address'
                  : null,
            ),
          ),
        ],
      );

  _infoRow2(BuildContext context) => Column(
        children: [
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
              controller: _countryController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Country',
              ),
              validator: (String? input) => input == null || input.isEmpty
                  ? 'Please enter country name'
                  : null,
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
                controller: _provinceController,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  labelText: 'Province',
                ),
                validator: (String? input) => input == null || input.isEmpty
                    ? "Please enter province name."
                    : null),
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
              controller: _cityController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'City',
              ),
              validator: (String? input) =>
                  input == null || input.isEmpty ? 'Please enter city' : null,
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
              controller: _genderController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
              validator: (String? input) =>
                  input == null || input.isEmpty ? 'Please enter Gender' : null,
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
              controller: _practiceController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Practicing Domain',
              ),
              validator: (String? input) => input == null || input.isEmpty
                  ? 'Please enter Practicing Domain'
                  : null,
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
              controller: _studyController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Study',
              ),
              validator: (String? input) =>
                  input == null || input.isEmpty ? 'Please enter Study' : null,
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
              controller: _experienceController,
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                labelText: 'Experience',
              ),
              validator: (String? input) => input == null || input.isEmpty
                  ? 'Please enter Experience'
                  : null,
            ),
          ),
        ],
      );
}
