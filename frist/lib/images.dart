import 'package:flutter/material.dart';

void main() {
  runApp(haloCandra());
}

class haloCandra extends StatelessWidget {
  const haloCandra({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightBlue,
              title: Text("Aplikasi Ini Punya candra"),
            ),
            body: Center(child: Image.asset("assets/kopi.png"),
            )));
  }
}