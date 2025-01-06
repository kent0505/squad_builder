import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(title: 'Privacy Policy'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              children: [
                Text(
                  'Privacy Policy',
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
