import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(title: 'Search'),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
