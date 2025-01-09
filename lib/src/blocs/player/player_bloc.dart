import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/player_api.dart';
import '../../models/player.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final _playerApi = PlayerApi();

  PlayerBloc() : super(PlayerInitial()) {
    on<GetPlayers>((event, emit) async {
      emit(PlayersLoading());

      List<Player> players = await _playerApi.getPlayers();

      emit(PlayersLoaded(
        players: players,
        filteredPlayers: players,
      ));
    });

    on<FilterPlayers>((event, emit) async {
      List<Player> filteredPlayers = event.position == 'All Positions'
          ? event.players
          : event.players
              .where((element) => element.position == event.position)
              .toList();

      emit(PlayersLoaded(
        players: event.players,
        position: event.position,
        filteredPlayers: filteredPlayers,
      ));
    });
  }
}
