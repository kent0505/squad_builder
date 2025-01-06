import 'package:flutter/material.dart';

import '../models/formation.dart';
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
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
