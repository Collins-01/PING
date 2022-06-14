import 'dart:developer';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ping/Core/Models/contact_model.dart';

class FirebaseDB {
  final firestore = Firestore();
  Future<void> createUser(Contact contact) async {
    try {
      await firestore
          .document('users')
          .collection(contact.id.toString())
          .add(
            contact.toJson(),
          )
          .then(
            (value) => log(value.documentID),
          );
    } catch (e) {
      log('error creating user : $e');
    }
  }

  getUser(String id) async {
    try {
      var response = firestore.collection('users').where(id, isEqualTo: id);
      log(response.toString());
    } catch (e) {
      log('Error getting users = $e');
    }
  }
}
