import 'package:flutter/material.dart';

import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/svg_widget.dart';

class PlayerDetailsPage extends StatelessWidget {
  const PlayerDetailsPage({
    super.key,
    required this.player,
  });

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(title: 'Player Details'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        player.team,
                        style: TextStyle(
                          color: Color(0xffF12E36),
                          fontSize: 20,
                          fontFamily: 'w700',
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff545454),
                      ),
                      child: Center(
                        child: SvgWidget('assets/league.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
