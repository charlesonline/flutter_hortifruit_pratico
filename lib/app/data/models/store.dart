import 'package:app_hortifruit_pratico/app/data/models/category.dart';

class StoreModel {
  late int id;
  late String name;
  late String image;
  late bool isOnline;
  late List<CategoryModel> categories;

  StoreModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isOnline,
    required this.categories,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
      id: json['id'],
      name: json['nome'],
      image: json['logo'],
      isOnline: json['online'] == 1,
      categories: json['categorias'] == null
        ? []
        : List<CategoryModel>.from(json['categorias']
            .map((category) => CategoryModel.fromJson(category)))
  );
}
