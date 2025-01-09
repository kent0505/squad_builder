import 'package:flutter/material.dart';

import '../models/player.dart';
import 'button.dart';
import 'svg_widget.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.player,
    required this.onPressed,
    this.active = false,
  });

  final Player player;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff2C2E31),
        borderRadius: BorderRadius.circular(12),
        border: active
            ? Border.all(
                width: 1,
                color: Colors.white,
              )
            : null,
      ),
      child: Button(
        onPressed: onPressed,
        child: Column(
          children: [
            SizedBox(height: 12),
            Row(
              children: [
                SizedBox(width: 12),
                Text(
                  player.team,
                  style: TextStyle(
                    color: Color(0xffF12E36),
                    fontSize: 14,
                    fontFamily: 'w600',
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scaleX: -1,
                  child: SvgWidget('assets/back.svg'),
                ),
                SizedBox(width: 12),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 12),
                Container(
                  height: 58,
                  width: 58,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff545454),
                  ),
                  child: Center(
                    child: SvgWidget('assets/player.svg'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Color(0xffFFF6F6),
                          fontSize: 16,
                          fontFamily: 'w600',
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        player.position,
                        style: TextStyle(
                          color: Color(0xff5B5858),
                          fontSize: 14,
                          fontFamily: 'w400',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xff323439),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      player.number.toString(),
                      style: TextStyle(
                        color: Color(0xffFFF6F6),
                        fontSize: 16,
                        fontFamily: 'w600',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
