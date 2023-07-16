import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Hortifruit pratico')),
        body: controller.obx(
            (state) => ListView(
                  children: [
                    for (var store in state!)
                      ListTile(
                        title: Text(store.name),
                        leading: Container(
                          width: 56,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: store.image),
                          ),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: store.isOnline ? Colors.green : Colors.black45,
                            border: Border.all(color: Colors.black12,width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            store.isOnline ? 'Aberto' : 'Fechado',
                            style: Get.textTheme.bodyMedium!.copyWith(color: Colors.white),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                        onTap: () {},
                      )
                  ],
                ),
            onEmpty: const Center(
              child: Text("Não temos estabelecimentos"),
            ),
            onError: (error) => Center(
                  child: Text(error!),
                )));
  }
}
