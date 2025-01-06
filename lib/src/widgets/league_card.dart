import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/league/league_bloc.dart';
import '../models/league.dart';
import 'button.dart';
import 'svg_widget.dart';

class LeagueCard extends StatelessWidget {
  const LeagueCard({
    super.key,
    required this.league,
  });

  final League league;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff2C2E31),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Button(
        onPressed: () {
          context.read<LeagueBloc>().add(EditLeague(league: league));
        },
        child: Row(
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
                child: SvgWidget('assets/league.svg'),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    league.title,
                    style: TextStyle(
                      color: Color(0xffFFF6F6),
                      fontSize: 16,
                      fontFamily: 'w600',
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    league.country,
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
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: league.selected ? Color(0xffF12E36) : Color(0xff323439),
                borderRadius: BorderRadius.circular(6),
                border: league.selected
                    ? null
                    : Border.all(
                        width: 1,
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
              ),
            ),
            SizedBox(width: 22),
          ],
        ),
      ),
    );
  }
}
