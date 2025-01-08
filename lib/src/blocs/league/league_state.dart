part of 'league_bloc.dart';

@immutable
sealed class LeagueState {}

final class LeagueInitial extends LeagueState {}

final class LeagueLoaded extends LeagueState {
  LeagueLoaded({
    required this.leagues,
    required this.players,
    this.filteredPlayers = const [],
    this.position = 'All Positions',
    this.onboard = false,
  });

  final List<League> leagues;
  final List<Player> players;
  final List<Player> filteredPlayers;
  final String position;
  final bool onboard;
}
