class Contact {
  final String username;
  final int id;
  final String avatar;
  final String phone;
  final String bio;
  Contact(
      {required this.id,
      required this.username,
      this.avatar = '',
      this.bio = '',
      required this.phone});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json['id'],
        username: json['username'],
        phone: json['phone'],
        avatar: json['avatar'],
        bio: json['bio'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'bio': bio,
      'avatar': avatar,
      'phone': phone,
    };
  }
}
