import 'package:flutter/material.dart';

import 'button.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String title;
  final String description;
  final String buttonTitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xff222222),
      child: SizedBox(
        height: 150,
        width: 270,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: Color(0xffFFF6F6),
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'w400',
                  height: 1.2,
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 1,
              color: Color(0xff808080).withValues(alpha: 0.55),
            ),
            Row(
              children: [
                _Button(
                  title: 'Cancel',
                  color: Color(0xff007AFF),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 44,
                  width: 1,
                  color: Color(0xff808080).withValues(alpha: 0.55),
                ),
                _Button(
                  title: buttonTitle,
                  color: Color(0xffF12E36),
                  onPressed: () {
                    Navigator.pop(context);
                    onPressed();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.color,
    required this.onPressed,
  });

  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Button(
        padding: 0,
        minSize: 44,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontFamily: 'w600',
          ),
        ),
      ),
    );
  }
}
