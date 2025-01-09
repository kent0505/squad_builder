import 'package:hive_flutter/hive_flutter.dart';

class Player {
  Player({
    required this.id,
    required this.pid,
    required this.name,
    required this.position,
    required this.team,
    required this.number,
  });

  final int id;
  final int pid;
  final String name;
  final String position;
  final String team;
  final int number;

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      pid: json['pid'],
      name: json['name'],
      position: json['position'],
      team: json['team'],
      number: json['number'],
    );
  }
}

final emptyPlayer = Player(
  id: 0,
  pid: 0,
  name: '',
  position: '',
  team: '',
  number: 0,
);

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final typeId = 2;

  @override
  Player read(BinaryReader reader) {
    return Player(
      id: reader.read(),
      pid: reader.read(),
      name: reader.read(),
      position: reader.read(),
      team: reader.read(),
      number: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer.write(obj.id);
    writer.write(obj.pid);
    writer.write(obj.name);
    writer.write(obj.position);
    writer.write(obj.team);
    writer.write(obj.number);
  }
}
