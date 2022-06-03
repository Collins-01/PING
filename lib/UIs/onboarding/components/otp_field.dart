import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPField extends StatelessWidget {
  final TextEditingController controller;
  Function(String)? onChanged;
  // final FocusNode focusNode;
  OTPField({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        // focusNode: focusNode,
        obscureText: true,
        obscuringCharacter: "*",
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: const TextStyle(fontSize: 28),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            offset: const Offset(3, 3),
            color: Colors.grey.withOpacity(.9),
            // color: AppColors.whiteColor,
            blurStyle: BlurStyle.outer,
            spreadRadius: 5,
          )
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
