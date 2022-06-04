import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ping/Core/Models/contact_model.dart';
import 'package:ping/Core/Models/message_model.dart';
import 'package:ping/Core/Services/auth_service.dart';
import 'package:ping/Core/Services/socket_service.dart';
import 'package:ping/Core/Storage/messages_db.dart';
import 'package:ping/UIs/home/viewmodels/chat_viewmodel.dart';
import 'package:ping/Utils/app_colors.dart';
import 'package:ping/Widgets/app_text.dart';
import 'package:stacked/stacked.dart';

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
    return ViewModelBuilder<ChatViewModel>.reactive(
      viewModelBuilder: () => ChatViewModel(),
      builder: (_, model, child) => Scaffold(
        backgroundColor: AppColors.scaffoldBgColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
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
                                child: Column(
                                  crossAxisAlignment:
                                      AuthService.user!.id != widget.contact.id
                                          ? CrossAxisAlignment.start
                                          : CrossAxisAlignment.end,
                                  children: [
                                    BubbleSpecialThree(
                                      sent: true,
                                      delivered: true,
                                      seen: true,
                                      isSender: AuthService.user!.id ==
                                          widget.contact.id,
                                      text: snapshot.data![index].msg,
                                      color: AuthService.user!.id ==
                                              widget.contact.id
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                      tail: true,
                                      textStyle: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: AuthService.user!.id ==
                                                widget.contact.id
                                            ? 0
                                            : 16,
                                        right: AuthService.user!.id ==
                                                widget.contact.id
                                            ? 0
                                            : 16,
                                      ),
                                      child: AppText.smallM("2:40 am"),
                                    )
                                  ],
                                ),

                                // child: BubbleNormalAudio(
                                //   color: const Color(0xFFE8E8EE),
                                //   duration: model.duration.inSeconds.toDouble(),
                                //   position: model.position.inSeconds.toDouble(),
                                //   isPlaying: model.isPlaying,
                                //   isLoading: model.isLoading,
                                //   isPause: model.isPause,
                                //   onSeekChanged: model.onSeekChanged,
                                //   onPlayPauseButtonClick: () {},
                                //   sent: true,
                                // ),
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
                            reciverId: AuthService.user!.id,
                            senderId: AuthService.user!.id,
                            sentAt: DateTime.now(),
                          );
                          _socketService.sendMessage(message);
                          controller.clear();
                          // log(message.toJson().toString());
                        }
                        return;
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.primaryColor,
                        child: const Icon(CupertinoIcons.share),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
