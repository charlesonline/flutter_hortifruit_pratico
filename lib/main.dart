import 'package:app_hortifruit_pratico/app/core/theme/app_theme.dart';
import 'package:app_hortifruit_pratico/app/data/providers/api.dart';
import 'package:app_hortifruit_pratico/app/data/services/cart/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'app/routes/pages.dart';
import 'app/routes/routes.dart';

void main() {
  Get.put<Api>(Api());
  Get.put<CartService>(CartService());

  Intl.defaultLocale = 'pt_BR';

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.dashboard,
    theme: themeData,
    getPages: AppPages.pages,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    locale: const Locale('pt', 'BR'),
    supportedLocales: const [Locale('pt', 'BR')],
  ));
}
