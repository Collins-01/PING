import 'package:flutter/material.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Utils/app_text_styles.dart';
import 'package:ping/Widgets/app_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
            onTap: () => Navigator.pop(context), child: const BackButtonIcon()),
        title: Text(
          "Profile",
          style: heading5SemiBoldStyle.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.heading5SB(AuthService.user?.username ?? ""),
                    const SizedBox(
                      height: 5,
                    ),
                    AppText.heading6R(AuthService.user?.id.toString() ?? "")
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
