import 'package:flutter/material.dart';
import 'package:flutter_application_19/dismisible.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyDismissible(),
    );
  }
}
