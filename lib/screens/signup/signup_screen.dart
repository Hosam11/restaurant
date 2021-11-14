import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:restaurant/constants/colors.dart';
import 'package:restaurant/constants/dimensions.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/screens/signup/signup_controller.dart';
import 'package:restaurant/shared_widgets/auth_header_widget.dart';
import 'package:restaurant/shared_widgets/custom_button.dart';
import 'package:restaurant/shared_widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fimber.i('-');
    return Scaffold(
      primary: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeaderWidget(title: signUp, isBackButton: true),
            GetBuilder<SignupController>(
              init: SignupController(),
              builder: (signupController) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: mediumPadding),
                child: Form(
                  key: signupController.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: mediumPadding),
                      // ------------- Username
                      CustomTextField(
                        hintText: userName,
                        onSaved: (v) {},
                        textInputAction: TextInputAction.next,
                        validator: signupController.validUserName,
                        controller: signupController.userNameController,
                      ),
                      const SizedBox(height: mediumPadding),
                      // ------------- Phone
                      CustomTextField(
                        hintText: yourPhone,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        controller: signupController.phoneController,
                        validator: signupController.validatePhone,
                      ),
                      const SizedBox(height: mediumPadding),
                      // ------------- Password
                      Obx(
                        () => CustomTextField(
                          hintText: password,
                          obscure: !signupController.visiblePsd,
                          validator: signupController.validatePassword,
                          textInputAction: TextInputAction.next,
                          controller: signupController.psdController,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              signupController.visiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGreyColor,
                            ),
                            onPressed: () =>
                                signupController.toggleVisiblePsd(),
                          ),
                        ),
                      ),
                      const SizedBox(height: mediumPadding),
                      // ------------- Confirm password
                      Obx(
                        () => CustomTextField(
                          hintText: confirmPassword,
                          obscure: !signupController.confirmVisiblePsd,
                          textInputAction: TextInputAction.done,
                          controller: signupController.confirmPsdController,
                          onFieldSubmitted: (s) =>
                              signupController.signupPressed(),
                          validator:
                              signupController.validatePsdConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              signupController.confirmVisiblePsd
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kGreyColor,
                            ),
                            onPressed: () =>
                                signupController.toggleConfirmVisiblePsd(),
                          ),
                        ),
                      ),
                      const SizedBox(height: mediumPadding),
                      // ------------- SignUp button
                      CustomButton(
                        title: signUp,
                        onTap: signupController.signupPressed,
                      ),
                      const SizedBox(height: mediumPadding),
                      const Text(
                        or,
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: mediumPadding),
                      // ------------- Facebook button
                      CustomButton(
                        title: continueWithFB,
                        onTap: signupController.continueWithFacebook,
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
