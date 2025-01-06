import 'package:flutter/material.dart';

import '../widgets/back.dart';
import '../widgets/title_text.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
                TitleText(title: 'Terms of use'),
              ],
            ),
          ),
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
