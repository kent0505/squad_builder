import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/player.dart';

part 'player_event.dart';
part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  // final _playerApi = PlayerApi();

  PlayerBloc() : super(PlayerInitial()) {
    on<GetPlayers>((event, emit) async {
      emit(PlayersLoading());

      // List<Player> players = await _playerApi.getPlayers();

      List<Player> players = playersList;

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

    // on<GetPlayerDetails>((event, emit) async {
    //   emit(PlayersLoading());
    //   try {
    //     // PlayerDetail playerDetail = await _playerApi.getPlayer(event.pid);
    //     emit(PlayersLoaded(
    //       players: event.players,
    //       filteredPlayers: event.players,

    //     ));
    //   } on Object catch (_) {
    //     emit(PlayersLoaded(
    //       players: event.players,
    //       filteredPlayers: event.players,

    //     ));
    //   }
    // });
  }
}
