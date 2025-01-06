import 'package:flutter/material.dart';

import 'back.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    this.back = true,
    this.children = const [],
  });

  final String title;
  final bool back;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Row(
        children: [
          if (back) ...[
            SizedBox(width: 16),
            Back(),
            SizedBox(width: 12),
          ] else
            SizedBox(width: 28),
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xffFFF6F6),
                fontSize: 20,
                fontFamily: 'w700',
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
