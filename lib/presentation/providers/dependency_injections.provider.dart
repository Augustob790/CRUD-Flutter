import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/repositories/period_repository.dart';
import '../../domain/usecases/delete_period.dart';
import '../../domain/usecases/get_all_period.dart';
import '../../domain/usecases/insert_period.dart';
import '../../domain/usecases/update_period.dart';
import '../controller/home_page_controller.dart';

class DependecyInjectionsProvider extends StatelessWidget {
  final Widget? child;
  const DependecyInjectionsProvider({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PeriodRepository>(
          create: (_) => PeriodRepositoryImpl(),
        ),
        Provider<GetAllPeriodUsecase>(
            create: (context) => GetAllPeriodUsecaseImpl(
                repository: context.read<PeriodRepository>())),
        Provider<InsertPeriodUsecase>(
          create: (context) => InsertPeriodUsecaseImpl(
              repository: context.read<PeriodRepository>()),
        ),
        Provider<UpdatePeriodUsecase>(
          create: (context) => UpdatePeriodUsecaseImpl(
              repository: context.read<PeriodRepository>()),
        ),
        Provider<DeletePeriodUsecase>(
          create: (context) => DeletePeriodUsecaseImpl(
              repository: context.read<PeriodRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomePageController(
            getAllPeriodUsecase: context.read<GetAllPeriodUsecase>(),
            insertPeriodUsecase: context.read<InsertPeriodUsecase>(),
            updatePeriodUsecase: context.read<UpdatePeriodUsecase>(),
            deletePeriodUsecase: context.read<DeletePeriodUsecase>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
