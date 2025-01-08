import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/formation/formation_bloc.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/formation_card.dart';
import '../widgets/main_button.dart';
import 'create_formation_page.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            AppBarWidget(
              title: 'Formations',
              back: false,
            ),
            BlocBuilder<FormationBloc, FormationState>(
              builder: (context, state) {
                if (state is FormationsLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ).copyWith(bottom: 120),
                      itemCount: state.formations.length,
                      itemBuilder: (context, index) {
                        return FormationCard(
                          formation: state.formations[index],
                        );
                      },
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
        Positioned(
          right: 0,
          bottom: 134,
          child: MainButton(
            title: 'Create New',
            width: 138,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CreateFormationPage();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
