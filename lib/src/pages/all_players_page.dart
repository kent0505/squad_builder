import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/player/player_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/filter_card.dart';
import '../widgets/player_card.dart';
import 'player_details_page.dart';

class AllPlayersPage extends StatefulWidget {
  const AllPlayersPage({super.key});

  @override
  State<AllPlayersPage> createState() => _AllPlayersPageState();
}

class _AllPlayersPageState extends State<AllPlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarWidget(
          title: 'All Players',
          back: false,
          children: [
            FilterCard(),
            SizedBox(width: 16),
          ],
        ),
        Expanded(
          child: BlocBuilder<PlayerBloc, PlayerState>(
            builder: (context, state) {
              if (state is PlayersLoading) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              if (state is PlayersLoaded) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ).copyWith(bottom: 120),
                  itemCount: state.filteredPlayers.length,
                  itemBuilder: (context, index) {
                    return PlayerCard(
                      player: state.filteredPlayers[index],
                      onPressed: () {
                        // context.read<PlayerBloc>().add(GetPlayerDetails(
                        //       pid: state.players[index].pid,
                        //       players: state.players,
                        //     ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PlayerDetailsPage(
                                player: state.filteredPlayers[index],
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ),
      ],
    );
  }
}
