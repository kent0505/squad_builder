import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/player/player_bloc.dart';
import '../models/player.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/button.dart';
import '../widgets/player_card.dart';
import '../widgets/svg_widget.dart';
import 'player_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    this.select = false,
  });

  final bool select;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();

  List<Player> searchPlayers(List<Player> players, String text) {
    List<Player> suggestionList = text.isEmpty
        ? []
        : players.where((player) {
            return player.name.toLowerCase().contains(text.toLowerCase());
          }).toList();
    return suggestionList;
  }

  void onSearch(String value) {
    setState(() {});
  }

  void onClear() {
    if (controller.text.isNotEmpty) {
      setState(() {
        controller.clear();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          if (state is PlayersLoaded) {
            final players = searchPlayers(state.players, controller.text);

            return Column(
              children: [
                AppBarWidget(title: 'Search'),
                SizedBox(height: 10),
                Container(
                  height: 44,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xff2C2E31),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  child: TextField(
                    controller: controller,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    style: TextStyle(
                      color: Color(0xffE6E6E6),
                      fontSize: 16,
                      fontFamily: 'w600',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search Player',
                      hintStyle: TextStyle(
                        color: Color(0xff5B5858),
                        fontSize: 14,
                        fontFamily: 'w400',
                      ),
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgWidget('assets/search.svg'),
                        ],
                      ),
                      suffixIcon: Button(
                        onPressed: onClear,
                        minSize: 44,
                        child: Icon(
                          Icons.close_rounded,
                          size: 28,
                          color: Color(0xffD85007),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 12,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    onChanged: onSearch,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
                SizedBox(height: 10),
                if (controller.text.isEmpty || players.isEmpty) ...[
                  SizedBox(height: 80),
                  Text(
                    players.isEmpty && controller.text.isNotEmpty
                        ? 'Oops! No matches found. Try a\ndifferent name or check your spelling.'
                        : 'Start typing the player\'s name to find\nyour desired match from the\ncomplete list.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff5B5858),
                      fontSize: 12,
                      fontFamily: 'w600',
                    ),
                  )
                ] else
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        return PlayerCard(
                          player: players[index],
                          onPressed: () {
                            widget.select
                                ? Navigator.pop(context, players[index])
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PlayerDetailsPage(
                                          player: state.players[index],
                                        );
                                      },
                                    ),
                                  );
                          },
                        );
                      },
                    ),
                  ),
              ],
            );
          }

          return Container();
        },
      ),
    );
  }
}
