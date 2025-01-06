import 'package:flutter/material.dart';

import '../models/player.dart';
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
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ).copyWith(bottom: 130),
            children: List.generate(
              6,
              (index) {
                return PlayerCard(
                  player: Player(
                    name: 'Aaa',
                    position: 'Aaaa',
                    team: 'Aaaaa',
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
