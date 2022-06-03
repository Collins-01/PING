import 'package:flutter/material.dart';

class OTPField extends StatelessWidget {
  const OTPField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: "*",
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
