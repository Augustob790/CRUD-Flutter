
import 'package:crud_flutter/modules/data/repositories/period_repository.dart';
import 'package:crud_flutter/modules/presentation/bloc/period_events.dart';
import 'package:crud_flutter/modules/presentation/bloc/period_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeriodFlutterBloc extends Bloc<PeriodEvents, PeriodState> {
  final repository = PeriodRepositoryImpl();

  PeriodFlutterBloc() : super(PeriodInitialState()) {
    on<LoadPeriodEvents>(((event, emit) async {
      emit(PeriodsLoadSucessState(periods: await repository.getAllPeriods()));
    }));

    on<AddPeriodEvents>(((event, emit) {
      emit(PeriodsAddSucessState(period: repository.addPeriod(event.period)));
    }));

    on<UpdatePeriodEvents>(((event, emit) {
      emit(PeriodsUpdateSucessState(
          period: repository.updatePeriod(event.period)));
    }));

    on<DeletePeriodEvents>(((event, emit) {
      emit(PeriodsDeleteSucessState(id: repository.deletePeriod(event.id)));
    }));
  }
}
