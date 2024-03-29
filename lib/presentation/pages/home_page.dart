// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_container.dart';
import '../widgets/text_home_page.dart';
import 'add/add_modal_class.dart';
import 'info/info_modal_class.dart';
import '../widgets/add_new_period.dart';
import '../widgets/custom_exit.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/manrope.dart';
import '../controller/home_page_controller.dart';
import '../widgets/top_app.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<HomePageController>(context, listen: false);
    controller.getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Manrope(
          text: "Configurações",
          color: Color.fromARGB(255, 12, 11, 11),
          font: FontWeight.w500,
          size: 22,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Consumer<HomePageController>(
              builder: (context, controller, child) {
                return Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TopApp(),
                      Divider(height: 40),
                      TextHomePage(text: "Períodos"),
                      CustomContainerHomePage(
                        height: 330,
                        child: ListView.separated(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                          shrinkWrap: true,
                          itemCount: controller.periods.length,
                          itemBuilder: (context, index) {
                            final periods = controller.periods[index];
                            return CustomListTile(
                              period: periods,
                              onTap: () async {
                                controller.titleController.text = periods.title;
                                InfoNewPeriodClass().init(
                                  context: context,
                                  controller: controller,
                                  period: periods,
                                );
                              },
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10);
                          },
                        ),
                      ),
                      SizedBox(height: 12),
                      AddNewPeriodButton(
                        controller: controller,
                        onTap: () async {
                          controller.inicialize();
                          AddNewPeriodClass()
                              .init(context: context, controller: controller);
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
            CustomExit(),
          ],
        ),
      ),
    );
  }
}
