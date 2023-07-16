import 'package:app_hortifruit_pratico/app/modules/product/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(controller.product.value!.name)),
        body: SafeArea(child: Text('ProductController')));
  }
}
