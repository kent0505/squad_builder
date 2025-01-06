import 'package:flutter/cupertino.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.title,
    this.width,
    this.isActive = true,
    required this.onPressed,
  });

  final String title;
  final double? width;
  final bool isActive;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 52,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? Color(0xffF12E36) : Color(0xff463F3F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: isActive ? onPressed : null,
        padding: EdgeInsets.zero,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Color(0xffFFF6F6) : Color(0xff5B5858),
              fontSize: 16,
              fontFamily: 'w600',
            ),
          ),
        ),
      ),
    );
  }
}
