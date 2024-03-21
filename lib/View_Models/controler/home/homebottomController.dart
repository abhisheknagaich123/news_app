import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app/View_Models/controler/bottomnavbarController.dart';
import 'package:news_app/view/home_View/Bottomanvabar.dart';

class homebottomController extends StatefulWidget {
  const homebottomController({super.key});

  @override
  State<homebottomController> createState() => _homebottomControllerState();
}

class _homebottomControllerState extends State<homebottomController> {
  bottomnavbarcontroller controller = Get.put(bottomnavbarcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: bottomnavbar(),
      body: Obx(() => controller.pages[controller.index.value]),
    );
  }
}
