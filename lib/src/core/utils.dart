import 'package:intl/intl.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date);
}

// bool getButtonActive(List<League> leagues) {
//   return leagues.any((league) => league.selected);
// }

// int getSelectedLeagues(List<League> leagues) {
//   return leagues.where((league) => league.selected).length;
// }

final formationMap = {
  '4-4-2': [
    [0, 1],
    [2, 3, 4, 5],
    [6, 7, 8, 9],
    [10],
  ],
  '3-4-3': [
    [0, 1, 2],
    [3, 4, 5, 6],
    [7, 8, 9],
    [10],
  ],
  '4-1-2-1-2': [
    [0, 1],
    [2],
    [3, 4],
    [5],
    [6, 7, 8, 9],
    [10],
  ],
};
