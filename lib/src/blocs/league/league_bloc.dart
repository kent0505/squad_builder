import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/db.dart';
import '../../models/league.dart';

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

      emit(LeagueLoaded(
        leagues: leagues,
        onboard: onboard,
      ));
    });

    on<EditLeague>((event, emit) async {
      List<League> leagues = await getLeagues();

      for (League league in leagues) {
        if (league.title == event.league.title) {
          league.selected = !league.selected;
          leagues = await updateLeagues(leagues);
        }
      }

      emit(LeagueLoaded(leagues: leagues));
    });

    on<ClearAll>((event, emit) async {
      List<League> leagues = await updateLeagues(leaguesList);
      emit(LeagueLoaded(leagues: leagues));
    });
  }
}
