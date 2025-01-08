import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class PopupWidget extends StatelessWidget {
  const PopupWidget({
    super.key,
    required this.current,
    required this.onPressed,
  });

  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      width: 118,
      decoration: BoxDecoration(
        color: Color(0xff323439),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _Item(
            title: '4-4-2',
            current: current,
            onPressed: onPressed,
          ),
          _Divider(),
          _Item(
            title: '3-4-3',
            current: current,
            onPressed: onPressed,
          ),
          _Divider(),
          _Item(
            title: '4-1-2-1-2',
            current: current,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.title,
    required this.current,
    required this.onPressed,
  });

  final String title;
  final String current;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 124,
      child: Button(
        onPressed: () {
          onPressed(title);
        },
        minSize: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xffFFF6F6),
                fontSize: 14,
                fontFamily: 'w600',
              ),
            ),
            if (title == current) SvgWidget('assets/check.svg'),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: Colors.white.withValues(alpha: 0.06));
  }
}
