import 'package:flutter/material.dart';
import 'package:project_mars/screens/home_screen.dart';
import 'package:project_mars/screens/new_task_screen.dart';

import 'data/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.flutterTasks,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/new_task': (newContext) => const NewTaskScreen()
      },
    );
  }
}
