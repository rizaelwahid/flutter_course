import 'package:bloc_starter/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.onRizaWays,
    );
  }
}
