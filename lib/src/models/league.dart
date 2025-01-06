import 'package:hive_flutter/hive_flutter.dart';

// @HiveType(typeId: 0)
class League {
  League({
    required this.title,
    required this.country,
    required this.selected,
  });

  // @HiveField(0)
  final String title;
  // @HiveField(1)
  final String country;
  // @HiveField(2)
  bool selected;
}

class LeagueAdapter extends TypeAdapter<League> {
  @override
  final typeId = 0;

  @override
  League read(BinaryReader reader) {
    return League(
      title: reader.read(),
      country: reader.read(),
      selected: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, League obj) {
    writer.write(obj.title);
    writer.write(obj.country);
    writer.write(obj.selected);
  }
}
