import 'package:app_hortifruit_pratico/app/modules/dashboard/binding.dart';
import 'package:app_hortifruit_pratico/app/modules/dashboard/page.dart';
import 'package:app_hortifruit_pratico/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    )
  ];
}
