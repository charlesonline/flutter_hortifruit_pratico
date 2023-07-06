import 'package:app_hortifruit_pratico/app/modules/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
