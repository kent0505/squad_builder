import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/navbar/navbar_bloc.dart';
import '../widgets/nav_bar.dart';
import 'all_players_page.dart';
import 'formations_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavbarBloc, NavbarState>(
            builder: (context, state) {
              if (state is NavbarFormations) return FormationsPage();

              if (state is NavbarSettings) return const SettingsPage();

              return const AllPlayersPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
