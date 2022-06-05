class User {
  int id;
  String email;
  String username;
  String first_name;
  String middle_name;
  String? password;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.first_name,
    required this.middle_name,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json["email"],
      username: json["username"],
      first_name: json["first_name"],
      middle_name: json["middle_name"],
      password: json["password"],
    );
  }
}
