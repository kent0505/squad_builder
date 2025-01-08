part of 'formation_bloc.dart';

@immutable
sealed class FormationState {}

final class FormationInitial extends FormationState {}

final class FormationsLoaded extends FormationState {
  FormationsLoaded({
    required this.formation,
    required this.formations,
    required this.players,
  });

  final String formation;
  final List<Formation> formations;
  final List<Player> players;
}
