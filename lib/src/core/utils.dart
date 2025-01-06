import '../models/league.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

bool getButtonActive(List<League> leagues) {
  for (League league in leagues) {
    if (league.selected) return true;
  }
  return false;
}
