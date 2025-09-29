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
        body: Stack(
          children: [
            // Container 1 (Paling Bawah - Biru)
            Container(
              width: 125,
              height: 125,
              color: Colors.blue,
              child: Text("1"),
            ), // Container
            // Container 2 (Tengah - Hijau)
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: Text("2"),
            ), // Container
            // Container 3 (Paling Atas - Kuning)
            Container(
              width: 75,
              height: 75,
              color: Colors.yellow,
              child: Text("3"),
            ), // Container
          ],
        ), // Stack
      ), // Scaffold
    ); // MaterialApp
  }
}