import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final counter = 0.obs;

  void increment() => counter.value++;
}
