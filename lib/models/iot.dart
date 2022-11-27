class Iot {
  String id;
  String name;
  String description;
  String user;
  int timer;

  Iot({
    required this.id,
    required this.name,
    required this.description,
    required this.user,
    required this.timer,
  });

  factory Iot.fromJson(Map<String, dynamic> data) => Iot(
        id: data["_id"],
        name: data["name"],
        description: data["description"],
        user: data["user"],
        timer: data["timer"],
      );
}
