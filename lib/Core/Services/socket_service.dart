import 'dart:developer';

import 'package:ping/Core/Models/message_model.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/Core/Storage/messages_db.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketService {
  SocketService._();
  final MessagesDB _messagesDB = MessagesDB();
  static final SocketService _instance = SocketService._();
  factory SocketService() => _instance;
  late Socket socket;
  initSocket() async {
    socket = io('http://localhost:3000', <String, dynamic>{
      'transports': ['websocket'],
      "query": {
        'username': AuthService.user!.username,
        'id': AuthService.user!.id
      }
    });
    _connectToSocket();
  }

  _connectToSocket() {
    socket.onConnect((data) {
      log("${AuthService.user!.username} with id: ${AuthService.user!.id} connected successfully");
      socket.emit(
          "${AuthService.user!.username} with id: ${AuthService.user!.id} connected");
    });
    //*OnConnection Error
    socket.onConnectError((data) => log("onConnectError : $data"));
    //* OnDisconnect-Error
    socket.onDisconnect((data) => log("Socket Disconnected"));
    //* On Recieve new message
    socket.on('message', (data) {
      log(data.toString());
      Message message = Message.fromJson(data);
      _messagesDB.onRecieveNewMessage(message);
      log("Recived Message:   ${message.toJson()}");
    });

    socket.on('message_sent', (data) async {
      await _messagesDB.updateMessageStatus(
        data['id'],
        "Sent".toUpperCase(),
      );
    });

    socket.on('message_delivered', (data) async {
      await _messagesDB.updateMessageStatus(
        data['id'],
        "Delivered".toUpperCase(),
      );
    });
  }

  sendMessage(Message message) {
    socket.emit(
      'message',
      message.toJson(),
    );
    // _messagesDB.sendMessage(message);
  }
}
