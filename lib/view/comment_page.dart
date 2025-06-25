import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_statemanagment/controller/comment_controller.dart';

class CommentPage extends StatelessWidget {
  CommentPage({super.key});

  final controller = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    // controller.getAllComment();
    return Scaffold(
      body: Center(
        child: GetBuilder<CommentController>(
          builder: (controller) {
            if (controller.comments.isEmpty) {
              return LinearProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: controller.comments.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(controller.comments[index].name),
                  subtitle: Text(controller.comments[index].body),
                ),
              );
            }
          },
          
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   controller.getAllComment();
      // }),
    );
  }
}
