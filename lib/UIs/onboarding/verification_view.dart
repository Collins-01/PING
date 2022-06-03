import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ping/UIs/onboarding/components/otp_field.dart';
import 'package:ping/UIs/onboarding/viewmodels/verification_viewmodel.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Utils/app_text_styles.dart';
import 'package:ping/Widgets/app_text.dart';
import 'package:stacked/stacked.dart';
import '../../Extensions/context.dart' show IContext;

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerificationViewModel>.reactive(
        viewModelBuilder: () => VerificationViewModel(),
        builder: (_, model, child) => Scaffold(
              backgroundColor: AppColors.scaffoldBgColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      AppText.heading4R("Verification"),
                      const SizedBox(
                        height: 20,
                      ),
                      AppText.heading3SB("We sent you an sms code"),
                      Text.rich(
                        TextSpan(
                            text: "On number : ",
                            style: textFieldSemiBoldStyle,
                            children: [
                              TextSpan(
                                text: "+234 8163 509 379",
                                style: textFieldSemiBoldStyle.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              )
                            ]),
                      ),
                      // const Spacer(),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          model.otpInfo.length,
                          (index) => OTPField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                                // FocusScope.of(context).previousFocus();
                              }
                            },
                            controller: model.otpInfo[index].controller,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.deviceHeight / 10),
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: AppText.textFieldM(
                              "Didn't get a code?",
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
