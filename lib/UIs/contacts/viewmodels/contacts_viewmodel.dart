import 'dart:developer';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:ping/Core/Services/navigation_service.dart';
import 'package:ping/Core/states/base_viewmodel.dart';
import 'package:ping/Routes/navigator_routes.dart';
import 'package:ping/locator.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsViewModel extends BaseViewModel {
  getContacts() async {
    try {
      var res = await FlutterContacts.getContacts();
    } catch (e) {
      log(e.toString());
    }
  }

  toCreateContacts() async {
    await NavigationService.instance
        .navigateTo(NavigatorRoutes.createContactView);
  }
}
