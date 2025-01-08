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
