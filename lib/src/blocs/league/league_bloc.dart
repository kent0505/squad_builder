import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/db.dart';
import '../../models/league.dart';
import '../../models/player.dart';

part 'league_event.dart';
part 'league_state.dart';

class LeagueBloc extends Bloc<LeagueEvent, LeagueState> {
  LeagueBloc() : super(LeagueInitial()) {
    on<GetLeagues>((event, emit) async {
      await hiveInit();
      final prefs = await SharedPreferences.getInstance();
      // await prefs.clear();
      bool onboard = prefs.getBool('onboard') ?? true;

      List<League> leagues = await getLeagues();
      List<Player> players = await getPlayers();

      emit(LeagueLoaded(
        leagues: leagues,
        players: players,
        onboard: onboard,
      ));
    });

    on<EditLeague>((event, emit) async {
      List<League> leagues = await getLeagues();
      List<Player> players = await getPlayers();

      for (League league in leagues) {
        if (league.title == event.league.title) {
          league.selected = !league.selected;
          leagues = await updateLeagues(leagues);
        }
      }

      emit(LeagueLoaded(
        leagues: leagues,
        players: players,
      ));
    });

    on<ClearAll>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      List<League> leagues = await updateLeagues(leaguesList);
      List<Player> players = await getPlayers();

      emit(LeagueLoaded(
        leagues: leagues,
        players: players,
      ));
    });
  }
}
