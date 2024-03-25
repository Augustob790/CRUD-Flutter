import '../../domain/model/ period_model.dart';

abstract class PeriodEvents {}

class LoadPeriodEvents extends PeriodEvents {}

class AddPeriodEvents extends PeriodEvents {
  Period period;

  AddPeriodEvents({
    required this.period,
  });
}

class UpdatePeriodEvents extends PeriodEvents {
  Period period;

  UpdatePeriodEvents({
    required this.period,
  });
}

class DeletePeriodEvents extends PeriodEvents {
  int id;

  DeletePeriodEvents({
    required this.id,
  });
}
