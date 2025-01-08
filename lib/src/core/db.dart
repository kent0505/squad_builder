import 'package:hive_flutter/hive_flutter.dart';

import '../models/formation.dart';
import '../models/league.dart';
import '../models/player.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('squad_builder_box');
  Hive.registerAdapter(LeagueAdapter());
  Hive.registerAdapter(FormationAdapter());
  Hive.registerAdapter(PlayerAdapter());
}

// leagues
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

// formation
Future<List<Formation>> getFormations() async {
  final box = await Hive.openBox('squad_builder_box');
  List data = box.get('formations') ?? [];
  return data.cast<Formation>();
}

Future<List<Formation>> updateFormations(List<Formation> formations) async {
  final box = await Hive.openBox('squad_builder_box');
  await box.put('formations', formations);
  return await box.get('formations');
}

List<League> leaguesList = [
  League(title: "English Premier League", country: "England", selected: false),
  League(title: "La Liga", country: "Spain", selected: false),
  League(title: "Serie A", country: "Italy", selected: false),
  League(title: "Bundesliga", country: "Germany", selected: false),
  League(title: "Ligue 1", country: "France", selected: false),
  League(title: "Major League Soccer", country: "USA/Canada", selected: false),
];

Future<List<Player>> getPlayers() async {
  return [
    Player(name: 'Aaa', position: 'Striker', team: 'Aaaaa'),
    Player(name: 'Bbb', position: 'Striker', team: 'Aaaaa'),
    Player(name: 'Ccc', position: 'Striker', team: 'Aaaaa'),
    Player(name: 'Ddd', position: 'Center Back', team: 'Aaaaa'),
    Player(name: 'Eee', position: 'Center Back', team: 'Aaaaa'),
    Player(name: 'Fff', position: 'Center Back', team: 'Aaaaa'),
    Player(name: 'Ggg', position: 'Full Back', team: 'Aaaaa'),
    Player(name: 'Hhh', position: 'Full Back', team: 'Aaaaa'),
    Player(name: 'Iii', position: 'Full Back', team: 'Aaaaa'),
    Player(name: 'Jjj', position: 'Full Back', team: 'Aaaaa'),
    Player(name: 'Kkk', position: 'Goalkeeper', team: 'Aaaaa'),
  ];
}
