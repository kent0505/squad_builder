import 'package:flutter/material.dart';

import '../models/formation.dart';
import '../widgets/formation_card.dart';
import '../widgets/title_text.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  SizedBox(width: 28),
                  TitleText(title: 'Formations'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: List.generate(
                  6,
                  (index) {
                    return FormationCard(
                      formation: Formation(
                        id: 1,
                        title: 'Aaa',
                        formation: 'Aaaa',
                      ),
                    );
                  },
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 16,
            //       vertical: 10,
            //     ),
            //     itemCount: state.leagues.length,
            //     itemBuilder: (context, index) {
            //       return LeagueCard(league: state.leagues[index]);
            //     },
            //   ),
            // )
          ],
        ),
      ],
    );
  }
}
