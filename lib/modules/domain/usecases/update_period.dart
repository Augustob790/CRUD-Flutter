
import '../../data/repositories/period_repository.dart';
import '../exception/period_exception.dart';
import '../model/ period_model.dart';

abstract class UpdatePeriodUsecase {
  Future<void> call(Period period);
}

class UpdatePeriodUsecaseImpl implements UpdatePeriodUsecase {
  final PeriodRepository repository;

  UpdatePeriodUsecaseImpl({required this.repository});

  @override
  Future<void> call(Period period) async {
    try {
      return repository.updatePeriod(period);
    } on PeriodException {
      rethrow;
    }
  }
}
