import 'package:app_hortifruit_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruit_pratico/app/modules/cart/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Meu carrinho')),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TextField(
                    controller: controller.observationController,
                    decoration: const InputDecoration(labelText: 'Observação'),
                    maxLength: 80,
                  ),
                ),

                if (controller.store != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(controller.store!.name),
                    ),
                  ),

                for (var cartProduct in controller.products)
                  ListTile(
                    title: Text(cartProduct.product.name),
                    subtitle: Text('${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.product.price)})'),
                    leading: _buildProductQuantity(cartProduct),
                    trailing: IconButton(onPressed: () => controller.removePrduct(cartProduct), icon: const Icon(Icons.delete)),
                  ),
                
                if (controller.products.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Text("Seu carrinho está vazio!"),
                  )
                else
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text("Avançar")
                  ),
              ],
          )
        ),
        ));
  }

  Widget _buildProductQuantity(CartProductModel cartProduct) {
    return Text(NumberFormat.decimalPattern().format(cartProduct.quantity) +
        (cartProduct.product.isKG ? 'Kg' : 'x'));
  }
}
