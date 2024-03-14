// ignore_for_file: use_build_context_synchronously

import 'package:crud_flutter/presentation/pages/edit/widget/edit_modal.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/ period_model.dart';
import '../../controller/home_page_controller.dart';

class EditNewPeriodClass {
  init({
    required BuildContext context,
    required HomePageController controller,
    required int? id,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          contentPadding: const EdgeInsets.all(0),
          content: EditNewPeriod(
              controller: controller,
              add: () async {
                if (controller.titleController.text.isNotEmpty && controller.dropdownCategoryValue.isNotEmpty) {
                  await controller.update(Period(
                    id: id,
                    title: controller.titleController.text,
                    category: controller.dropdownCategoryValue,
                    dataInit: controller.dateInit.toIso8601String(),
                    dateFinal: controller.dateFinal.toIso8601String(),
                    meta1: controller.meta1.text,
                    meta2: controller.meta2.text,
                  ));
                }
                controller.getAllNotes();
                Navigator.pop(context);
              }),
        );
      },
    );
  }
}
