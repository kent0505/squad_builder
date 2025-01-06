import 'package:flutter/material.dart';

import '../models/player.dart';
import '../widgets/filter_card.dart';
import '../widgets/player_card.dart';
import '../widgets/title_text.dart';

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
        SizedBox(height: MediaQuery.of(context).viewPadding.top),
        SizedBox(
          height: 80,
          child: Row(
            children: [
              SizedBox(width: 28),
              TitleText(title: 'All Players'),
              Spacer(),
              FilterCard(),
              SizedBox(width: 16),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
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
