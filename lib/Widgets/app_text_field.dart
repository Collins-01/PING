import 'package:flutter/material.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Utils/app_text_styles.dart';
import '../Extensions/context.dart' show IContext;

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  const AppTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      width: context.deviceWidth,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            offset: const Offset(3, 3),
            color: Colors.grey.withOpacity(.8),
            // color: AppColors.whiteColor,
            blurStyle: BlurStyle.outer,
            spreadRadius: 5,
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: AppColors.whiteColor,
      ),
      child: TextField(
        controller: controller,
        style: heading6SemiBoldStyle,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          border: InputBorder.none,
          hintText: hintText,
          labelText: labelText,
          labelStyle: heading5RegularStyle,
        ),
      ),
    );
  }
}
