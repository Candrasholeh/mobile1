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
          child: Container(
            width: 100,
            height: 100,
            color: Colors.amber,
            child: Center(child: Text("halo candra")),
          ), // Container
        ), // Center, Scaffold
      ),
    ); // MaterialApp
  }
}