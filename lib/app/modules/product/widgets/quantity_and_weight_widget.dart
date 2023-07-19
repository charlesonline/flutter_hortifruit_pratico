import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightWidget extends StatelessWidget {
  bool isKg;

  QuantityAndWeightWidget({this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
        init: QuantityAndWeightController(isKg: isKg),
        builder: (controller) => Column(
              children: [
                QuantityWidget(),
                if (isKg) WeightWidget(),
              ],
            ));
  }
}

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

class WeightWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(NumberFormat.decimalPattern().format(controller.min)),
        Expanded(child: Slider(
          min: controller.min,
          max: controller.max,
          divisions: 19,
          label: controller.label,
          value: controller.weight,
          onChanged: controller.changeWeight
        )),
        Text(NumberFormat.decimalPattern().format(controller.max)),
      ],
    );
  }
}

class QuantityAndWeightController extends GetxController {
  bool isKg;

  QuantityAndWeightController({required this.isKg});

  num quantity = 1;
  double get weight => quantity.toDouble();
  late double min;
  late double max;
  String get label {
    String unit = 'Kg';
    String pattern = '0.00';
    var number = weight;

    if (number < 1) {
      number *= 1000;
      unit = 'g';
      pattern = '';
    }

    return NumberFormat(pattern).format(number) + unit;
  }

  @override
  void onInit() {
    _updateMinAndMax();

    super.onInit();
  }

  void changeQuantity(num value) {
    if (value < 0) {
      quantity = 0;
    } else {
      quantity = value;
    }

    _updateMinAndMax();
    update();
  }

  void changeWeight(double value) {
    quantity = value;

    update();
  }

  _updateMinAndMax() {
    min = weight - 1 + 0.05;
    max = weight;

    if (min < 0) {
      min = 0.05;
      max = 1;
    }
  }
}
