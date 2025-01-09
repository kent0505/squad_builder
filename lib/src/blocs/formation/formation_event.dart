part of 'formation_bloc.dart';

@immutable
sealed class FormationEvent {}

class GetFormations extends FormationEvent {}

class ChangeFormation extends FormationEvent {
  ChangeFormation({required this.formation});

  final String formation;
}

class AddFormation extends FormationEvent {
  AddFormation({required this.formation});

  final Formation formation;
}

class DeleteFormation extends FormationEvent {
  DeleteFormation({required this.formation});

  final Formation formation;
}

class SelectPlayer extends FormationEvent {
  SelectPlayer({
    required this.player,
    required this.index,
    required this.formation,
  });

  final Player player;
  final int index;
  final String formation;
}

class DeleteAllFormations extends FormationEvent {}
