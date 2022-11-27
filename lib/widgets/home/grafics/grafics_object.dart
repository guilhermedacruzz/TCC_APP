import 'package:intl/intl.dart';

class GraficsObject {
  final DateTime _x;
  final int _y;

  GraficsObject(this._x, this._y);

  String get x => DateFormat("HH:mm:ss").format(_x);

  int get y => _y;
}