import '../../domain/model/ period_model.dart';

abstract class PeriodState {
  List<Period> periods;

  PeriodState({
    required this.periods,
  });
}

class PeriodInitialState extends PeriodState {
  PeriodInitialState() : super(periods: []);
}

class PeriodsLoadSucessState extends PeriodState {
  PeriodsLoadSucessState({required List<Period> periods})
      : super(periods: periods);
}

class PeriodsAddSucessState extends PeriodState {
  PeriodsAddSucessState({required period}) : super(periods: period);
}

class PeriodsUpdateSucessState extends PeriodState {
  PeriodsUpdateSucessState({required period}) : super(periods: period);
}


class PeriodsDeleteSucessState extends PeriodState {
  PeriodsDeleteSucessState({required id}) : super(periods: id);
}
