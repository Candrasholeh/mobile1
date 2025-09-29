import 'package:flutter/material.dart';

void main() {
  runApp(HaloCandra());
}

class HaloCandra extends StatelessWidget {
  const HaloCandra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Aplikasi pertamaku"),
        ), // AppBar
        body: Center(
          child: Icon(
            Icons.home,
            size: 90.0,
            color: Colors.red,
          ), // Icon
        ), // Center, Scaffold, MaterialApp
      ),
    );
  }
}