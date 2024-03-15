import 'package:flutter/material.dart';

class CustomContainerHomePage extends StatelessWidget {
  const CustomContainerHomePage({super.key, this.child, this.height});

  final Widget? child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: height,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 245, 246, 250),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: child,
      ),
    );
  }
}
