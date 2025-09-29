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
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 10 Container dengan warna yang berbeda-beda
              Container(
                width: 150, // Menggunakan lebar dan tinggi tetap agar terlihat
                height: 150,
                color: Colors.red.shade100,
                child: Center(child: Text("1")),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red.shade300,
                child: Center(child: Text("2")),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red.shade500,
                child: Center(child: Text("3", style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.red.shade700,
                child: Center(child: Text("4", style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blue.shade100,
                child: Center(child: Text("5")),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blue.shade300,
                child: Center(child: Text("6")),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blue.shade500,
                child: Center(child: Text("7", style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.blue.shade700,
                child: Center(child: Text("8", style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green.shade500,
                child: Center(child: Text("9", style: TextStyle(color: Colors.white))),
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.green.shade700,
                child: Center(child: Text("10", style: TextStyle(color: Colors.white))),
              ),
            ],
          ), // Column
        ), // SingleChildScrollView
      ), // Scaffold
    ); // MaterialApp
  }
}