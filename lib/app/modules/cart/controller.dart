import 'package:app_hortifruit_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruit_pratico/app/data/services/cart/service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _cartService = Get.find<CartService>();

  List<CartProductModel> get products => _cartService.products;

  void removePrduct(CartProductModel cartProduct) {
    _cartService.removeProductFromCart(cartProduct);
  }
}
