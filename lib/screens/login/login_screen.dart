import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/constants/dimensions.dart';
import 'package:restaurant/screens/login/login_controller.dart';
import 'package:restaurant/screens/login/widgets/have_account_widget.dart';
import 'package:restaurant/shared_widgets/auth_header_widget.dart';
import 'package:restaurant/shared_widgets/custom_button.dart';
import 'package:restaurant/shared_widgets/custom_text_field.dart';
import 'package:get/get.dart';

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
            GetBuilder<LoginController>(
              init: LoginController(),
              builder: (loginController) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
                child: Form(
                  key: loginController.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: mediumPadding),
                      // ------------- Phone
                      CustomTextField(
                        hintText: phone,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        controller: loginController.phoneController,
                        validator: loginController.validatePhone,
                        onSaved: (v) {},
                      ),
                      const SizedBox(height: mediumPadding),
                      // ------------- Password
                      Obx(
                        () => CustomTextField(
                          hintText: password,
                          obscure: !loginController.visiblePsd,
                          validator: loginController.validatePassword,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (v) =>
                              loginController.loginPressed(),
                          controller: loginController.psdController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              loginController.visiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGreyColor,
                            ),
                            onPressed: () => loginController.toggleVisiblePsd(),
                          ),
                        ),
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
                        onTap: loginController.loginPressed,
                      ),
                      const SizedBox(height: mediumPadding),
                      HaveAccountWidget(onSignupTap: loginController.goSignup),
                      const SizedBox(height: largePadding),
                      const Text(
                        or,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: mediumPadding),
                      CustomButton(
                        title: continueWithFB,
                        onTap: loginController.continueWithFacebook,
                        backgroundColor: kPurpleColor,
                        icon: const FaIcon(FontAwesomeIcons.facebookF),
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
