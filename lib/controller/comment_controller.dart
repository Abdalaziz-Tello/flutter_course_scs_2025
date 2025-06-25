import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_statemanagment/model/comment_model.dart';



class CommentController extends GetxController{
  List<CommentModel> comments = [];
final middleware = [
  GetMiddleware(priority: 1),
  GetMiddleware(priority: 10)
];
 

 @override
  void onReady() {
    // for (var element in middleware) {
      // if (element.priority==2 ) {
    getAllComment();
        
      // }else {
        // Get.showSnackbar(GetSnackBar(message: "Hello",));
      // }
    // }
    super.onReady();
  }


 void getAllComment()async{
  final resposne =await GetConnect().get("https://jsonplaceholder.typicode.com/comments");
  if (resposne.isOk) {
    for (var i = 0; i < resposne.body.length; i++) {
      comments.add(CommentModel.fromJson(resposne.body[i]));
    }
    update();
  } else {
    print(resposne.statusText);
    Get.snackbar("Sorry","There is a problem With your connection");
  }
  }
}