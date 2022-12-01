class Iot {
  String id;
  String name;
  String description;
  String user;
  String ssid;
  String password;
  int timer;

  Iot({
    required this.id,
    required this.name,
    required this.description,
    required this.user,
    required this.ssid,
    required this.password,
    required this.timer,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'user': user,
      'ssid': ssid,
      'password': password,
      'timer': timer,
    };
  }

  factory Iot.fromJson(Map<String, dynamic> data) => Iot(
        id: data["_id"],
        name: data["name"],
        description: data["description"],
        user: data["user"],
        ssid: data["ssid"],
        password: data["password"],
        timer: data["timer"],
      );
}
