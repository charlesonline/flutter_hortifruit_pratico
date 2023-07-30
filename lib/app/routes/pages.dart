import 'package:app_hortifruit_pratico/app/modules/cart/binding.dart';
import 'package:app_hortifruit_pratico/app/modules/cart/page.dart';
import 'package:app_hortifruit_pratico/app/modules/dashboard/binding.dart';
import 'package:app_hortifruit_pratico/app/modules/dashboard/page.dart';
import 'package:app_hortifruit_pratico/app/modules/product/binding.dart';
import 'package:app_hortifruit_pratico/app/modules/product/page.dart';
import 'package:app_hortifruit_pratico/app/modules/store/binding.dart';
import 'package:app_hortifruit_pratico/app/modules/store/page.dart';
import 'package:app_hortifruit_pratico/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.store,
      page: () => const StorePage(),
      binding: StoreBinding(),
    ),
    GetPage(
      name: Routes.product,
      page: () => const ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.cart,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
  ];
}
