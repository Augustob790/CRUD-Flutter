import 'package:crud_flutter/modules/domain/usecases/get_all_period.dart';
import 'package:crud_flutter/modules/domain/usecases/insert_period.dart';
import 'package:crud_flutter/modules/domain/usecases/update_period.dart';
import 'package:crud_flutter/modules/presentation/controller/home_page_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/data/repositories/period_repository.dart';
import 'modules/domain/usecases/delete_period.dart';
import 'modules/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton((i) => PeriodRepositoryImpl());
    i.addLazySingleton(
        (i) => GetAllPeriodUsecaseImpl(repository: Modular.get()));
    i.addLazySingleton(
        (i) => DeletePeriodUsecaseImpl(repository: Modular.get()));
    i.addLazySingleton(
        (i) => InsertPeriodUsecaseImpl(repository: Modular.get()));
    i.addLazySingleton(
        (i) => UpdatePeriodUsecaseImpl(repository: Modular.get()));

    i.add((i) => HomePageController(
          getAllPeriodUsecase: i.get<GetAllPeriodUsecase>(),
          deletePeriodUsecase: i.get<DeletePeriodUsecase>(),
          insertPeriodUsecase: i.get<InsertPeriodUsecase>(),
          updatePeriodUsecase: i.get<UpdatePeriodUsecase>(),
        ));
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const NoteListScreen());
  }
}
