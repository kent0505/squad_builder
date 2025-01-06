import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../blocs/league/league_bloc.dart';
import '../core/utils.dart';
import '../widgets/back.dart';
import '../widgets/league_card.dart';
import '../widgets/main_button.dart';
import '../widgets/title_text.dart';
import 'home_page.dart';

class LeaguesPage extends StatelessWidget {
  const LeaguesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LeagueBloc, LeagueState>(
        builder: (context, state) {
          if (state is LeagueLoaded) {
            return Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).viewPadding.top),
                    SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          SizedBox(width: 16),
                          Back(),
                          SizedBox(width: 12),
                          TitleText(title: 'Player Details'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        itemCount: state.leagues.length,
                        itemBuilder: (context, index) {
                          return LeagueCard(league: state.leagues[index]);
                        },
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 54),
                    child: MainButton(
                      title: 'Apply',
                      isActive: getButtonActive(state.leagues),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('onboard', false);
                        if (context.mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                            (route) => false,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
