import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/formation/formation_bloc.dart';
import '../blocs/league/league_bloc.dart';
import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button.dart';
import '../widgets/player_card.dart';
import '../widgets/svg_widget.dart';
import 'search_page.dart';

class ChoosePlayerPage extends StatelessWidget {
  const ChoosePlayerPage({
    super.key,
    required this.player,
    required this.playerIndex,
    required this.fortmation,
  });

  final Player player;
  final int playerIndex;
  final String fortmation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(
            title: 'Choose Player',
            children: [
              Container(
                height: 60,
                width: 118,
                decoration: BoxDecoration(
                  color: Color(0xffF12E36),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Button(
                        onPressed: () async {
                          await Navigator.push<Player>(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SearchPage(select: true);
                              },
                            ),
                          ).then((value) {
                            if (context.mounted && value != null) {
                              context.read<FormationBloc>().add(SelectPlayer(
                                    player: value,
                                    index: playerIndex,
                                    formation: fortmation,
                                  ));
                              Navigator.pop(context);
                            }
                          });
                        },
                        minSize: 52,
                        child: SvgWidget('assets/search.svg'),
                      ),
                    ),
                    Expanded(
                      child: Button(
                        onPressed: player.name.isEmpty
                            ? null
                            : () {
                                context.read<FormationBloc>().add(SelectPlayer(
                                      player: Player(
                                        name: '',
                                        position: '',
                                        team: '',
                                      ),
                                      index: playerIndex,
                                      formation: fortmation,
                                    ));
                                Navigator.pop(context);
                              },
                        minSize: 52,
                        child: SvgWidget(
                          'assets/reset.svg',
                          color: player.name.isEmpty ? Color(0xff463F3F) : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                        active: state.players[index].name == player.name,
                        onPressed: () {
                          context.read<FormationBloc>().add(SelectPlayer(
                                player: state.players[index],
                                index: playerIndex,
                                formation: fortmation,
                              ));
                          Navigator.pop(context);
                        },
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
