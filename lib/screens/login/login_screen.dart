import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/constants/dimensions.dart';
import 'package:restaurant/screens/login/widgets/have_account_widget.dart';
import 'package:restaurant/shared_widgets/auth_header_widget.dart';
import 'package:restaurant/shared_widgets/custom_button.dart';
import 'package:restaurant/shared_widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeaderWidget(title: signIn),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: mediumPadding),
                  CustomTextField(
                    hintText: userName,
                    onSaved: (v) {},
                  ),
                  const SizedBox(height: mediumPadding),
                  CustomTextField(
                    hintText: password,
                    obscure: true,
                    onSaved: (v) {},
                  ),
                  const SizedBox(height: mediumPadding),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      forgetPassword,
                      style: TextStyle(color: kGreyColor),
                    ),
                  ),
                  const SizedBox(height: mediumPadding),
                  CustomButton(
                    title: login,
                    onTap: () {},
                  ),
                  const SizedBox(height: mediumPadding),
                  HaveAccountWidget(onSignupTap: () {}),
                  const SizedBox(height: largePadding),
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
