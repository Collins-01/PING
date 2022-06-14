import 'package:flutter/material.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Core/states/base_viewmodel.dart';
import 'package:ping/firebase_services/firebase_db.dart';

class CreateContactsViewModel extends BaseViewModel {
  final FirebaseDB _firebaseDB = FirebaseDB();
  final phoneNumberController = TextEditingController();
  final nameController = TextEditingController();

  createUser() async {
    Contact contact = Contact(
      id: DateTime.now().millisecondsSinceEpoch,
      phone: phoneNumberController.text,
      username: nameController.text,
      avatar: '',
      bio: 'Let love lead',
    );
    await _firebaseDB.createUser(contact);
  }
}
