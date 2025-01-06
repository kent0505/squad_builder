import 'package:flutter/material.dart';

import 'button.dart';
import 'svg_widget.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        Navigator.pop(context);
      },
      child: SizedBox(
        width: 52,
        height: 52,
        child: Center(
          child: SvgWidget('assets/back.svg'),
        ),
      ),
    );
  }
}
