class ProductModel {
  late int id;
  late String name;
  late double price;
  late String unitOfMeasure;
  late String image;
  late String? description;

  bool get isKG => unitOfMeasure == 'KG';

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.unitOfMeasure,
    required this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['nome'],
        price: double.parse(json['preco']),
        unitOfMeasure: json['unidade'],
        image: json['imagem'],
        description: json['descricao'],
      );
}
