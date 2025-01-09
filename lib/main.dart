import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/formation/formation_bloc.dart';
import 'src/blocs/player/player_bloc.dart';
import 'src/core/themes.dart';
import 'src/blocs/navbar/navbar_bloc.dart';
import 'src/blocs/league/league_bloc.dart';
import 'src/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NavbarBloc();
        }),
        BlocProvider(create: (context) {
          return PlayerBloc()..add(GetPlayers());
        }),
        BlocProvider(create: (context) {
          return LeagueBloc()..add(GetLeagues());
        }),
        BlocProvider(create: (context) {
          return FormationBloc()..add(ChangeFormation(formation: '4-4-2'));
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: SplashPage(),
      ),
    );
  }
}
