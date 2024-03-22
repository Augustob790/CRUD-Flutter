
// ignore_for_file: depend_on_referenced_packages

import 'package:crud_flutter/app_module.dart';
import 'package:crud_flutter/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  await initializeDateFormatting();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}


