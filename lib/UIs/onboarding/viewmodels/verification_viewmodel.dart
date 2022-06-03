import 'package:flutter/material.dart';
import 'package:ping/Core/states/base_viewmodel.dart';

class VerificationViewModel extends BaseViewModel {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<OTPInfo> otpInfo = List.generate(
      4,
      (index) =>
          OTPInfo(controller: TextEditingController(), focusNode: FocusNode()));
}

class OTPInfo {
  TextEditingController controller;
  FocusNode focusNode;
  OTPInfo({required this.controller, required this.focusNode});
}
