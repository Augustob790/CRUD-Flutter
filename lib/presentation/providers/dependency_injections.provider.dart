
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/home_page_controller.dart';


class DependecyInjectionsProvider extends StatelessWidget {
  final Widget? child;

  const DependecyInjectionsProvider({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
          create: (context) => HomePageController(),
        ),
      ],
      child: child,
    );
  }
}
