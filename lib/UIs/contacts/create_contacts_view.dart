import 'package:flutter/material.dart';
import 'package:ping/UIs/contacts/viewmodels/create_contacts_viewmodel.dart';
import 'package:ping/Utils/app_colors.dart';
// import 'package:ping/Utils/app_text_styles.dart';
import 'package:ping/Widgets/app_text.dart';
import 'package:ping/Widgets/app_text_field.dart';
import 'package:stacked/stacked.dart';
import '../../Extensions/context.dart' show IContext;

class CreateContactsView extends StatelessWidget {
  const CreateContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateContactsViewModel>.reactive(
      viewModelBuilder: () => CreateContactsViewModel(),
      builder: (_, model, __) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBgColor,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextField(
                  controller: model.nameController,
                  hintText: "Collins",
                  labelText: "Username",
                ),
                const SizedBox(
                  height: 30,
                ),
                AppTextField(
                  controller: model.phoneNumberController,
                  hintText: "+23463509379",
                  labelText: "Phone",
                ),
                SizedBox(
                  height: context.deviceHeight / 9,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: context.deviceWidth,
                    child: AppText.heading5SB(
                      'Create',
                      color: AppColors.whiteColor,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
