class Contact {
  final String username;
  final int id;
  Contact({required this.id, required this.username});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json['id'],
        username: json['username'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }
}
