import 'package:flutter/material.dart';
import 'package:tdd_tutorial/core/di/injector_container.dart';
import 'package:tdd_tutorial/my_app_widget.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}
