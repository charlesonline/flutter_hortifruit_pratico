import 'package:app_hortifruit_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruit_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx((state) => ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 96,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: state!.image),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.name,
                            style: Get.textTheme.headline5,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          StoreStatus(isOnline: state.isOnline)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
