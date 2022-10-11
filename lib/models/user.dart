class User {
  String id;
  String name;
  String email;
  String token;

  User({
    required this.id,
    this.name = "Teste Teste",
    required this.email,
    required this.token,
  });
}
