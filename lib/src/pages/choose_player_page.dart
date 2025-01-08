import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/league/league_bloc.dart';
import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/filter_card.dart';
import '../widgets/player_card.dart';

class ChoosePlayerPage extends StatelessWidget {
  const ChoosePlayerPage({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            title: 'Choose Player',
            children: [
              FilterCard(),
              SizedBox(width: 16),
            ],
          ),
          BlocBuilder<LeagueBloc, LeagueState>(
            builder: (context, state) {
              if (state is LeagueLoaded) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    itemCount: state.leagues.length,
                    itemBuilder: (context, index) {
                      return PlayerCard(
                        player: state.players[index],
                        current: player,
                      );
                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
