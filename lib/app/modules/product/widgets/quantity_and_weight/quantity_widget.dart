import 'package:app_hortifruit_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    var isKg = controller.isKg;

    return Row(
      children: [
        ElevatedButton(
          onPressed: quantity > 0
              ? () => controller.changeQuantity(quantity - 1)
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.remove),
        ),
        Expanded(
            child: Center(
          child: Text(
            '$quantity' + (isKg ? '/Kg' : ''),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        )),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}