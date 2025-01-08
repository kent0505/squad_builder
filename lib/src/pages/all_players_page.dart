import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/league/league_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/filter_card.dart';
import '../widgets/player_card.dart';

class AllPlayersPage extends StatefulWidget {
  const AllPlayersPage({super.key});

  @override
  State<AllPlayersPage> createState() => _AllPlayersPageState();
}

class _AllPlayersPageState extends State<AllPlayersPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBarWidget(
          title: 'All Players',
          back: false,
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
                  ).copyWith(bottom: 120),
                  itemCount: state.leagues.length,
                  itemBuilder: (context, index) {
                    return PlayerCard(player: state.players[index]);
                  },
                ),
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}
