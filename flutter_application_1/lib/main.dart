import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi App",
      home: PlansBook(),
    );
  }
}

class PlansBook extends StatelessWidget {
  const PlansBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        title: Text("Medicina Natural"),
        titleTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}