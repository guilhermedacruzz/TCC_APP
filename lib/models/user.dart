class User {
  String id;
  String name;
  String email;
  String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data["_id"],
        name: data["name"],
        email: data["email"],
        token: data["jwtToken"],
      );
}
