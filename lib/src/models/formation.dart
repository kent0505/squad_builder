import 'package:hive_flutter/hive_flutter.dart';

class Formation {
  Formation({
    required this.id,
    required this.title,
    required this.formation,
    required this.players,
  });

  final int id;
  final String title;
  final String formation;
  final List players;
}

class FormationAdapter extends TypeAdapter<Formation> {
  @override
  final typeId = 1;

  @override
  Formation read(BinaryReader reader) {
    return Formation(
      id: reader.read(),
      title: reader.read(),
      formation: reader.read(),
      players: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Formation obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.formation);
    writer.write(obj.players);
  }
}
