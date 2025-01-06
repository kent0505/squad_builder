import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(title: 'Terms of use'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              children: [
                Text(
                  'Terms of use',
                  style: TextStyle(
                    color: Color(0xffFFF6F6),
                    fontSize: 14,
                    fontFamily: 'w400',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
