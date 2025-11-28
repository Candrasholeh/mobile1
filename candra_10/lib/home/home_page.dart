import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController c = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Simple State")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "Counter: ${c.counter}",
              style: TextStyle(fontSize: 28),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: c.increment,
              child: Text("Tambah"),
            )
          ],
        ),
      ),
    );
  }
}
