import 'package:app_hortifruit_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruit_pratico/app/data/models/store.dart';
import 'package:get/get.dart';

class CartService extends GetxService {
  List<CartProductModel> products = RxList<CartProductModel>.empty();
  final store = Rxn<StoreModel>();
  final observation = RxString('');// ''.obs <- mesma coisa

  void addProductToCart(CartProductModel cartProduct) {
    products.add(cartProduct);
  }

  void removeProductFromCart(CartProductModel cartProduct) {
    products.remove(cartProduct);
  }

  bool isANewStore(StoreModel newStore) {
    return store.value != null && store.value!.id != newStore.id;
  }

  void clearCart() {
    products.clear();
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
    // products.clear();
  }
}
