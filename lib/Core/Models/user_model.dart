class User {
  final String username;
  final int id;
  User({required this.id, required this.username});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], username: json['username']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }
}
