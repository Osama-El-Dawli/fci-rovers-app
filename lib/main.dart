import 'package:flutter/material.dart';

void main() {
  runApp(const FciRoversApp());
}

class FciRoversApp extends StatelessWidget {
  const FciRoversApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCI Rovers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffe4b61e)),
      ),
      home: const Scaffold(body: Center(child: Text('Welcome to FCI Rovers!'))),
    );
  }
}
