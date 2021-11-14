import 'package:flutter/material.dart';
import 'package:restaurant/constants/strings.dart';
import 'package:restaurant/constants/dimensions.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({Key? key, this.onSignupTap}) : super(key: key);
  final VoidCallback? onSignupTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(doNotHaveAccount),
        const SizedBox(width: mediumPadding),
        InkWell(
          onTap: onSignupTap,
          child: const Text(
            signUp,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
