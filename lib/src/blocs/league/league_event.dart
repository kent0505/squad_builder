part of 'league_bloc.dart';

@immutable
sealed class LeagueEvent {}

class GetLeagues extends LeagueEvent {}

class EditLeague extends LeagueEvent {
  EditLeague({required this.league});
  final League league;
}

class ClearAll extends LeagueEvent {}

class FilterPlayers extends LeagueEvent {
  FilterPlayers({required this.position});

  final String position;
}
