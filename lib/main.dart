import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:elma/models/expense_plan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/expense_plan.dart';
import 'models/expense.dart';

void registerHiveAdapter() {
  Hive.registerAdapter(ExpensePlanAdapter());
  Hive.registerAdapter(ExpenseAdapter());
}

void main() async {
  await Hive.initFlutter();
  registerHiveAdapter();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp()
    )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
