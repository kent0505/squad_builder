import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/player/player_bloc.dart';
import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/svg_widget.dart';

class PlayerDetailsPage extends StatelessWidget {
  const PlayerDetailsPage({super.key, required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(title: 'Player Details'),
          Expanded(
            child: BlocBuilder<PlayerBloc, PlayerState>(
              builder: (context, state) {
                if (state is PlayersLoading) {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                if (state is PlayersLoaded) {
                  return ListView(
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
                      SizedBox(height: 20),
                      Row(
                        children: [
                          _Age(
                            title: 'Age',
                            value: player.age,
                          ),
                          SizedBox(width: 10),
                          _Age(
                            title: 'Height',
                            value: player.height,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 84,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xff2C2E31),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Text(
                                  'Cards',
                                  style: TextStyle(
                                    color: Color(0xffFFF6F6),
                                    fontSize: 14,
                                    fontFamily: 'w600',
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 8,
                                    width: (MediaQuery.of(context).size.width -
                                            56) *
                                        (int.parse(player.yc) /
                                            (int.parse(player.yc) +
                                                int.parse(player.rc))),
                                    color: Color(0xffDDBF00),
                                  ),
                                  Container(
                                    height: 8,
                                    width: (MediaQuery.of(context).size.width -
                                            56) *
                                        (int.parse(player.rc) /
                                            (int.parse(player.yc) +
                                                int.parse(player.rc))),
                                    color: Color(0xffD85007),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  color: Color(0xffDDBF00),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Yellow - ${player.yc}',
                                  style: TextStyle(
                                    color: Color(0xff5B5858),
                                    fontSize: 12,
                                    fontFamily: 'w600',
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 8,
                                  width: 8,
                                  color: Color(0xffD85007),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Red - ${player.rc}',
                                  style: TextStyle(
                                    color: Color(0xff5B5858),
                                    fontSize: 12,
                                    fontFamily: 'w600',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'General',
                        style: TextStyle(
                          color: Color(0xffFFF6F6),
                          fontSize: 16,
                          fontFamily: 'w600',
                        ),
                      ),
                      SizedBox(height: 12),
                      _General(
                        title: 'Fouls',
                        value: player.fouls,
                      ),
                      _General(
                        title: 'Shots',
                        value: player.shots,
                      ),
                      _General(
                        title: 'Goals',
                        value: player.goals,
                      ),
                      _General(
                        title: 'Passes',
                        value: player.passes,
                      ),
                      _General(
                        title: 'Tackles',
                        value: player.tackles,
                      ),
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Age extends StatelessWidget {
  const _Age({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          color: Color(0xff2C2E31),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: Color(0xff5B5858),
                fontSize: 12,
                fontFamily: 'w600',
              ),
            ),
            SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                color: Color(0xffFFF6F6),
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _General extends StatelessWidget {
  const _General({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Color(0xff2C2E31),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Color(0xffFFF6F6),
                fontSize: 16,
                fontFamily: 'w600',
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xffFFF6F6),
              fontSize: 14,
              fontFamily: 'w400',
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

// class _Fouls extends StatelessWidget {
//   const _Fouls({
//     required this.title,
//     required this.value1,
//     required this.value2,
//   });

//   final String title;
//   final String value1;
//   final String value2;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 84,
//       margin: EdgeInsets.only(bottom: 6),
//       padding: EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         color: Color(0xff2C2E31),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           SizedBox(height: 12),
//           Text(
//             value1,
//             style: TextStyle(
//               color: Color(0xffFFF6F6),
//               fontSize: 16,
//               fontFamily: 'w600',
//             ),
//           ),
//           Text(
//             title,
//             style: TextStyle(
//               color: Color(0xffFFF6F6),
//               fontSize: 14,
//               fontFamily: 'w400',
//             ),
//           ),
//           SizedBox(width: 10),
//         ],
//       ),
//     );
//   }
// }
