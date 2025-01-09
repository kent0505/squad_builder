part of 'player_bloc.dart';

@immutable
sealed class PlayerState {}

final class PlayerInitial extends PlayerState {}

final class PlayersLoading extends PlayerState {}

final class PlayersLoaded extends PlayerState {
  PlayersLoaded({
    required this.players,
    this.filteredPlayers = const [],
    this.position = 'All Positions',
  });

  final List<Player> players;
  final List<Player> filteredPlayers;
  final String position;
}
