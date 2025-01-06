import 'package:hive_flutter/hive_flutter.dart';

import '../models/league.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('squad_builder_box');
  Hive.registerAdapter(LeagueAdapter());
}

Future<List<League>> getLeagues() async {
  final box = await Hive.openBox('squad_builder_box');
  List data = box.get('leagues') ?? leaguesList;
  return data.cast<League>();
}

Future<List<League>> updateLeagues(List<League> leagues) async {
  final box = await Hive.openBox('squad_builder_box');
  await box.put('leagues', leagues);
  return await box.get('leagues');
}

List<League> leaguesList = [
  League(title: "English Premier League", country: "England", selected: false),
  League(title: "La Liga", country: "Spain", selected: false),
  League(title: "Serie A", country: "Italy", selected: false),
  League(title: "Bundesliga", country: "Germany", selected: false),
  League(title: "Ligue 1", country: "France", selected: false),
  League(title: "Major League Soccer", country: "USA/Canada", selected: false),
];
