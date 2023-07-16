import 'package:app_hortifruit_pratico/app/modules/product/controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
