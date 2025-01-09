import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/db.dart';
import '../../models/formation.dart';
import '../../models/player.dart';

part 'formation_event.dart';
part 'formation_state.dart';

class FormationBloc extends Bloc<FormationEvent, FormationState> {
  FormationBloc() : super(FormationInitial()) {
    on<ChangeFormation>((event, emit) async {
      List<Formation> formations = await getFormations();

      emit(FormationsLoaded(
        formation: event.formation,
        formations: formations,
      ));
    });

    on<AddFormation>((event, emit) async {
      List<Formation> formations = await getFormations();
      formations.insert(0, event.formation);
      formations = await updateFormations(formations);

      emit(FormationsLoaded(
        formation: '4-4-2',
        formations: formations,
      ));
    });

    on<DeleteFormation>((event, emit) async {
      List<Formation> formations = await getFormations();
      formations.removeWhere((element) => element.id == event.formation.id);
      formations = await updateFormations(formations);

      emit(FormationsLoaded(
        formation: '4-4-2',
        formations: formations,
      ));
    });

    on<SelectPlayer>((event, emit) async {
      emit(PlayerSelected(
        player: event.player,
        index: event.index,
      ));

      List<Formation> formations = await getFormations();

      emit(FormationsLoaded(
        formation: event.formation,
        formations: formations,
      ));
    });

    on<DeleteAllFormations>((event, emit) async {
      List<Formation> formations = await updateFormations([]);
      emit(FormationsLoaded(
        formation: '4-4-2',
        formations: formations,
      ));
    });
  }
}
