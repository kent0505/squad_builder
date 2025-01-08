import 'package:hive_flutter/hive_flutter.dart';

class Player {
  Player({
    required this.name,
    required this.position,
    required this.team,
  });

  final String name;
  final String position;
  final String team;
}

class PlayerAdapter extends TypeAdapter<Player> {
  @override
  final typeId = 2;

  @override
  Player read(BinaryReader reader) {
    return Player(
      name: reader.read(),
      position: reader.read(),
      team: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Player obj) {
    writer.write(obj.name);
    writer.write(obj.position);
    writer.write(obj.team);
  }
}
