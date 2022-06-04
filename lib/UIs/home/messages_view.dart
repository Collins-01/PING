import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Core/Services/socket_service.dart';
import 'package:ping/Core/Storage/contacts_db.dart';
import 'package:ping/Core/Storage/messages_db.dart';
import 'package:ping/UIs/home/chat_view.dart';
import 'package:ping/UIs/home/viewmodels/messages_viewmodel.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Widgets/app_text.dart';
import 'package:stacked/stacked.dart';

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
    return ViewModelBuilder<MessagesViewModel>.reactive(
      viewModelBuilder: () => MessagesViewModel(),
      builder: (_, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          model.toProfileView();
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: (_) => Container(
                          //     child: Column(
                          //       children: [
                          //         const SizedBox(
                          //           height: 20,
                          //         ),
                          //         Stack(
                          //           fit: StackFit.loose,
                          //           clipBehavior: Clip.hardEdge,
                          //           alignment: Alignment.bottomRight,
                          //           children: const [
                          //             CircleAvatar(
                          //               radius: 50,
                          //               backgroundColor: Colors.blue,
                          //             ),
                          //             Icon(Icons.camera_alt)
                          //           ],
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // );
                        },
                        child: const CircleAvatar(
                          radius: 22,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText.heading5SB("PING"),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.search)),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<Contact>>(
                    initialData: const [],
                    stream: ContactsDB().getAllContacts(),
                    builder: (_, snapshot) {
                      return snapshot.data == null
                          ? const Text("Null Data")
                          : ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 4,
                                    ),
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
                                      title: AppText.heading6SB(
                                          snapshot.data![index].username),
                                      subtitle: AppText.captionSB(
                                          "How have you been bro?"),
                                      trailing: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AppText.smallM("10:22 am"),
                                          AppText.smallM("//"),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return Text(
                                    snapshot.connectionState.toString());
                              },
                            );
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () => model.toContactsView(),
            child: const Icon(CupertinoIcons.person),
          ),
        );
      },
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
