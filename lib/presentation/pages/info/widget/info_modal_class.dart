// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../../../../domain/model/ period_model.dart';
import '../../../controller/home_page_controller.dart';
import '../../edit/edit_modal_class.dart';
import '../info_modal.dart';

class InfoNewPeriodClass {
  init({
    required BuildContext context,
    required HomePageController controller,
    required Period period,
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
                await controller.delete(period.id!);
                controller.getAllNotes();
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
                EditNewPeriodClass().init(context: context, id: period.id, controller: controller);
              },
            ));
      },
    );
  }
}
