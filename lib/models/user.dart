class User {
  String id;
  String username;
  String email;
  String token;
  DateTime expiration;

  User({
    required this.id,
    this.username = "Teste Teste",
    required this.email,
    required this.token,
    required this.expiration,
  });
}
