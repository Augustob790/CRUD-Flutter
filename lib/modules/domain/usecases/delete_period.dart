import '../../data/repositories/period_repository.dart';
import '../exception/period_exception.dart';

abstract class DeletePeriodUsecase {
  Future<void> call(int period);
}

class DeletePeriodUsecaseImpl implements DeletePeriodUsecase {
  final PeriodRepository repository;

  DeletePeriodUsecaseImpl({required this.repository});

  @override
  Future<void> call(int period) async {
    try {
      return repository.deletePeriod(period);
    } on PeriodException {
      rethrow;
    }
  }
}
