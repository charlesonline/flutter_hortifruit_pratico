import 'package:app_hortifruit_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruit_pratico/app/data/models/product.dart';
import 'package:app_hortifruit_pratico/app/data/models/store.dart';
import 'package:app_hortifruit_pratico/app/data/services/cart/service.dart';
import 'package:app_hortifruit_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();
  final _cartService = Get.find<CartService>();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];

    super.onInit();
  }

  void addToCart() {
    var quantity = Get.find<QuantityAndWeightController>().quantity;

    _cartService.addProductToCart(CartProductModel(
        product: product.value!,
        quantity: quantity,
        observation: observationController.text));

    // Get.snackbar("O item ${product.value!.name} foi adicionado", "");
    // Get.rawSnackbar(
    //   message: "O item ${product.value!.name} foi adicionado",
    //   snackStyle: SnackStyle.GROUNDED
    // );
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(SnackBar(
        content: Text("O item ${product.value!.name} foi adicionado")));

    Future.delayed(const Duration(milliseconds: 800), Get.back);
  }
}
