part of 'formation_bloc.dart';

@immutable
sealed class FormationState {}

final class FormationInitial extends FormationState {}

final class FormationsLoaded extends FormationState {
  FormationsLoaded({
    required this.formation,
    required this.formations,
  });

  final String formation;
  final List<Formation> formations;
}

final class PlayerSelected extends FormationState {
  PlayerSelected({
    required this.player,
    required this.index,
  });

  final Player player;
  final int index;
}
