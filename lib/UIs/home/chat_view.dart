import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Core/Models/message_model.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/Core/Services/socket_service.dart';
import 'package:ping/Core/Storage/messages_db.dart';

class ChatView extends StatefulWidget {
  final Contact contact;
  const ChatView({Key? key, required this.contact}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final controller = TextEditingController();
  final _messagesDB = MessagesDB();
  final _socketService = SocketService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.username),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Message>>(
              initialData: [],
              stream: _messagesDB.getAllMessages(),
              builder: (_, snapshot) {
                return snapshot.data == null
                    ? const Center(child: Text("Null Data"))
                    : ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(snapshot.data![index].msg),
                              ),
                            );
                          }
                          return Text(snapshot.connectionState.toString());
                        },
                      );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Send Message",
                        contentPadding: EdgeInsets.only(
                          left: 15,
                          top: 10,
                          bottom: 10,
                        ),
                      ),
                      controller: controller,
                    ),
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.text.trim().isNotEmpty) {
                        Message message = Message(
                          id: DateTime.now().millisecondsSinceEpoch,
                          msg: controller.text.trim(),
                          reciverId: 1654183960157,
                          senderId: AuthService.user!.id,
                          sentAt: DateTime.now(),
                        );
                        _socketService.sendMessage(message);
                        controller.clear();
                        // log(message.toJson().toString());
                      }
                      return;
                    },
                    child: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.green,
                      child: Icon(CupertinoIcons.share),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
