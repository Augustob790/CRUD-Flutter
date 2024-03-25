// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../domain/model/ period_model.dart';
import '../../bloc/flutter_bloc_period.dart';
import '../../bloc/period_events.dart';
import '../../controller/home_page_controller.dart';
import '../edit/edit_modal_class.dart';
import 'widget/info_modal.dart';

class InfoNewPeriodClass {
  init({
    required BuildContext context,
    required HomePageController controller,
    required Period period,
    //required PeriodBloc bloc,
    required PeriodFlutterBloc bloc,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            scrollable: true,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            contentPadding: const EdgeInsets.all(0),
            content: InfoPeriod(
              controller: controller,
              category: period.category,
              meta1: period.meta1,
              meta2: period.meta2,
              dateInit: period.dataInit,
              dateFinal: period.dateFinal,
              excluir: () async {
                bloc.add(DeletePeriodEvents(id: period.id!));
                bloc.add(LoadPeriodEvents());
                Navigator.pop(context);
              },
              editar: () async {
                Navigator.pop(context);
                controller.titleController.text = period.title;
                controller.onSelectedCategory(period.category);
                controller.dateFinal = DateTime.parse(period.dateFinal);
                controller.dateInit = DateTime.parse(period.dataInit);
                controller.meta1.text = period.meta1;
                controller.meta2.text = period.meta2;
                EditNewPeriodClass().init(
                    context: context,
                    id: period.id,
                    controller: controller,
                    bloc: bloc);
              },
            ));
      },
    );
  }
}
