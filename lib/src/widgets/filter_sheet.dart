import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/player/player_bloc.dart';
import 'button.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Color(0xff2C2E31),
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 16),
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                minSize: 44,
                child: SizedBox(
                  width: 72,
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xffF12E36),
                        fontSize: 16,
                        fontFamily: 'w600',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Choose Positions',
                    style: TextStyle(
                      color: Color(0xffFFF6F6),
                      fontSize: 16,
                      fontFamily: 'w600',
                    ),
                  ),
                ),
              ),
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                minSize: 44,
                child: SizedBox(
                  width: 72,
                  child: Center(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Color(0xffF12E36),
                        fontSize: 16,
                        fontFamily: 'w600',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(width: 16),
              _Filter('All Positions'),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16),
              _Filter('Goalkeeper'),
              SizedBox(width: 8),
              _Filter('Striker'),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16),
              _Filter('Center Back'),
              SizedBox(width: 8),
              _Filter('Full Back'),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16),
              _Filter('Midfielder'),
              SizedBox(width: 8),
              _Filter('Winger'),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16),
              _Filter('Forward'),
              SizedBox(width: 8),
              Spacer(),
              SizedBox(width: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class _Filter extends StatelessWidget {
  const _Filter(this.position);

  final String position;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        if (state is PlayersLoaded) {
          return Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: state.position == position
                    ? Color(0xffF12E36)
                    : Color(0xff2C2E31),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
              child: Button(
                onPressed: () {
                  context.read<PlayerBloc>().add(FilterPlayers(
                        position: position,
                        players: state.players,
                      ));
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      position,
                      style: TextStyle(
                        color: Color(0xffFFF6F6),
                        fontSize: 14,
                        fontFamily: 'w600',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
