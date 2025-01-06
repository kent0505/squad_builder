import 'package:flutter/material.dart';

import '../models/formation.dart';
import 'button.dart';

class FormationCard extends StatelessWidget {
  const FormationCard({
    super.key,
    required this.formation,
  });

  final Formation formation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Color(0xff2C2E31),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Button(
        onPressed: () {},
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formation.title,
                  style: TextStyle(
                    color: Color(0xffFFF6F6),
                    fontSize: 16,
                    fontFamily: 'w600',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  formation.formation,
                  style: TextStyle(
                    color: Color(0xff5B5858),
                    fontSize: 12,
                    fontFamily: 'w600',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
