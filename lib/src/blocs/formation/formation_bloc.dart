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
        players: [],
      ));
    });

    on<AddFormation>((event, emit) async {
      List<Formation> formations = await getFormations();
      formations.insert(0, event.formation);
      formations = await updateFormations(formations);

      emit(FormationsLoaded(
        formation: '4-4-2',
        formations: formations,
        players: [],
      ));
    });

    on<DeleteFormation>((event, emit) async {
      List<Formation> formations = await getFormations();
      formations.removeWhere((element) => element.id == event.formation.id);
      formations = await updateFormations(formations);

      emit(FormationsLoaded(
        formation: '4-4-2',
        formations: formations,
        players: [],
      ));
    });
  }
}
