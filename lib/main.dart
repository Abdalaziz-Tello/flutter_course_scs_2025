import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagment/controller/counter_controller.dart';
import 'package:getx_statemanagment/view/comment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      defaultTransition: Transition.zoom,
      home:CommentPage());
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter with GetBuilder"),actions: [IconButton(onPressed: (){
        Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
      }, icon: Icon(Icons.sunny))],),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (controller) => Text(controller.counter.toString()),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              controller.increament();
            },
          ), FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              controller.decreament();
            },
          ),
        ],
      ),
    );
  }
}

class HomePageWithObserver extends StatelessWidget {
  HomePageWithObserver({super.key});

  final controller = Get.put(CounterControllerWithObserver());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter with Observer"),actions: [IconButton(onPressed: (){
        Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
      }, icon: Icon(Icons.sunny))]),
      body: Center(
        child:Obx(()=>Text(controller.counter.value.toString()))
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "2",
            onPressed: () {
              controller.increament();
            },
          ), FloatingActionButton(
            heroTag: "1",
            onPressed: () {
              controller.decreament();
            },
          ),
        ],
      ),
    );
  }
}
