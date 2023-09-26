import 'package:counterapp/futuraClass/check_box.dart';
import 'package:counterapp/futuraClass/column_row_container_.dart';
import 'package:counterapp/futuraClass/demo.dart';
import 'package:counterapp/futuraClass/json_api.dart';
import 'package:counterapp/futuraClass/radio_button.dart';
import 'package:counterapp/futuraClass/shared_preference.dart';
import 'package:counterapp/futuraClass/stack_radio_button.dart';
import 'package:counterapp/futuraClass/web_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'futuraClass/counter_app.dart';
import 'package:flutter/material.dart';
import 'futuraClass/column_row_container_.dart';
import 'futuraClass/counter_app.dart';
import 'futuraClass/provider/movie_provider.dart';
import 'futuraClass/provider/provider_home_page.dart';
import 'futuraClass/sirSharedPref.dart';

void main() {
  runApp(
      ChangeNotifierProvider<MovieProvider>(child: MyApp(),
      create: (_) => MovieProvider(),),);
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
      home: ProviderHomePage(),
    );
  }
}


