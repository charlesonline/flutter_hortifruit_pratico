import 'package:app_hortifruit_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruit_pratico/app/routes/routes.dart';
import 'package:app_hortifruit_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx((state) => CustomScrollView(
            slivers: [
              const SliverAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, top: 16, right: 16, bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 96,
                        height: 96,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: state!.image),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.name,
                              style: Get.textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            StoreStatus(isOnline: state.isOnline)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(((context, index) {
                  var category = state.categories[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            color: Colors.grey[200],
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(
                              category.name,
                              style: Get.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                        ],
                      ),
                      for (var product in category.products)
                        ListTile(
                          title: Text(product.name),
                          subtitle: Text(NumberFormat.simpleCurrency().format(product.price) + (product.isKG ? '/Kg' : '')),
                          leading: product.image.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: FadeInImage.memoryNetwork(
                                      imageErrorBuilder:
                                          (context, error, stackTrace) =>
                                              const SizedBox(
                                                width: 56,
                                                height: 56,
                                              ),
                                      placeholder: kTransparentImage,
                                      image: product.image),
                                )
                              : null,
                          onTap: () => Get.toNamed(
                            Routes.product,
                            arguments: {
                              'product': product,
                              'store': state
                            }
                          ),
                        )
                    ],
                  );
                }), childCount: state.categories.length),
              )
            ],
          )),
    );
  }
}
