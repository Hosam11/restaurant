import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/constants/colors.dart';

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(22),
  borderSide: const BorderSide(color: Colors.transparent),
);

class CustomTextField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChange;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final String hintText;
  final TextEditingController? controller;
  final bool obscure;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    this.onChange,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.textDirection,
    required this.hintText,
    this.controller,
    this.obscure = false,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: textDirection,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscure,
      onChanged: onChange,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: kOrangeColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        fillColor: kPingColor.withOpacity(.3),
        filled: true,
        hintText: hintText,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        hintStyle: const TextStyle(color: kGreyColor),
        suffixIcon: suffixIcon,
      ),
      onSaved: onSaved,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
