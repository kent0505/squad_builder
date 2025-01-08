import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/formation/formation_bloc.dart';
import '../core/utils.dart';
import '../models/formation.dart';
import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button.dart';
import '../widgets/dialog_widget.dart';
import '../widgets/formation_title_field.dart';
import '../widgets/main_button.dart';
import '../widgets/popup_widget.dart';
import '../widgets/svg_widget.dart';
import 'choose_player_page.dart';

class CreateFormationPage extends StatefulWidget {
  const CreateFormationPage({super.key});

  @override
  State<CreateFormationPage> createState() => _CreateFormationPageState();
}

class _CreateFormationPageState extends State<CreateFormationPage> {
  final controller = TextEditingController();
  bool popup = false;
  List<Player> players = List.generate(
    11,
    (index) => Player(
      name: '',
      position: '',
      team: '',
    ),
  );

  void onPopup(String value) {
    context.read<FormationBloc>().add(ChangeFormation(formation: value));
    popup = false;
  }

  void onOpenPopup() {
    setState(() {
      popup = true;
    });
  }

  void onClosePopup() {
    if (popup) {
      setState(() {
        popup = false;
      });
    }
  }

  void onSave(String formation) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return DialogWidget(
          title: 'Formation Name',
          buttonTitle: 'Save',
          buttonColor: Color(0xff007AFF),
          children: [
            const Spacer(),
            FormationTitleField(controller: controller),
          ],
          onPressed: () {
            context.read<FormationBloc>().add(
                  AddFormation(
                    formation: Formation(
                      id: getTimestamp(),
                      title: controller.text,
                      formation: formation,
                      players: players,
                    ),
                  ),
                );
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void onPlayer(Player player, int index) async {
    onClosePopup();
    await Navigator.push<Player>(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ChoosePlayerPage(player: player);
        },
      ),
    ).then((value) {
      if (value != null) {
        setState(() {
          players.removeAt(index);
          players.insert(index, value);
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: onClosePopup,
            child: Column(
              children: [
                AppBarWidget(
                  title: 'Create New',
                  children: [
                    BlocBuilder<FormationBloc, FormationState>(
                      builder: (context, state) {
                        if (state is FormationsLoaded) {
                          return MainButton(
                            title: 'Save',
                            width: 126,
                            onPressed: () {
                              onSave(state.formation);
                            },
                          );
                        }

                        return Container();
                      },
                    )
                  ],
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: SvgWidget(
                          'assets/field2.svg',
                          width: MediaQuery.of(context).size.width - 32,
                          fit: BoxFit.fill,
                        ),
                      ),
                      BlocBuilder<FormationBloc, FormationState>(
                        builder: (context, state) {
                          if (state is FormationsLoaded) {
                            return _PlayersFormation(
                              formation: state.formation,
                              players: players,
                              onPlayer: onPlayer,
                            );
                          }

                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 46),
              ],
            ),
          ),
          Positioned(
            right: 24,
            bottom: 60,
            child: GestureDetector(
              onTap: onClosePopup,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF12E36),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Button(
                  onPressed: onOpenPopup,
                  minSize: 52,
                  child: SvgWidget('assets/formations.svg'),
                ),
              ),
            ),
          ),
          BlocBuilder<FormationBloc, FormationState>(
            builder: (context, state) {
              if (state is FormationsLoaded) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  right: popup ? 20 : -200,
                  bottom: 60,
                  child: PopupWidget(
                    current: state.formation,
                    onPressed: onPopup,
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}

class _Player extends StatelessWidget {
  const _Player(
    this.index,
    this.players,
    this.onPressed,
  );

  final int index;
  final List<Player> players;
  final void Function(Player, int) onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () {
        onPressed(players[index], index);
      },
      child: SizedBox(
        height: 64,
        width: 74,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                Expanded(
                  child: players[index].name.isEmpty
                      ? SvgWidget('assets/player2.svg')
                      : Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff545454),
                          ),
                          child: Center(
                            child: SvgWidget('assets/player.svg'),
                          ),
                        ),
                ),
                SizedBox(height: 4),
                Text(
                  players[index].name.isEmpty ? 'Player' : players[index].name,
                  style: TextStyle(
                    color: Color(0xffFFF6F6),
                    fontSize: 12,
                    fontFamily: 'w600',
                    height: 1,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                index.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row(this.children);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: children,
          ),
        ],
      ),
    );
  }
}

class _PlayersFormation extends StatelessWidget {
  const _PlayersFormation({
    required this.formation,
    required this.players,
    required this.onPlayer,
  });

  final String formation;
  final List<Player> players;
  final void Function(Player, int) onPlayer;

  @override
  Widget build(BuildContext context) {
    final playerRows = formationMap[formation] ?? [];

    return Column(
      children: [
        for (final row in playerRows)
          _Row(
            row.map((index) => _Player(index, players, onPlayer)).toList(),
          ),
        SizedBox(height: 10),
      ],
    );
  }
}
