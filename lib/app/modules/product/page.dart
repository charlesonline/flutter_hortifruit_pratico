import 'package:app_hortifruit_pratico/app/modules/product/controller.dart';
import 'package:app_hortifruit_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductPage extends GetView<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var product = controller.product.value!;

    return Scaffold(
        appBar: AppBar(title: Text(product.name)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              if (product.image.isNotEmpty)
                Align(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage, image: product.image),
                  ),
                ),
              if (product.description != null)
                Text(
                  product.description!,
                  style: Get.textTheme.titleMedium,
                ),
              Text(
                NumberFormat.simpleCurrency().format(product.price) + (product.isKG ? '/Kg' : ''),
                style: Get.textTheme.titleLarge,
              ),
              TextField(
                controller: controller.observationController,
                decoration: const InputDecoration(labelText: 'Observação'),
                maxLength: 50,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  children: [
                    Text(
                      'Altere ' + (product.isKG ? 'o peso' : 'a quantidade'),
                      style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    QuantityAndWeightWidget(isKg: product.isKG),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () => controller.addToCart(),
                  child: const Text('Adcionar ao carrinho')),
              )
            ],
          ),
        ));
  }
}
