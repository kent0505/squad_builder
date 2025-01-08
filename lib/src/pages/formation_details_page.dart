import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/rendering.dart';

import '../blocs/formation/formation_bloc.dart';
import '../core/utils.dart';
import '../models/formation.dart';
import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/delete_share_card.dart';
import '../widgets/svg_widget.dart';

class FormationDetailsPage extends StatefulWidget {
  const FormationDetailsPage({super.key, required this.formation});

  final Formation formation;

  @override
  State<FormationDetailsPage> createState() => _FormationDetailsPageState();
}

class _FormationDetailsPageState extends State<FormationDetailsPage> {
  final globalKey = GlobalKey();
  List<Player> players = List.generate(
    11,
    (index) => Player(
      name: '',
      position: '',
      team: '',
    ),
  );

  Future<void> onShare() async {
    try {
      final boundary =
          globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/shared_image.png';
      final file = File(imagePath);
      await file.writeAsBytes(pngBytes);

      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Check out this widget!',
      );
    } catch (e) {
      print('Error capturing widget: $e');
    }
  }

  void onDelete() {
    context
        .read<FormationBloc>()
        .add(DeleteFormation(formation: widget.formation));
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    players = widget.formation.players.cast<Player>();
    context
        .read<FormationBloc>()
        .add(ChangeFormation(formation: widget.formation.formation));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBarWidget(
                title: widget.formation.title,
                children: [
                  DeleteShareCard(
                    onDelete: onDelete,
                    onShare: onShare,
                  )
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: RepaintBoundary(
                  key: globalKey,
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
                            );
                          }

                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 46),
            ],
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
  );

  final int index;
  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 74,
      child: Column(
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
  });

  final String formation;
  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    final playerRows = formationMap[formation] ?? [];

    return Column(
      children: [
        for (final row in playerRows)
          _Row(
            row.map((index) => _Player(index, players)).toList(),
          ),
        SizedBox(height: 10),
      ],
    );
  }
}
