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
        body: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              color: Colors.blue,
              child: Text("1"),
            ), // Container 1 (Biru)
            Container(
              width: 90,
              height: 90,
              color: Colors.green,
              child: Text("2"),
            ), // Container 2 (Hijau)
            Container(
              width: 90,
              height: 90,
              color: Colors.yellow,
              child: Text("3"),
            ), // Container 3 (Kuning)
          ],
        ), // Row
      ), // Scaffold
    ); // MaterialApp
  }
}