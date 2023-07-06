import 'package:app_hortifruit_pratico/app/modules/dashboard/controller.dart';
import 'package:get/get.dart';

class DashboardBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
