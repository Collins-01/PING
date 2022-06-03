import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Widgets/app_text.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Contacts"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: AppText.captionM("19"),
          ),
        ],
      ),
      backgroundColor: AppColors.scaffoldBgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
