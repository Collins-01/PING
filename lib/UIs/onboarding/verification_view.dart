import 'package:flutter/material.dart';
import 'package:ping/UIs/onboarding/components/otp_field.dart';
import 'package:ping/UIs/onboarding/viewmodels/verification_viewmodel.dart';
import 'package:ping/Utils/app_colors.dart';
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
                        height: 60,
                      ),
                      const Text("Verification"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("We sent you an sms code"),
                      Text.rich(
                        TextSpan(text: "On number : ", children: [
                          TextSpan(
                              text: "+234 8163 509 379",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ))
                        ]),
                      ),
                      // const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          4,
                          (index) => const OTPField(),
                        ),
                      ),
                      Expanded(
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          children: [
                            ...List.generate(
                              model.numbers.length,
                              (index) => TextButton(
                                onPressed: () {},
                                child: Text(
                                  model.numbers[index].toString(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text('0'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
