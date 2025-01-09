class PlayerDetail {
  PlayerDetail({
    required this.name,
    required this.position,
    required this.team,
    required this.number,
    required this.age,
    required this.height,
    required this.yc,
    required this.rc,
    required this.fouls,
    required this.shots,
    required this.goals,
    required this.passes,
    required this.tackles,
  });

  final String name;
  final String position;
  final String team;
  final String number;
  final String age;
  final String height;
  final String yc;
  final String rc;
  final String fouls;
  final String shots;
  final String goals;
  final String passes;
  final String tackles;

  factory PlayerDetail.fromJson(Map<String, dynamic> json) {
    return PlayerDetail(
      name: json['name'] ?? '',
      position: json['position'] ?? '',
      team: json['team'] ?? '',
      number: json['number'] ?? '',
      age: json['age'] ?? '',
      height: json['height'] ?? '',
      yc: json['yc'] ?? '',
      rc: json['rc'] ?? '',
      fouls: json['fouls'] ?? '',
      shots: json['shots'] ?? '',
      goals: json['goals'] ?? '',
      passes: json['passes'] ?? '',
      tackles: json['tackles'] ?? '',
    );
  }
}

PlayerDetail emptyPlayerDetail = PlayerDetail(
  name: '',
  position: '',
  team: '',
  number: '',
  age: '',
  height: '',
  yc: '',
  rc: '',
  fouls: '',
  shots: '',
  goals: '',
  passes: '',
  tackles: '',
);
