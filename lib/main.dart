import 'package:counterapp/futuraClass/check_box.dart';
import 'package:counterapp/futuraClass/column_row_container_.dart';
import 'package:counterapp/futuraClass/radio_button.dart';
import 'package:counterapp/futuraClass/stack_radio_button.dart';
import 'futuraClass/counter_app.dart';
import 'package:flutter/material.dart';
import 'futuraClass/column_row_container_.dart';
import 'futuraClass/counter_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    );
  }
}
