import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/league/league_bloc.dart';
import '../widgets/button.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeagueBloc, LeagueState>(
      builder: (context, state) {
        if (state is LeagueLoaded) {
          return ListView.builder(
            itemCount: state.leagues.length,
            itemBuilder: (context, index) {
              return Button(
                onPressed: () {
                  // context
                  //     .read<TestBloc>()
                  //     .add(DeleteTest(model: state.models[index]));
                },
                child: Text(
                  state.leagues[index].title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'w700',
                  ),
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
