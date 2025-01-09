import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import '../models/player.dart';
import '../models/player_detail.dart';

class PlayerApi {
  final _dio = Dio();
  final _options = Options(
    validateStatus: (status) => true,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  );

  String baseUrl = dotenv.env['URL'] ?? '';

  // Future<List<Player>> getPlayers() async {
  //   try {
  //     final response = await _dio.get(
  //       '$baseUrl/players',
  //       options: _options,
  //     );

  //     print(response.statusCode);

  //     List<dynamic> data = response.data['players'];

  //     // List<Player> matches = data.map((json) {
  //     //   return Player.fromJson(json);
  //     // }).toList();

  //     print(matches.length);

  //     return matches;
  //   } on Object catch (error, stackTrace) {
  //     Error.throwWithStackTrace(error, stackTrace);
  //   }
  // }

  Future<PlayerDetail> getPlayer(int pid) async {
    try {
      final response = await _dio.get(
        '$baseUrl/player/$pid',
        options: _options,
      );
      print(response.data);
      return PlayerDetail.fromJson(response.data['player']);
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}
