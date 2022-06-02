import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Core/Storage/db_keys.dart';
import 'package:sqlbrite/sqlbrite.dart';

Future<Database> _init() async {
  BriteDatabase? _briteDb;
  final Database db = await openDatabase(
    'contacts_database.db',
    onCreate: (db, version) => db.execute(
      'CREATE TABLE ${DbKeys.contacts}(id INTEGER PRIMARY KEY, username TEXT)',
    ),
    version: 1,
  );
  _briteDb = BriteDatabase(
    db,
    logger: (v) {
      log("....DB<Contacts>: $v");
    },
  );
  return _briteDb;
}

class ContactsDB {
  //* Creating an Instance of the class, making it a singleton
  ContactsDB._();
  static final ContactsDB _instance = ContactsDB._();
  factory ContactsDB() => _instance;
  final _dbFuture = _init()
      .then((db) => BriteDatabase(db, logger: kReleaseMode ? null : print));

//* Gets all contacts
  Stream<List<Contact>> getAllContacts() async* {
    final db = await _dbFuture;
    yield* db
        .createQuery(DbKeys.contacts)
        .asBroadcastStream()
        .mapToList((row) => Contact.fromJson(row));
  }

  // * Add a new contact
  Future<bool> addContact(Contact contact) async {
    final db = await _dbFuture;
    final id = await db.insert(
      DbKeys.contacts,
      contact.toJson(),
    );
    return id != -1;
  }

  Future<bool> deleteContact(int id) async {
    final db = await _dbFuture;
    final res =
        await db.delete(DbKeys.contacts, where: 'id = ?', whereArgs: [id]);
    return res != -1;
  }

  Future editCntact(Contact contact) async {
    final db = await _dbFuture;

    final res = await db.update(
      DbKeys.contacts,
      contact.toJson(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
    return res != -1;
  }
}
