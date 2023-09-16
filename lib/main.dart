import 'package:flutter/material.dart';
import 'package:cv_app/screens/cv_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV APPLICATION',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CVViewScreen(),
    );
  }
}
