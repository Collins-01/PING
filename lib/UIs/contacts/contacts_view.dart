import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping/UIs/contacts/viewmodels/contacts_viewmodel.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Widgets/app_text.dart';
import 'package:stacked/stacked.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactsViewModel>.reactive(
        viewModelBuilder: () => ContactsViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: const Text("Contacts"),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "Search for name",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: 120,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              radius: 25,
                              child: const Icon(Icons.person),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.heading6SB("Collins"),
                                const SizedBox(
                                  height: 5,
                                ),
                                AppText.smallSB("08163509379")
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: AppColors.scaffoldBgColor,
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                model.toCreateContacts();
              },
              child: const Icon(CupertinoIcons.add),
            ),
          );
        });
  }
}
