// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'presentation/pages/home_page.dart';
import 'presentation/providers/dependency_injections.provider.dart';

void main() async {
  await initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DependecyInjectionsProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRUD - Teste',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NoteListScreen(),
      ),
    );
  }
}

