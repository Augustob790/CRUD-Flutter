import '../../data/repositories/period_repository.dart';
import '../exception/period_exception.dart';
import '../model/ period_model.dart';

abstract class InsertPeriodUsecase {
  Future<void> call(Period period);
}

class InsertPeriodUsecaseImpl implements InsertPeriodUsecase {
  final PeriodRepository repository;

  InsertPeriodUsecaseImpl({required this.repository});

  @override
  Future<void> call(Period period) async {
    try {
      return repository.addPeriod(period);
    } on PeriodException {
      rethrow;
    }
  }
}
