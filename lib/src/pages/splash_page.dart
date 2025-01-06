import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/league/league_bloc.dart';
import '../widgets/loading_widget.dart';
import 'home_page.dart';
import 'onboard_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LeagueBloc, LeagueState>(
        listener: (context, state) {
          if (state is LeagueLoaded) {
            Future.delayed(
              const Duration(seconds: 2),
              () {
                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return state.onboard ? OnboardPage() : HomePage();
                      },
                    ),
                    (route) => false,
                  );
                }
              },
            );
          }
        },
        builder: (context, state) {
          return const Center(
            child: LoadingWidget(),
          );
        },
      ),
    );
  }
}
