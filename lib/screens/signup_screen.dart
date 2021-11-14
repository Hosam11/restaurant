import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/constants/dimensions.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/shared_widgets/auth_header_widget.dart';
import 'package:restaurant/shared_widgets/custom_button.dart';
import 'package:restaurant/shared_widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeaderWidget(title: signUp, isBackButton: true),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
              child: Column(
                children: [
                  const SizedBox(height: mediumPadding),
                  CustomTextField(
                    hintText: userName,
                    onSaved: (v) {},
                  ),
                  const SizedBox(height: mediumPadding),
                  CustomTextField(
                    hintText: phone,
                    onSaved: (v) {},
                  ),
                  const SizedBox(height: mediumPadding),
                  CustomTextField(
                    hintText: password,
                    obscure: true,
                    onSaved: (v) {},
                  ),
                  const SizedBox(height: mediumPadding),
                  CustomButton(
                    title: signUp,
                    onTap: () {},
                  ),
                  const SizedBox(height: mediumPadding),
                  const Text(
                    or,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: mediumPadding),
                  CustomButton(
                    title: continueWithFB,
                    onTap: () {},
                    backgroundColor: kPurpleColor,
                    icon: const FaIcon(FontAwesomeIcons.facebookF),
                  ),
                  const SizedBox(height: 70),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
