import 'package:flutter/material.dart';
import 'package:presentation/app/application.dart';
import 'package:presentation/injectors/all.dart';

class AppCore extends StatelessWidget {
  const AppCore();

  static Future<void> initConfig() async {
    await configureDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Application();
  }
}
