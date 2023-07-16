import 'package:app_hortifruit_pratico/app/data/models/product.dart';

class CategoryModel {
  late int id;
  late String name;
  late List<ProductModel> products;

  CategoryModel({
    required this.id,
    required this.name,
    required this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'],
    name: json['nome'],
    products: json['produtos'] == null
      ? []
      : List<ProductModel>.from(
        json['produtos'].map((product) => ProductModel.fromJson(product))
      )
  );
}