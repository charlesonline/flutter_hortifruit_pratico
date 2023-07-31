import 'package:app_hortifruit_pratico/app/data/models/category.dart';
import 'package:app_hortifruit_pratico/app/data/models/payment_method.dart';
import 'package:app_hortifruit_pratico/app/data/models/shipping_by_city.dart';

class StoreModel {
  late int id;
  late String name;
  late String image;
  late bool isOnline;
  late List<CategoryModel> categories;
  List<ShippingByCityModel> shippingByCity;
  List<PaymentMethodModel> paymentMethods;

  StoreModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isOnline,
    required this.categories,
    required this.shippingByCity,
    required this.paymentMethods,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    id: json['id'],
    name: json['nome'],
    image: json['logo'],
    isOnline: json['online'] == 1,
    categories: json['categorias'] == null
      ? []
      : List<CategoryModel>.from(json['categorias']
        .map((category) => CategoryModel.fromJson(category))),
    shippingByCity: json['cidades'] == null
      ? []
      : List<ShippingByCityModel>.from(json['cidades']
        .map((city) => ShippingByCityModel.fromJson(city))),
    paymentMethods: json['meios_pagamentos'] == null
      ? []
      : List<PaymentMethodModel>.from(json['meios_pagamentos']
        .map((paymentMethod) => PaymentMethodModel.fromJson(paymentMethod))),
  );
}
