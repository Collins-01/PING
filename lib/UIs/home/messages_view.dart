import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/Core/Services/socket_service.dart';
import 'package:ping/Core/Storage/contacts_db.dart';
import 'package:ping/Core/Storage/messages_db.dart';
import 'package:ping/UIs/home/chat_view.dart';
import 'package:ping/Utils/app_colors.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  final ContactsDB _contactsDB = ContactsDB();
  final MessagesDB _messagesDB = MessagesDB();
  @override
  void initState() {
    SocketService().initSocket();
    _contactsDB.getAllContacts();
    _messagesDB.getAllMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AuthService.user!.username),
      ),
      body: StreamBuilder<List<Contact>>(
        initialData: [],
        stream: ContactsDB().getAllContacts(),
        builder: (_, snapshot) {
          return snapshot.data == null
              ? const Text("Null Data")
              : ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatView(
                                contact: snapshot.data![index],
                              ),
                            ),
                          ),
                          leading: const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.green,
                          ),
                          title: Text(snapshot.data![index].username),
                          // subtitle: BuildMessageText(
                          //     recieverID: snapshot.data![index].id),
                        ),
                      );
                    }
                    return Text(snapshot.connectionState.toString());
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          final Faker _faker = Faker();
          final contact = Contact(
            id: DateTime.now().millisecondsSinceEpoch,
            username: _faker.person.name(),
          );
          _contactsDB.addContact(contact);
        },
        child: const Icon(CupertinoIcons.person),
      ),
    );
  }
}
//  socket.emit(
//       'message',
//       {
//         'message': message,
//         'sender': 'Collins01',
//       },
//     );