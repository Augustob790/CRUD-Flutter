import 'package:crud_flutter/modules/data/repositories/period_repository.dart';
import '../exception/period_exception.dart';
import '../model/ period_model.dart';

abstract class GetAllPeriodUsecase {
  Future<List<Period>> call();
}

class GetAllPeriodUsecaseImpl implements GetAllPeriodUsecase {
  final PeriodRepository repository;

  GetAllPeriodUsecaseImpl({required this.repository});

  @override
  Future<List<Period>> call() async {
    try {
      return repository.getAllPeriods();
    } on PeriodException {
      rethrow;
    }
  }
}
