import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_statemanagment/main.dart';

class CounterController extends GetxController {
  int counter = 0;

  increament() {
    counter++;
    update();
  }


  decreament(){
    counter--;
    update();
  }
}



class CounterControllerWithObserver extends GetxController {
  RxInt counter = 0.obs;

  increament() {
    counter.value++;
    if (counter.value>10) {
      Get.to(()=>HomePage());
    }
  }


  decreament(){
    if (counter.value<=0) {
      Get.snackbar("Hello", "World");
    } else {
      Get.showSnackbar(GetSnackBar(message: "Hello World",));
    counter.value--;
      
    }

  }
}