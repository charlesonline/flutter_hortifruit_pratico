import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        bottomNavigationBar: Obx(
          () => NavigationBar(

            onDestinationSelected: controller.changePageIndex,
            selectedIndex: controller.currentPageIndex.value,

            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                label: 'Início',
                selectedIcon: Icon(Icons.explore),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                label: 'Meu perfil',
                selectedIcon: Icon(Icons.person),
              ),
              NavigationDestination(
                icon: Icon(Icons.view_list_outlined),
                label: 'Meus pedidos',
                selectedIcon: Icon(Icons.view_list),
              ),
            ],
          )
        ),
        body: Obx(
          () => IndexedStack(

            index: controller.currentPageIndex.value,

            children: const [
              Text('Inicio'),
              Text('Meu perfil'),
              Text('Meus pedidos'),
            ],
          )
        )
      );
  }
}
