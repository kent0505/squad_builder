part of 'league_bloc.dart';

@immutable
sealed class LeagueState {}

final class LeagueInitial extends LeagueState {}

final class LeagueLoaded extends LeagueState {
  LeagueLoaded({
    required this.leagues,
    this.onboard = false,
  });

  final List<League> leagues;
  final bool onboard;
}
