// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_build_context_synchronously
import 'package:crud_flutter/modules/presentation/bloc/period_events.dart';
import 'package:crud_flutter/modules/presentation/bloc/period_states.dart';
import 'package:crud_flutter/modules/presentation/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../bloc/flutter_bloc_period.dart';
import '../widgets/custom_container.dart';
import '../widgets/text_home_page.dart';
import 'add/add_modal_class.dart';
import 'info/info_modal_class.dart';
import '../widgets/add_new_period.dart';
import '../widgets/custom_exit.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/manrope.dart';
import '../widgets/top_app.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final controller = Modular.get<HomePageController>();

  late final PeriodFlutterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = PeriodFlutterBloc();
    bloc.add(LoadPeriodEvents());
    controller.getAllPeriods();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
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
            BlocBuilder<PeriodFlutterBloc, PeriodState>(
                bloc: bloc,
                builder: (context, state) {
                  final periodsList = state.periods;
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
                            itemCount: periodsList.length,
                            itemBuilder: (context, index) {
                              final periods = periodsList[index];
                              return CustomListTile(
                                period: periods,
                                onTap: () async {
                                  controller.titleController.text =
                                      periods.title;
                                  InfoNewPeriodClass().init(
                                    context: context,
                                    controller: controller,
                                    period: periods,
                                    bloc: bloc,
                                  );
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 10);
                            },
                          ),
                        ),
                        SizedBox(height: 12),
                        AddNewPeriodButton(
                          controller: controller,
                          onTap: () async {
                            controller.inicialize();
                            AddNewPeriodClass().init(
                                context: context,
                                controller: controller,
                                bloc: bloc);
                          },
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                }),
            CustomExit(),
          ],
        ),
      ),
    );
  }
}
