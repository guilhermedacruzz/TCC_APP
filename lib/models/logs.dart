class Logs {
  String id;
  String iot;
  int minutes;
  String status;
  DateTime date;

  Logs({
    required this.id,
    required this.iot,
    required this.minutes,
    required this.status,
    required this.date,
  });

  factory Logs.fromJson(Map<String, dynamic> data) => Logs(
        id: data["_id"],
        iot: data["iot"],
        minutes: data["minutes"],
        status: data["status"],
        date: DateTime.parse(data["date"]),
      );
}
