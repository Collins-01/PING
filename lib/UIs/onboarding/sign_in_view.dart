import 'package:flutter/material.dart';
import 'package:ping/UIs/onboarding/viewmodels/signIn_viewmodel.dart';
import 'package:ping/Widgets/app_text.dart';
import 'package:stacked/stacked.dart';
import '../../Extensions/context.dart' show IContext;
// import 'package:ping/Core/Models/user_model.dart';
// import 'package:ping/Core/Services/auth_service.dart';
// import 'package:ping/UIs/home/messages_view.dart';
import 'package:ping/Utils/app_colors.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
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
                AppText.heading4R("Welcome"),
                const SizedBox(
                  height: 20,
                ),
                AppText.heading3SB(
                  "Please fill in your mobile number to Get Started!",
                  maxlines: 3,
                ),
                SizedBox(
                  height: context.deviceHeight / 5,
                ),
                Container(
                  height: 56,
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.flag),
                        const Icon(Icons.keyboard_arrow_down_rounded),
                        Container(
                          height: 30,
                          width: 0.5,
                          color: Colors.black,
                        ),
                        const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              border: InputBorder.none,
                              hintText: "+234  8163 509 379",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight / 10,
                ),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => model.toVerificationView(),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.dullBlack,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text("Next")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
