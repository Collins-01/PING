class Message {
  final int id;
  final String msg;
  final DateTime sentAt;
  final int senderId;
  final int reciverId;

  Message({
    required this.id,
    required this.msg,
    required this.reciverId,
    required this.senderId,
    required this.sentAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json['id'],
        msg: json['msg'],
        reciverId: json['recieverID'],
        senderId: json['senderID'],
        sentAt: DateTime.parse(
          json['sentAt'],
        ),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'msg': msg,
      "recieverID": reciverId,
      'senderID': senderId,
      'sentAt': sentAt.toString()
    };
  }
}
