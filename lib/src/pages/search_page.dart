import 'package:flutter/material.dart';

import '../widgets/back.dart';
import '../widgets/title_text.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).viewPadding.top),
          SizedBox(
            height: 80,
            child: Row(
              children: [
                SizedBox(width: 16),
                Back(),
                SizedBox(width: 12),
                TitleText(title: 'Search'),
              ],
            ),
          ),
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
