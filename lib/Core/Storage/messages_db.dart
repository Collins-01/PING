import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:ping/Core/Models/message_model.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/Core/Storage/db_keys.dart';
import 'package:sqlbrite/sqlbrite.dart';

Future<Database> _init() async {
  BriteDatabase? _briteDb;
  final Database db = await openDatabase(
    'messages_database.db',
    onCreate: (db, version) => db.execute(
      'CREATE TABLE ${DbKeys.messages}(id INTEGER PRIMARY KEY, msg TEXT, recieverID INTEGER, senderID INTEGER, sentAt TEXT)',
    ),
    version: 1,
  );
  _briteDb = BriteDatabase(
    db,
    logger: (v) {
      log("....DB<Messages>: $v");
    },
  );
  return _briteDb;
}

class MessagesDB {
  MessagesDB._();
  static final MessagesDB _instance = MessagesDB._();
  factory MessagesDB() => _instance;
  final _dbFuture = _init()
      .then((db) => BriteDatabase(db, logger: kReleaseMode ? null : print));

  Stream<List<Message>> getAllMessages() async* {
    final db = await _dbFuture;
    yield* db
        .createQuery(DbKeys.messages)
        .asBroadcastStream()
        .mapToList((json) => Message.fromJson(json));
    // .map((items) =>
    //     items.where((i) => i.id != null).toList(growable: false));
  }

  Stream<List<Message>> getMessageForUser(int recieverID) async* {
    final db = await _dbFuture;

    yield* db
        .createRawQuery([
          DbKeys.messages
        ], "SELECT * FROM ${DbKeys.messages} WHERE recieverID = $recieverID AND senderID = ${AuthService.user!.id}")
        .asBroadcastStream()
        .mapToList((row) => Message.fromJson(row));
  }

  Future<bool> sendMessage(Message message) async {
    // if (message.id != null) {
    //   throw StateError('Message.id must be null');
    // }

    final db = await _dbFuture;
    final id = await db.insert(
      DbKeys.messages,
      message.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id != -1;
  }

  Future<bool> onRecieveNewMessage(Message message) async {
    final db = await _dbFuture;
    final id = await db.insert(
      DbKeys.messages,
      message.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(message.toJson());
    //you can trigger notifications here
    return id != -1;
  }
}
