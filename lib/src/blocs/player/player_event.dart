part of 'player_bloc.dart';

@immutable
sealed class PlayerEvent {}

class GetPlayers extends PlayerEvent {}

class FilterPlayers extends PlayerEvent {
  FilterPlayers({
    required this.position,
    required this.players,
  });

  final String position;
  final List<Player> players;
}

class GetPlayerDetails extends PlayerEvent {
  GetPlayerDetails({
    required this.pid,
    required this.players,
  });

  final int pid;
  final List<Player> players;
}
